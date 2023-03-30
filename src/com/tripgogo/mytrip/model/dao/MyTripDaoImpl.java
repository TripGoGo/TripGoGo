package com.tripgogo.mytrip.model.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.Period;
import java.util.List;

import com.tripgogo.mytrip.model.MyTripDto;
import com.tripgogo.util.DBUtil;

public class MyTripDaoImpl implements MyTripDao {
	
	private static MyTripDao myTripDao = new MyTripDaoImpl();
	private DBUtil dbUtil;

	private MyTripDaoImpl() {
		dbUtil = DBUtil.getInstance();
	}
	
	public static MyTripDao getInstance() {
		return myTripDao;
	}
	
	@Override
	public void writetMyTrip(MyTripDto myTripDto) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("insert into mytrip (userId, city, startDate, endDate, period, companion, tripStyle) \n");
			sql.append("values (?, ?, ?, ?, ?, ?, ?)");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, myTripDto.getUserId());
			pstmt.setString(2, myTripDto.getCity());
			pstmt.setDate(3, myTripDto.getStartDate());
			pstmt.setDate(4, myTripDto.getEndDate());
			pstmt.setInt(5, Period.between(myTripDto.getStartDate().toLocalDate(), myTripDto.getEndDate().toLocalDate()).getDays());
			pstmt.setString(6, myTripDto.getCompanion());
			pstmt.setString(7, myTripDto.getTripStyle());
			pstmt.executeUpdate();
		} finally {
			dbUtil.close(pstmt, conn);
		}
	}

	@Override
	public List<MyTripDto> listMytrips() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MyTripDto getMyTrip(int myTripId) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void modifyMyTrip(MyTripDto myTripDto) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteMyTrip(int myTripId) throws SQLException {
		// TODO Auto-generated method stub

	}

}
