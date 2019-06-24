package com.dao;

import java.util.ArrayList;
import java.util.List;

import com.model.User;
import com.util.JdbcUtil;

public class UserImpl implements IUserDao {

	JdbcUtil jdbc=new JdbcUtil();
	public void addUser(User user) {
		
		String sql="insert into tb_user values(?,?)";
		List<Object>params=new ArrayList<Object>();
		params.add(user.getId());
		params.add(user.getPassword());
		jdbc.updatePreparedStatement(sql,params);
		
	}

	@Override
	public List<User> query() {
		String sql="select * from tb_user";
		 List<User> user=jdbc.queryPreparedStatement(sql, null, User.class);
		 return user;
	}




	

}
