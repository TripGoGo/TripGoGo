package com.tripgogo.mytrip.model.dao;

import com.tripgogo.mytrip.model.MyTripDto;
import com.tripgogo.mytrip.model.PlaceDto;
import com.tripgogo.util.DBUtil;

import java.sql.*;
import java.time.Period;
import java.util.ArrayList;
import java.util.List;

public class PlaceDaoImpl implements PlaceDao {
    private DBUtil dbUtil;

    private static PlaceDao placeDao = new PlaceDaoImpl();

    private PlaceDaoImpl() {
        dbUtil = DBUtil.getInstance();
    }

    public static PlaceDao getInstance() {
        return placeDao;
    }

    @Override
    public List<PlaceDto> getPlaces(int myTripId) throws SQLException {
        List<PlaceDto> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = dbUtil.getConnection();
            StringBuilder sql = new StringBuilder();
            sql.append("select place_id, mytrip_id, place_name, category, date, x, y \n");
            sql.append("from place \n");
            sql.append("where mytrip_id = ? \n");
            pstmt = conn.prepareStatement(sql.toString());
            pstmt.setInt(1, myTripId);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                PlaceDto placeDto = new PlaceDto();
                placeDto.setPlaceId(rs.getInt("place_id"));
                placeDto.setMyTripId(rs.getInt("mytrip_id"));
                placeDto.setPlaceName(rs.getString("place_name"));
                placeDto.setCategory(rs.getString("category"));
                placeDto.setDate(rs.getDate("date"));
                placeDto.setX(rs.getString("x"));
                placeDto.setY(rs.getString("y"));
                list.add(placeDto);
            }
        } finally {
            dbUtil.close(rs, pstmt, conn);
        }
        return list;
    }

    @Override
    public void deletePlaces(List<Integer> placeIds) throws SQLException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = dbUtil.getConnection();
            StringBuilder sql = new StringBuilder();
            sql.append("delete from place \n");
            sql.append("where place_id in (");
            for (int i = 0; i < placeIds.size()-1; i++) {
                sql.append("?,");
            }
            sql.append("?); \n");
            pstmt = conn.prepareStatement(sql.toString());
            for (int i = 1; i <= placeIds.size(); i++) {
                pstmt.setLong(i, placeIds.get(i-1));
            }
            pstmt.executeUpdate();
        } finally {
            dbUtil.close(pstmt, conn);
        }
    }

    @Override
    public void addPlace(PlaceDto placeDto) throws SQLException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = dbUtil.getConnection();
            StringBuilder sql = new StringBuilder();
            sql.append("insert into place (mytrip_id, user_id, place_name, category, date, x, y) \n");
            sql.append("values (?, ?, ?, ?, ?, ?, ?)");
            pstmt = conn.prepareStatement(sql.toString());
            pstmt.setLong(1, placeDto.getMyTripId());
            pstmt.setString(2, "ssafy");
            pstmt.setString(3, placeDto.getPlaceName());
            pstmt.setString(4, placeDto.getCategory());
            pstmt.setDate(5, placeDto.getDate());
            pstmt.setString(6, placeDto.getX());
            pstmt.setString(7, placeDto.getY());
            pstmt.executeUpdate();
        } finally {
            dbUtil.close(pstmt, conn);
        }
    }
}
