package com.bloodlib.framework.model;

public class ImagePath {
    private Long imageId;

    private Long newsId;

    private String imagePath;

    private String fileName;

    private String completePath;

    private String imageText;

    private String remark;

    private Integer imageNo;

    public Long getImageId() {
        return imageId;
    }

    public void setImageId(Long imageId) {
        this.imageId = imageId;
    }

    public Long getNewsId() {
        return newsId;
    }

    public void setNewsId(Long newsId) {
        this.newsId = newsId;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getCompletePath() {
        return completePath;
    }

    public void setCompletePath(String completePath) {
        this.completePath = completePath;
    }

    public String getImageText() {
        return imageText;
    }

    public void setImageText(String imageText) {
        this.imageText = imageText;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Integer getImageNo() {
        return imageNo;
    }

    public void setImageNo(Integer imageNo) {
        this.imageNo = imageNo;
    }
}