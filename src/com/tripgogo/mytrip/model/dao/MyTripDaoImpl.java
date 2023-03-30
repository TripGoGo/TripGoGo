package com.tripgogo.mytrip.model.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.Period;
import java.util.ArrayList;
import java.util.List;

import com.tripgogo.board.model.BoardDto;
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
			sql.append("insert into mytrip (user_id, city, start_date, end_date, period, companion, trip_style) \n");
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
	public List<MyTripDto> listMytrips(String userId) throws SQLException {
		List<MyTripDto> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select city, start_date, end_date, period, companion, trip_style \n");
			sql.append("from mytrip \n");
			sql.append("where user_id = ? \n");
			sql.append("order by mytrip_id desc");
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MyTripDto myTripDto = new MyTripDto();
				myTripDto.setCity(rs.getString("city"));
				myTripDto.setStartDate(rs.getDate("start_date"));
				myTripDto.setEndDate(rs.getDate("end_date"));
				myTripDto.setPeriod(rs.getInt("period"));
				myTripDto.setCompanion(rs.getString("companion"));
				myTripDto.setTripStyle(rs.getString("trip_style"));
				list.add(myTripDto);
			}
		} finally {
			dbUtil.close(rs, pstmt, conn);
		}
		return list;
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
