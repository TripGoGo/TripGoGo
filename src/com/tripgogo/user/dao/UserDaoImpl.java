package com.tripgogo.user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.tripgogo.user.model.UserDto;
import com.tripgogo.util.DBUtil;

public class UserDaoImpl implements UserDao {
	private static final UserDao userDao = new UserDaoImpl();
	private final DBUtil dbUtil;

	private UserDaoImpl() {
		dbUtil = DBUtil.getInstance();
	}

	public static UserDao getUserDao() {
		return userDao;
	}


	@Override
	public int idCheck(String userId) throws SQLException {
		int cnt = 1;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dbUtil.getConnection();
			StringBuilder loginUser = new StringBuilder();
			loginUser.append("select count(user_id) \n");
			loginUser.append("from User \n");
			loginUser.append("where user_id = ? ");
			pstmt = conn.prepareStatement(loginUser.toString());
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			rs.next();
			cnt = rs.getInt(1);
		} finally {
			dbUtil.close(rs, pstmt, conn);
		}
		return cnt;
	}

	@Override
	public int joinUser(UserDto userDto) throws SQLException {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("insert into User (user_id, user_name, user_password, email, question, answer) \n");
			sql.append("values (?, ?, ?, ?, ?, ?)");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, userDto.getUserId());
			pstmt.setString(2, userDto.getUserName());
			pstmt.setString(3, userDto.getUserPassword());
			pstmt.setString(4, userDto.getEmail());
			pstmt.setInt(5, userDto.getQuestion());
			pstmt.setString(6, userDto.getAnswer());
			cnt = pstmt.executeUpdate();
		} finally {
			dbUtil.close(pstmt, conn);
		}
		return cnt;
	}

	@Override
	public UserDto loginUser(String userId, String userPwd) throws SQLException {
		UserDto userDto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dbUtil.getConnection();
			StringBuilder loginUser = new StringBuilder();
			loginUser.append("select user_id, user_name \n");
			loginUser.append("from User \n");
			loginUser.append("where user_id = ? and user_password = ? \n");
			pstmt = conn.prepareStatement(loginUser.toString());
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				userDto = new UserDto();
				userDto.setUserId(rs.getString("user_id"));
				userDto.setUserName(rs.getString("user_name"));
			}
		} finally {
			dbUtil.close(rs, pstmt, conn);
		}
		return userDto;
	}

	@Override
	public UserDto findUser(String userId) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		UserDto userDto = null;
		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select user_id, user_name, user_password, email \n");
			sql.append("from User \n");
			sql.append("where user_id = ? ");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				userDto = new UserDto();
				userDto.setUserId(rs.getString("user_id"));
				userDto.setUserName(rs.getString("user_name"));
				userDto.setUserPassword(rs.getString("user_password"));
				userDto.setEmail(rs.getString("email"));
			}

		} finally {
			dbUtil.close(rs, pstmt, conn);
		}
		return userDto;
	}

	@Override
	public void updateUser(UserDto userDto) throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		System.out.println(userDto.getUserName());
		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("update user \n");
			sql.append("set user_name = ?, user_password = ?, email = ?\n");
			sql.append("where user_id = ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, userDto.getUserName());
			pstmt.setString(2, userDto.getUserPassword());
			pstmt.setString(3, userDto.getEmail());
			pstmt.setString(4, userDto.getUserId());
			System.out.println(pstmt.executeUpdate());
		} finally {
			dbUtil.close(pstmt, conn);
		}


	}

	@Override
	public int findPassword(UserDto userDto) throws SQLException {
		int cnt = 1;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dbUtil.getConnection();
			StringBuilder loginUser = new StringBuilder();
			loginUser.append("select count(user_id) \n");
			loginUser.append("from User \n");
			loginUser.append("where user_id = ? and question =? and answer = ?");
			pstmt = conn.prepareStatement(loginUser.toString());
			pstmt.setString(1, userDto.getUserId());
			pstmt.setInt(2, userDto.getQuestion());
			pstmt.setString(3, userDto.getAnswer());
			rs = pstmt.executeQuery();
			rs.next();
			cnt = rs.getInt(1);
		} finally {
			dbUtil.close(rs, pstmt, conn);
		}
		return cnt;
	}

	@Override
	public void changePassword(UserDto userDto) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		System.out.println(userDto.getUserName());
		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("update user \n");
			sql.append("set user_password = ?\n");
			sql.append("where user_id = ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, userDto.getUserPassword());
			pstmt.setString(2, userDto.getUserId());
			System.out.println(pstmt.executeUpdate());
		} finally {
			dbUtil.close(pstmt, conn);
		}
	}

}
