package com.service;

import java.util.List;

import com.dao.IUserDao;
import com.dao.UserImpl;
import com.model.User;

public class UserService implements IUserService{
	IUserDao userdao=new UserImpl();
	@Override
	public void addUser(User user) {
		userdao.addUser(user);
		
	}
	@Override
	public List<User> query() {
		return userdao.query();
	}

}
