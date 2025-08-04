package com.example.myapplication;

import com.google.gson.annotations.SerializedName;

public class Society {
    @SerializedName("id")
    private int id;
    
    @SerializedName("society")
    private String society;
    
    public Society(int id, String society) {
        this.id = id;
        this.society = society;
    }
    
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public String getSociety() {
        return society;
    }
    
    public void setSociety(String society) {
        this.society = society;
    }
} 