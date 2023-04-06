package com.tripgogo.mytrip.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.tripgogo.mytrip.model.MyTripDto;
import com.tripgogo.mytrip.model.dao.MyTripDao;
import com.tripgogo.mytrip.model.dao.MyTripDaoImpl;
import com.tripgogo.util.PageNavigation;
import com.tripgogo.util.SizeConstant;

public class MyTripServiceImpl implements MyTripService {
	
	private static MyTripService myTripService = new MyTripServiceImpl();
	private static int LIST_SIZE = 10;
	private static int NAVIGATION_SIZE = 5;
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
	public List<MyTripDto> listMytrips(String userId, int pgno) throws Exception {
		int start = pgno * LIST_SIZE - LIST_SIZE;
		return myTripDao.listMytrips(userId, start, LIST_SIZE);
	}

	@Override
	public MyTripDto getMyTrip(int myTripId) throws Exception {
		return myTripDao.getMyTrip(myTripId);
	}

	@Override
	public PageNavigation makePageNavigation(int pgno, String userId) throws Exception {
		PageNavigation pageNavigation = new PageNavigation();
		int naviSize = NAVIGATION_SIZE;
		int sizePerPage = LIST_SIZE;
		int currentPage = pgno;
		pageNavigation.setCurrentPage(currentPage);
		pageNavigation.setNaviSize(naviSize);
		Map<String, Object> param = new HashMap<String, Object>();
		int totalCount = myTripDao.getTotalTripCount(userId);
		pageNavigation.setTotalCount(totalCount);
		int totalPageCount = (totalCount - 1) / sizePerPage + 1;
		pageNavigation.setTotalPageCount(totalPageCount);
		boolean startRange = currentPage <= naviSize;
		pageNavigation.setStartRange(startRange);
		boolean endRange = (totalPageCount - 1) / naviSize * naviSize < currentPage;
		pageNavigation.setEndRange(endRange);
		pageNavigation.makeNavigator();
		return pageNavigation;
	}

	@Override
	public void deleteMyTrip(int myTripId) throws Exception {
		myTripDao.deleteMyTrip(myTripId);
	}

}
