package com.tripgogo.mytrip.model.dao;

import java.sql.SQLException;
import java.util.List;

import com.tripgogo.mytrip.model.MyTripDto;

public interface MyTripDao {
	void writetMyTrip(MyTripDto myTripDto) throws SQLException;
	List<MyTripDto> listMytrips() throws  SQLException;
	MyTripDto getMyTrip(int mytripId) throws  SQLException;
	void modifyMyTrip(MyTripDto myTripDto) throws  SQLException;
	void deleteMyTrip(int mytripId) throws  SQLException;
}
