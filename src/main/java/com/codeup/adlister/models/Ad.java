package com.codeup.adlister.models;

import java.util.List;

public class Ad {
    private long id;
    private long userId;
    private String title;
    private String description;
    private String price;
    private String category;

    public Ad(long id, long userId, String title, String description, String category, String price) {
        this.id = id;
        this.userId = userId;
        this.title = title;
        this.description = description;
        this.category = category;
        this.price = price;
    }

    public Ad(long id, long userId, String title, String description, String price) {
        this.id = id;
        this.userId = userId;
        this.title = title;
        this.description = description;
        this.price = price;
    }

    public Ad(long userId, String title, String description, String price, String category) {
        this.userId = userId;
        this.title = title;
        this.description = description;
        this.price = price;
        this.category = category;
    }

    public Ad() {}

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
