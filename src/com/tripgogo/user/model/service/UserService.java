package com.tripgogo.user.model.service;

import com.tripgogo.user.model.UserDto;

public interface UserService {
	int idCheck(String userId) throws Exception;
	int joinUser(UserDto memberDto) throws Exception;
	UserDto loginUser(String userId, String userPwd) throws Exception;

}
