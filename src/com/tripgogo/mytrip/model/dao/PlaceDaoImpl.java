package com.tripgogo.mytrip.model.dao;

import com.tripgogo.mytrip.model.MyTripDto;
import com.tripgogo.mytrip.model.PlaceDto;
import com.tripgogo.util.DBUtil;

import java.sql.*;
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
    public void deletePlace(int placeId) throws SQLException {

    }

    @Override
    public void addPlace(int myTripId, Date date, PlaceDto placeDto) throws SQLException {

    }
}
