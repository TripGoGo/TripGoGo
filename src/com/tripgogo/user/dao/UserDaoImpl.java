package com.tripgogo.user.dao;

import java.sql.SQLException;

import com.tripgogo.user.model.UserDto;
import com.tripgogo.util.DBUtil;

public class UserDaoImpl implements UserDao {
	private static UserDao memberDao = new UserDaoImpl();
	private DBUtil dbUtil;
	


	@Override
	public int idCheck(String userId) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int joinMember(UserDto memberDto) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public UserDto loginMember(String userId, String userPwd) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
