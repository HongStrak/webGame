package com.service;

import java.sql.*;

public class JDBCUtil {
	private Connection conn = null;
	private PreparedStatement pstm = null;
	private ResultSet rs =null;
	private String url = "jdbc:oracle:thin:@localhost:1521/orcl";
	private String username = "scott";
	private String password = "admin";
	
	//静态的加载驱动
	static{
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
