package com.tripgogo.mytrip.model.service;

import com.tripgogo.mytrip.model.PlaceDto;

import java.sql.Date;
import java.util.List;

public interface PlaceService {
    List<PlaceDto> getPlaces(int myTripId) throws Exception;
    void deletePlace(int placeId) throws Exception;
    void addPlace(int myTripId, Date date, PlaceDto placeDto) throws Exception;
}
