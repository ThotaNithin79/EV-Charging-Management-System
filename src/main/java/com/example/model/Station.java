package com.example.model;

public class Station {
    private int id;
    private String name;
    private int stands;
    private double price;
    private String areaName;
    private String alt1;
    private String alt2;
    private String alt3;
    private String alt4;
    private int userId;

    public Station(int id, String name, int stands, double price, String areaName, String alt1, String alt2, String alt3, String alt4,int userId) {
        this.id = id;
        this.name = name;
        this.stands = stands;
        this.price = price;
        this.areaName = areaName;
        this.alt1 = alt1;
        this.alt2 = alt2;
        this.alt3 = alt3;
        this.alt4 = alt4;
        this.userId = userId;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    public int getStands() {
        return stands;
    }

    public void setStands(int stands) {
        this.stands = stands;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    public String getAlt1() {
        return alt1;
    }

    public void setAlt1(String alt1) {
        this.alt1 = alt1;
    }

    public String getAlt2() {
        return alt2;
    }

    public void setAlt2(String alt2) {
        this.alt2 = alt2;
    }

    public String getAlt3() {
        return alt3;
    }

    public void setAlt3(String alt3) {
        this.alt3 = alt3;
    }

    public String getAlt4() {
        return alt4;
    }

    public void setAlt4(String alt4) {
        this.alt4 = alt4;
    }
    public int getUserId() {
        return userId;
    }

    public void setUserId(int id) {
        this.userId = id;
    }

}
