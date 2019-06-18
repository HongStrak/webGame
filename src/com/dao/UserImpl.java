package com.dao;

import java.util.ArrayList;
import java.util.List;

import com.model.User;
import com.util.JdbcUtil;

public class UserImpl implements IUserDao {

	public void addUser(User user) {
		JdbcUtil jdbc=new JdbcUtil();
		String sql="insert into tb_user values(?,?)";
		List<Object>params=new ArrayList<Object>();
		params.add(user.getId());
		params.add(user.getPassword());
		jdbc.updatePreparedStatement(sql,params);
		jdbc.close();
		
	}




	

}
