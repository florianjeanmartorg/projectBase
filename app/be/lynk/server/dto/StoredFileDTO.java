package be.lynk.server.dto;

import be.lynk.server.dto.technical.DTO;


/**
 * Created by florian on 23/05/15.
 */
public class StoredFileDTO extends DTO implements Comparable<StoredFileDTO> {

    private Long id;

    private Boolean isImage;

    private String originalName;

    private String storedName;

    private String storedNameOriginalSize;

    private String comment;

    private Integer fileOrder = 0;

    private Integer height;

    private Integer width;

    //used to transfert image to server in base64
    private String image64;

    public StoredFileDTO() {
    }

    public String getImage64() {
        return image64;
    }

    public void setImage64(String image64) {
        this.image64 = image64;
    }

    public Integer getHeight() {
        return height;
    }

    public void setHeight(Integer height) {
        this.height = height;
    }

    public Integer getWidth() {
        return width;
    }

    public void setWidth(Integer width) {
        this.width = width;
    }

    public Integer getFileOrder() {
        return fileOrder;
    }

    public void setFileOrder(Integer fileOrder) {
        this.fileOrder = fileOrder;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Boolean getIsImage() {
        return isImage;
    }

    public void setIsImage(Boolean isImage) {
        this.isImage = isImage;
    }

    public String getOriginalName() {
        return originalName;
    }

    public void setOriginalName(String originalName) {
        this.originalName = originalName;
    }

    public String getStoredName() {
        return storedName;
    }

    public void setStoredName(String storedName) {
        this.storedName = storedName;
    }

    public String getStoredNameOriginalSize() {
        return storedNameOriginalSize;
    }

    public void setStoredNameOriginalSize(String storedNameOriginalSize) {
        this.storedNameOriginalSize = storedNameOriginalSize;
    }

    @Override
    public String toString() {
        return "StoredFileDTO{" +
                "id=" + id +
                ", isImage=" + isImage +
                ", originalName='" + originalName + '\'' +
                '}';
    }

    @Override
    public int compareTo(StoredFileDTO o) {
        return this.getFileOrder().compareTo(o.getFileOrder());
    }
}
