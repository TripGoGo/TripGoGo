package com.tripgogo.mytrip.model.service;

import java.util.List;

import com.tripgogo.mytrip.model.MyTripDto;

public interface MyTripService {
	void writetMyTrip(MyTripDto myTripDto) throws Exception;
	List<MyTripDto> listMytrips() throws Exception;
	MyTripDto getMyTrip(int myTripId) throws Exception;
	void modifyMyTrip(MyTripDto myTripDto) throws Exception;
	void deleteMyTrip(int myTripId) throws Exception;
}
