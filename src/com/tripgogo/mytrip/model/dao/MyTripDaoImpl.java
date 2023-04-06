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
			pstmt.setInt(5, Period.between(myTripDto.getStartDate().toLocalDate(), myTripDto.getEndDate().toLocalDate()).getDays() + 1);
			pstmt.setInt(6, myTripDto.getCompanion());
			pstmt.setInt(7, myTripDto.getTripStyle());
			pstmt.executeUpdate();
		} finally {
			dbUtil.close(pstmt, conn);
		}
	}

	@Override
	public List<MyTripDto> listMytrips(String userId, int start, int listsize) throws SQLException {
		List<MyTripDto> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select mytrip_id, city, start_date, end_date, period, companion, trip_style \n");
			sql.append("from mytrip \n");
			sql.append("where user_id = ? \n");
			sql.append("order by mytrip_id desc \n");
			sql.append("limit ?, ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, userId);
			pstmt.setInt(2, start);
			pstmt.setInt(3, listsize);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MyTripDto myTripDto = new MyTripDto();
				myTripDto.setMyTripId(rs.getInt("mytrip_id"));
				myTripDto.setCity(rs.getString("city"));
				myTripDto.setStartDate(rs.getDate("start_date"));
				myTripDto.setEndDate(rs.getDate("end_date"));
				myTripDto.setPeriod(rs.getInt("period"));
				myTripDto.setCompanion(rs.getInt("companion"));
				myTripDto.setTripStyle(rs.getInt("trip_style"));
				list.add(myTripDto);
			}
		} finally {
			dbUtil.close(rs, pstmt, conn);
		}
		return list;
	}

	@Override
	public MyTripDto getMyTrip(int myTripId) throws SQLException {
		MyTripDto myTripDto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select city, start_date, end_date, period, companion, trip_style \n");
			sql.append("from mytrip \n");
			sql.append("where mytrip_id = ? \n");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, myTripId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				myTripDto = new MyTripDto();
				myTripDto.setCity(rs.getString("city"));
				myTripDto.setStartDate(rs.getDate("start_date"));
				myTripDto.setEndDate(rs.getDate("end_date"));
				myTripDto.setPeriod(rs.getInt("period"));
				myTripDto.setCompanion(rs.getInt("companion"));
				myTripDto.setTripStyle(rs.getInt("trip_style"));
			}
		} finally {
			dbUtil.close(rs, pstmt, conn);
		}
		return myTripDto;
	}

	@Override
	public void deleteMyTrip(int myTripId) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("delete from mytrip \n");
			sql.append("where mytrip_id = ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, myTripId);
			pstmt.executeUpdate();
		} finally {
			dbUtil.close(pstmt, conn);
		}
	}

	@Override
	public int getTotalTripCount(String userId) throws  SQLException {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select count(mytrip_id) \n");
			sql.append("from mytrip \n");
			sql.append("where user_id = ? \n");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
		} finally {
			dbUtil.close(rs, pstmt, conn);
		}
		return cnt;
	}

}
