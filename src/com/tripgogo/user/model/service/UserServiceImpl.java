package com.tripgogo.user.model.service;

import com.tripgogo.user.dao.UserDao;
import com.tripgogo.user.model.UserDto;

public class UserServiceImpl implements UserService {
	public static UserService userService = new UserServiceImpl();
	private UserDao userDao;

	
	public static UserService getUserService() {
		return userService;
	}

	@Override
	public int idCheck(String userId) throws Exception {
		return 0;
	}

	@Override
	public int joinUser(UserDto memberDto) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public UserDto loginUser(String userId, String userPwd) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
