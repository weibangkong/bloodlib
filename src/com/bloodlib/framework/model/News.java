package com.bloodlib.framework.model;

public class News {
    private Long newsId;

    private String newsTitle;

    private String simpleText;

    private Long simpleImageId;

    private String simpleImagePath;

    public Long getNewsId() {
        return newsId;
    }

    public void setNewsId(Long newsId) {
        this.newsId = newsId;
    }

    public String getNewsTitle() {
        return newsTitle;
    }

    public void setNewsTitle(String newsTitle) {
        this.newsTitle = newsTitle;
    }

    public String getSimpleText() {
        return simpleText;
    }

    public void setSimpleText(String simpleText) {
        this.simpleText = simpleText;
    }

    public Long getSimpleImageId() {
        return simpleImageId;
    }

    public void setSimpleImageId(Long simpleImageId) {
        this.simpleImageId = simpleImageId;
    }

    public String getSimpleImagePath() {
        return simpleImagePath;
    }

    public void setSimpleImagePath(String simpleImagePath) {
        this.simpleImagePath = simpleImagePath;
    }
}