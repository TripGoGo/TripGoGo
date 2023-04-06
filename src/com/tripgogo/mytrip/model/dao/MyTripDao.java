package com.tripgogo.mytrip.model.dao;

import java.sql.SQLException;
import java.util.List;

import com.tripgogo.mytrip.model.MyTripDto;

public interface MyTripDao {
	void writetMyTrip(MyTripDto myTripDto) throws SQLException;
	List<MyTripDto> listMytrips(String userId, int start, int listsize) throws  SQLException;
	MyTripDto getMyTrip(int myTripId) throws  SQLException;
	void deleteMyTrip(int myTripId) throws  SQLException;
	int getTotalTripCount(String userId) throws  SQLException;
}
