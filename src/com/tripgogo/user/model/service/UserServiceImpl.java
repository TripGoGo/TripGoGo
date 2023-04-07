package com.tripgogo.user.model.service;

import com.tripgogo.user.dao.UserDao;
import com.tripgogo.user.dao.UserDaoImpl;
import com.tripgogo.user.model.UserDto;

public class UserServiceImpl implements UserService {
	public static UserService userService = new UserServiceImpl();
	private UserDao userDao;

	private UserServiceImpl() {
		userDao = UserDaoImpl.getUserDao();
	}


	public static UserService getUserService() {
		return userService;
	}

	@Override
	public int idCheck(String userId) throws Exception {
		return userDao.idCheck(userId);
	}

	@Override
	public int joinUser(UserDto userDto) throws Exception {
		System.out.println("회원가입 호출 됨");
		return userDao.joinUser(userDto);
	}

	@Override
	public UserDto loginUser(String userId, String userPwd) throws Exception {
		return userDao.loginUser(userId, userPwd);
	}

	@Override
	public UserDto findUser(String userId) throws Exception {
		return userDao.findUser(userId);
	}

	@Override
	public void updateUser(UserDto userDto) throws Exception {
		userDao.updateUser(userDto);
	}

	@Override
	public int findPassword(UserDto userDto) throws Exception {
		return userDao.findPassword(userDto);
	}

	@Override
	public void changePassword(UserDto userDto) throws Exception {
		userDao.changePassword(userDto);
	}

}
