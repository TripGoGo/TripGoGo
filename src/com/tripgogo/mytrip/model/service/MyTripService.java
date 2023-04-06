package com.tripgogo.mytrip.model.service;

import java.util.List;
import java.util.Map;

import com.tripgogo.mytrip.model.MyTripDto;
import com.tripgogo.util.PageNavigation;

public interface MyTripService {
	void writetMyTrip(MyTripDto myTripDto) throws Exception;
	List<MyTripDto> listMytrips(String userId, int pgno) throws Exception;
	MyTripDto getMyTrip(int myTripId) throws Exception;
	PageNavigation makePageNavigation(int pgno, String userId) throws Exception;
	void deleteMyTrip(int myTripId) throws Exception;
}
