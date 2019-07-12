package com.service;

import java.util.List;

import com.model.User;

public interface IUserService {
	/**
	 *  增加用户
	 * @param username 账号
	 * @param password 密码
	 */
	public void addUser(String username,String password);
	
   
   /**
	 * 查询被封号的用户
	 * @return 返回封号用户集合
	 */
	public List<User> selectCloseUser();
	/**
	 * 查询所有用户
	 * @return 返回封号用户集合
	 */
	public List<User> selectAllUser();
	
	/**
	 * 通过id查询用户
	 * @param id id
	 * @return User对象
	 */
	public User selectUserById(Integer id);
	
	/**
	 * 通过id的数组来删除数据库中的数据
	 * @param ids id数组
	 * @return 更改条数
	 */
	public Integer deleteUserByIds(int[] ids);
	
	/**
	 * 	通过给定用户名进行模糊查询
	 * @param username 用户名
	 * @return 返回对象集合
	 */
	public List<User> selectUserByName(String username);
	
	/**
	 * 	通过给定(已封号)用户名进行模糊查询
	 * @param username 用户名
	 * @return 返回对象集合
	 */
	public List<User> selectCloseUserByName(String username);
	
	/**
	 * 	通过id进行对指定用户进行修改
	 * @param id 用户id
	 */
	public Integer updateUserByIds(Integer id,Object params[]);
	
	/**
	 * 查询数据条数
	 * @return 行数
	 */
	public int selectTotalCount();
	
	/**
	 * 分页查询
	 * @param nowpage 当前页
	 * @param pageCount 每页条数
	 * @return 用户list
	 */
	public List<User> pageSelectUser(Integer nowpage,Integer pageCount);
	
	/**
	 * 分页查询
	 * @param nowpage 当前页
	 * @param pageCount 每页条数
	 * @return 用户list
	 */
	public List<User> pageSelectCloseUser(Integer nowpage, Integer pageCount);
	public List<User> query(String username);
}
