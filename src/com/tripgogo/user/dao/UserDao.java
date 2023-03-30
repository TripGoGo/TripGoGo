package com.tripgogo.user.dao;

import java.sql.SQLException;

import com.tripgogo.user.model.UserDto;

public interface UserDao {
	int idCheck(String userId) throws SQLException;
	int joinMember(UserDto memberDto) throws SQLException;
	UserDto loginMember(String userId, String userPwd) throws SQLException;

}
