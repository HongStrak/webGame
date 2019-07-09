package com.service;

import java.util.List;

import com.dao.IUserDao;
import com.dao.UserImpl;
import com.model.User;

public class UserServiceImpl implements IUserService{
	IUserDao dao=new UserImpl();
	

	@Override
	public List<User> selectCloseUser() {
		return dao.selectCloseUser();
	}

	@Override
	public List<User> selectAllUser() {
		return dao.selectAllUser();
	}

	@Override
	public User selectUserById(Integer id) {
		return dao.selectUserById(id);
	}

	@Override
	public Integer deleteUserByIds(int[] ids) {
		return dao.deleteUserByIds(ids);
	}

	@Override
	public List<User> selectUserByName(String username) {
		return dao.selectUserByName(username);
	}

	@Override
	public List<User> selectCloseUserByName(String username) {
		return dao.selectCloseUserByName(username);
	}

	@Override
	public Integer updateUserByIds(Integer id,Object params[]) {
		return dao.updateUserByIds(id,params);
	}

	@Override
	public int selectTotalCount() {
		return dao.selectTotalCount();
	}

	@Override
	public List<User> pageSelectUser(Integer nowpage, Integer pageCount) {
		return dao.pageSelectUser(nowpage,pageCount);
	}

	@Override
	public List<User> pageSelectCloseUser(Integer nowpage, Integer pageCount) {
		return dao.pageSelectCloseUser(nowpage, pageCount);
	}
	@Override
	public void addUser(String username, String password) {
		dao.addUser(username, password);
	}
}
