package com.mohammadrajabi.my_time;

import androidx.lifecycle.MutableLiveData;

public class ElapsedTimeLiveData {
    private static ElapsedTimeLiveData instance;
    private MutableLiveData<Integer> elapsedTimeLiveData;

    private ElapsedTimeLiveData() {
        elapsedTimeLiveData = new MutableLiveData<Integer>();
    }

    public MutableLiveData<Integer> getElapsedTimeLiveData() {
        return elapsedTimeLiveData;
    }

    public static ElapsedTimeLiveData getInstance() {
        if (instance == null) {
            instance = new ElapsedTimeLiveData();
        }
        return instance;
    }

}
