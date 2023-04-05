package com.tripgogo.mytrip.model.service;

import com.tripgogo.mytrip.model.PlaceDto;

import java.sql.Date;
import java.util.List;

public interface PlaceService {
    List<PlaceDto> getPlaces(int myTripId) throws Exception;
    void deletePlaces(List<Integer> placeIds) throws Exception;
    void addPlace(PlaceDto placeDto) throws Exception;
}
