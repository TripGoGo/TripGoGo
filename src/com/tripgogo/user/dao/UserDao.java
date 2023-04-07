package com.tripgogo.user.dao;

import java.sql.SQLException;

import com.tripgogo.user.model.UserDto;

public interface UserDao {
	int idCheck(String userId) throws SQLException;
	int joinUser(UserDto userDto) throws SQLException;
	UserDto loginUser(String userId, String userPwd) throws SQLException;

	UserDto findUser(String userId) throws SQLException;
	void updateUser(UserDto userDto) throws SQLException;

	int findPassword(UserDto userDto) throws SQLException;
	void changePassword(UserDto userDto) throws SQLException;

}
