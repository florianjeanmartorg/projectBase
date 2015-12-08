package be.lynk.server.controller.rest;

import be.lynk.server.controller.technical.security.annotation.SecurityAnnotation;
import be.lynk.server.controller.technical.security.role.RoleEnum;
import be.lynk.server.dto.StoredFileDTO;
import be.lynk.server.model.entities.StoredFile;
import be.lynk.server.service.FileService;
import be.lynk.server.service.StoredFileService;
import be.lynk.server.util.constants.Constant;
import be.lynk.server.util.file.FileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import play.db.jpa.Transactional;
import play.mvc.Controller;
import play.mvc.Http.MultipartFormData;
import play.mvc.Result;
import play.mvc.Results;

import java.io.InputStream;

@org.springframework.stereotype.Controller
public class FilesController extends AbstractRestController {


    @Autowired
    private FileService       fileService;
    @Autowired
    private StoredFileService storedFileService;

    @Transactional(readOnly = false)
    @SecurityAnnotation(role = RoleEnum.USER)
    public Result upload() {
        return uploadWithSize(null, null);
    }

    /**
     * @return
     */
    @Transactional(readOnly = false)
    @SecurityAnnotation(role = RoleEnum.USER)
    public Result uploadWithSize(Integer sizex, Integer sizey) {

        MultipartFormData body = request().body().asMultipartFormData();
        play.mvc.Http.MultipartFormData.FilePart file = body.getFiles().get(0);

        StoredFileDTO filesUploadedDTO = null;

        if (file != null) {

            StoredFile storedFile = fileService.uploadWithSize(file, sizex, sizey, securityController.getCurrentUser());

            //complete the result
            filesUploadedDTO = dozerService.map(storedFile, StoredFileDTO.class);
        }
        return Results.ok(filesUploadedDTO);
    }

    /*
      download a file by is storedFileId
     */
//    @SecurityAnnotation(role = RoleEnum.USER)
    @Transactional(readOnly = true)
    public Result download(long storedFileId) {

        //get the storedFile
        StoredFile storedFile = storedFileService.findById(storedFileId);

        if (storedFile == null) {
            throw new RuntimeException("File " + storedFileId + " was not found");
        }

        //TODO control

//        //control
//        if (!storedFile.getAccount().equals(securityController.getCurrentUser())) {
//            throw new MyRuntimeException(ErrorMessageEnum.WRONG_AUTHORIZATION, storedFileId + "");
//        }

        //create an inputStream
        InputStream inputStream = FileUtil.getFileInputStream(storedFile.getStoredName());

        //launch the download
        Controller.response().setContentType("application/octet-stream");
        Controller.response().setHeader("Content-disposition", "attachment; filename=" + storedFile.getOriginalName());

        return Results.ok(inputStream);
    }

}
