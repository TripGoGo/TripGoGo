package com.tripgogo.user.model.service;

import com.tripgogo.user.model.UserDto;

public interface UserService {
	int idCheck(String userId) throws Exception;
	int joinUser(UserDto userDto) throws Exception;
	UserDto loginUser(String userId, String userPwd) throws Exception;
	UserDto findUser(String userId) throws Exception;
	void updateUser(UserDto userDto) throws Exception;

}
