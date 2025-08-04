package com.example.myapplication;

import java.util.List;

import retrofit2.Call;
import retrofit2.http.GET;

public interface ApiService {
    @GET("get_societies")
    Call<List<Society>> getSocieties();
} 