package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.util.JdbcUtil;

public class EmpDaoImpl implements IEmpDao{
	
	private JdbcUtil util = new JdbcUtil();
	
	@Override
	public boolean checkEmp(String username, String password) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select *from employee where username = '"+username+"' and "
				+ "password = '"+password+"'";
		try {
			conn = util.getConn();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			util.closeAll(conn, ps, rs);
		}
		return false;
	}
}
