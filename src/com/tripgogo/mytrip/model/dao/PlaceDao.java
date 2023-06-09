package com.tripgogo.mytrip.model.dao;

import com.tripgogo.mytrip.model.PlaceDto;

import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

public interface PlaceDao {
    List<PlaceDto> getPlaces(int myTripId) throws SQLException;
    void deletePlaces(List<Integer> placeId) throws SQLException;
    void addPlace(PlaceDto placeDto) throws SQLException;

    List<PlaceDto> getPlaceByDate(long myTripId, Date date) throws SQLException;
}
