package com.dao;

public interface IEmpDao {
	
	/**
	 * 从数据库确定后台管理人员是否存在
	 * @param username 账户
	 * @param passowrd 密码
	 * @return true false
	 */
	public boolean checkEmp(String username,String passowrd);
	
	
	
}
