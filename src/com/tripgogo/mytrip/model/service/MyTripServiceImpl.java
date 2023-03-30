package com.tripgogo.mytrip.model.service;

import java.util.List;

import com.tripgogo.mytrip.model.MyTripDto;
import com.tripgogo.mytrip.model.dao.MyTripDao;
import com.tripgogo.mytrip.model.dao.MyTripDaoImpl;

public class MyTripServiceImpl implements MyTripService {
	
	private static MyTripService myTripService = new MyTripServiceImpl();
	private MyTripDao myTripDao;
	
	private MyTripServiceImpl() {
		myTripDao = MyTripDaoImpl.getInstance();
	}
	
	public static MyTripService getInstance() {
		return myTripService;
	}

	@Override
	public void writetMyTrip(MyTripDto myTripDto) throws Exception {
		myTripDao.writetMyTrip(myTripDto);
	}

	@Override
	public List<MyTripDto> listMytrips(String userId) throws Exception {
		return myTripDao.listMytrips(userId);
	}

	@Override
	public MyTripDto getMyTrip(int myTripId) throws Exception {
		return myTripDao.getMyTrip(myTripId);
	}

	@Override
	public void deleteMyTrip(int myTripId) throws Exception {
		myTripDao.deleteMyTrip(myTripId);
	}

}
