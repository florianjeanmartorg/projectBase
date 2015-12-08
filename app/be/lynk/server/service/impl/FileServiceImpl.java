package be.lynk.server.service.impl;

import be.lynk.server.model.entities.Account;
import be.lynk.server.model.entities.StoredFile;
import be.lynk.server.service.FileService;
import be.lynk.server.service.StoredFileService;
import be.lynk.server.util.KeyGenerator;
import be.lynk.server.util.exception.MyRuntimeException;
import be.lynk.server.util.file.FileUtil;
import be.lynk.server.util.message.ErrorMessageEnum;
import ij.ImagePlus;
import ij.io.FileInfo;
import net.coobird.thumbnailator.Thumbnails;
import net.coobird.thumbnailator.resizers.configurations.Antialiasing;
import net.coobird.thumbnailator.resizers.configurations.Rendering;
import org.springframework.beans.factory.annotation.Autowired;
import play.Logger;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.*;
import java.util.Base64;
import java.util.Date;

/**
 * Created by florian on 7/07/15.
 */
@org.springframework.stereotype.Component
public class FileServiceImpl implements FileService {

    @Autowired
    private StoredFileService storedFileService;

    public static final String[] IMAGE_POST = new String[]{"bmp", "jpeg", "jpg", "png"};

    @Override
    public StoredFile uploadWithSize(play.mvc.Http.MultipartFormData.FilePart filePart, Account account) {
        String fileName = filePart.getFilename();
        File file = filePart.getFile();
        return uploadWithSize(file, fileName, account);

    }

    @Override
    public StoredFile uploadWithSize(File file, String fileName, Account account) {
        return uploadWithSize(file, fileName, null, null, account);

    }

    @Override
    public StoredFile uploadWithSize(play.mvc.Http.MultipartFormData.FilePart filePart, Integer sizex, Integer sizey, Account account) {

        String fileName = filePart.getFilename();
        File file = filePart.getFile();

        return uploadWithSize(file, fileName, sizex, sizey, account);
    }

    @Override
    public StoredFile uploadWithSize(File file, String fileName, Integer sizex, Integer sizey, Account account) {
        return uploadWithSize(file, fileName, sizex, sizey, account, false);
    }

    @Override
    public StoredFile uploadWithSize(File file, String fileName, Integer sizex, Integer sizey, Account account, boolean continueIfTooLittle) {

        try {
            long t = new Date().getTime();

            String[] split = fileName.split("\\.");
            String type = split[split.length - 1];


            boolean isImage = false;
            for (String s : IMAGE_POST) {
                if (s.equalsIgnoreCase(type)) {
                    isImage = true;
                }
            }

            Logger.info("..>T1 : " + (new Date().getTime() - t));

            //create the entity
            StoredFile storedFile = new StoredFile(fileName, generateStorageKey(), 0, account, isImage);

            BufferedImage originalImage = null;

            Logger.info("..>T1.1 : " + (new Date().getTime() - t));
            File resizeFile = File.createTempFile("temp", ".png");
            Logger.info("..>T1.2 : " + (new Date().getTime() - t));
            originalImage = ImageIO.read(file);

            Logger.info("..>T2 : " + (new Date().getTime() - t));

            //Treatment
            if (sizex != null || sizey != null) {

                //start to save the original file
//                storedFile.setStoredNameOriginalSize(generateStorageKey());
//                FileUtil.save(file, storedFile.getStoredNameOriginalSize());

                int sizexPicture = originalImage.getWidth(),
                        sizeyPicture = originalImage.getHeight();

                //1) sizeX and sizeY are the minimal size :
                if (!continueIfTooLittle && ((sizex != null && sizexPicture < sizex) || (sizey != null && sizeyPicture < sizey))) {

                    //reject because the picrture is too little
                    if (sizey == null) {
                        throw new MyRuntimeException(ErrorMessageEnum.ERROR_PICTURE_WRONG_SIZE_X, sizex);
                    } else if (sizex == null) {
                        throw new MyRuntimeException(ErrorMessageEnum.ERROR_PICTURE_WRONG_SIZE_Y, sizey);

                    } else {
                        throw new MyRuntimeException(ErrorMessageEnum.ERROR_PICTURE_WRONG_SIZE, sizex, sizey);
                    }
                } else if (sizex != null && sizey != null) {

                    if (sizex != sizexPicture || sizey != sizeyPicture) {
                        //=> two dimension
                        //1) compute proportion
                        double xProportion = (double) sizexPicture / (double) sizex;
                        double yProportion = (double) sizeyPicture / (double) sizey;

                        //2 start to resize with the lower proportion
                        double proportionToResize = (xProportion < yProportion) ? xProportion : yProportion;
                        int targetedX = (int) ((xProportion < yProportion) ? sizex : sizexPicture / proportionToResize);
                        int targetedY = (int) ((xProportion < yProportion) ? sizeyPicture / proportionToResize : sizey);

                        if (targetedX < sizex) {
                            targetedX = sizex;
                        }
                        if (targetedY < sizey) {
                            targetedY = sizey;
                        }

                        //3 resize
                        originalImage = resizeImage(originalImage
                                , targetedX + 1 //add 1 to be sure. If not, resize with -1
                                , targetedY + 1 //add 1 to be sure. If not, resize with -1
                                , RenderingHints.VALUE_RENDER_QUALITY
                                , true);

                        //4 cut
                        if ((xProportion < yProportion)) {
                            if (targetedY != sizey) {
                                originalImage = cropImage(originalImage, null, sizey);
                            }
                        } else {
                            if (targetedX != sizex) {
                                originalImage = cropImage(originalImage, sizex, null);
                            }
                        }
                    }
                } else {
                    if (sizex != null && sizex != sizexPicture) {
                        //1 compute proportion
                        double xProportion = (double) sizexPicture / (double) sizex;

                        //2 resize
                        originalImage = resizeImage(originalImage
                                , sizex + 1 //add 1 to be sure. If not, resize with -1
                                , (int) (sizeyPicture / xProportion) + 1
                                , RenderingHints.VALUE_RENDER_QUALITY
                                , true);
                    } else if (sizey != null && sizey != sizeyPicture) {
                        //1 compute proportion
                        double yProportion = (double) sizeyPicture / (double) sizey;

                        //2 resize
                        originalImage = resizeImage(originalImage
                                , (int) (sizexPicture / yProportion) + 1
                                , sizey + 1 //add 1 to be sure. If not, resize with -1
                                , RenderingHints.VALUE_RENDER_QUALITY
                                , true);
                    }
                }

                Logger.info("..>T3 : " + (new Date().getTime() - t));

                ImageIO.write(originalImage, type, resizeFile);

                Logger.info("..>T4 : " + (new Date().getTime() - t));
            }

            //save new size
            storedFile.setWidth(originalImage.getWidth());
            storedFile.setHeight(originalImage.getHeight());


            Logger.info("..>T5 : " + (new Date().getTime() - t));

            //and save
            storedFileService.saveOrUpdate(storedFile);

            FileUtil.save(resizeFile, storedFile.getStoredName());

            Logger.info("..>T5.2 : " + (new Date().getTime() - t));

            Logger.info("..>T6 : " + (new Date().getTime() - t));


            return storedFile;

        } catch (IOException e) {
            e.printStackTrace();
            throw new MyRuntimeException(e.getMessage());
        }
    }

    @Override
    public StoredFile updateBase64(String imageBase64, String fileName, Account account) {

        imageBase64 = imageBase64.substring(imageBase64.indexOf(",") + 1);


        InputStream inputStream = new ByteArrayInputStream(Base64.getDecoder().decode(imageBase64));


        try {
            File f = File.createTempFile("temp", ".png");


            FileOutputStream outputStream = new FileOutputStream(f);

            int read = 0;
            byte[] bytes = new byte[1024];

            while ((read = inputStream.read(bytes)) != -1) {
                outputStream.write(bytes, 0, read);
            }

            StoredFile storedFile = uploadWithSize(f, fileName, account);

            return storedFile;

        } catch (IOException e) {
            throw new MyRuntimeException(ErrorMessageEnum.FATAL_ERROR);
        }
    }

//    private static BufferedImage resizeImage(BufferedImage originalImage, int type, int width, int height) {
//        BufferedImage resizedImage = new BufferedImage(width, height, type);
//        Graphics2D g = resizedImage.createGraphics();
//        g.drawImage(originalImage, 0, 0, width, height, null);
//        g.dispose();
//
//        return resizedImage;
//    }

    ImagePlus openUsingImageIO(String name, BufferedImage img) {
        ImagePlus imp = null;

        if (img == null) {
            return null;
        } else {
            if (img.getColorModel().hasAlpha()) {
                int fi = img.getWidth();
                int height = img.getHeight();
                BufferedImage bi = new BufferedImage(fi, height, 2);
                Graphics g = bi.getGraphics();
                g.setColor(Color.white);
                g.fillRect(0, 0, fi, height);
                g.drawImage(img, 0, 0, null);
                img = bi;
            }

            imp = new ImagePlus(name, img);
            FileInfo fi1 = new FileInfo();
            fi1.fileFormat = 9;
            fi1.fileName = name;
            fi1.directory = name;//f.getParent() + File.separator;
            imp.setFileInfo(fi1);
            return imp;
        }
    }

    public BufferedImage resizeImage(BufferedImage img,
                                     int targetWidth,
                                     int targetHeight,
                                     Object hint,
                                     boolean higherQuality) {


        try {
            BufferedImage bufferedImage = Thumbnails.of(img)//new URL("http://i.stack.imgur.com/X0aPT.jpg"))
                    .height(targetHeight)
                    .width(targetWidth)
                    .antialiasing(Antialiasing.ON)
                    .rendering(Rendering.QUALITY)
                    .asBufferedImage();

            return bufferedImage;
        } catch (IOException e) {
            e.printStackTrace();
            throw new RuntimeException("caca");
        }
    }

    private String generateStorageKey() {
        //generate the key => test if the key is already used
        String storageKey = null;

        while (storageKey == null || storedFileService.findByStoredName(storageKey) != null) {
            storageKey = KeyGenerator.generateRandomKey(100);
        }
        return storageKey;
    }

    private BufferedImage cropImage(BufferedImage src, Integer width, Integer height) {

        if (height == null) {
            height = src.getHeight();
        }
        if (width == null) {
            width = src.getWidth();
        }

        int left, right, top, bottom;

        //compute width
        int differenceW = src.getWidth() - width;
        left = differenceW / 2;
        right = src.getWidth() - differenceW / 2;
        if (right - left < width) {
            left = left - (width - (right - left));
        }

        //compute height
        int differenceH = src.getHeight() - height;
        top = differenceH / 2;
        bottom = src.getHeight() - differenceH / 2;
        if (bottom - top < height) {
            top = top - (height - (bottom - top));
        }
        BufferedImage subimage = src.getSubimage(left, top, width, height);

        return subimage;
    }
}
