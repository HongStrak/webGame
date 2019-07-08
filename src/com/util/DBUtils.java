package com.util;
 
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Properties;
import java.util.Set;
 
import com.alibaba.druid.pool.DruidDataSource;
import com.model.User;
 
/**
 * 通用数据库工具类,基于Druid连接池实现
 * 包含以下功能
 * 1.获取连接
 * 2.关闭资源
 * 3.执行通用的更新操作
 * 4.执行通用的查询列表操作
 * 5.执行通用的查询单条记录操作
 * @author Luo
 *
 */
 
public class DBUtils {
	
	
	//声明druid连接池对象
	private static DruidDataSource pool;
	
	/**数据库 链接URL地址**/
	private static String url;
	/**账号**/
	private static String username;
	/**密码**/
	private static String password;
	/**初始连接数**/
	private static int initialSize;
	/**最大活动连接数**/
	private static int maxActive;
	/**最小闲置连接数**/
	private static int minIdle;
	/**连接耗尽时最大等待获取连接时间**/
	private static long maxWait;
	
	private static String fileName = "db.properties";
 
	static {
		init();
	}
	
	/**
	 * 加载属性文件并读取属性文件中的内容将其设置给连接信息
	 * @param propName
	 */
	private static void loadProp(String propName) {
		fileName = propName;
		try {
			//属性文件位于src根目录时,加"/"则不要使用ClassLoader,如果使用ClassLoader则无需"/"
			Properties prop = new Properties();
			InputStream is = Thread.currentThread().getContextClassLoader().getResourceAsStream(fileName);
			prop.load(is);
			
			
			url = prop.getProperty("url");
			username = prop.getProperty("username");
			password = prop.getProperty("password");
			
			initialSize = Integer.parseInt(prop.getProperty("initialSize"));
			maxActive = Integer.parseInt(prop.getProperty("maxActive"));
			maxWait = Integer.parseInt(prop.getProperty("maxWait"));
			minIdle = Integer.parseInt(prop.getProperty("minIdle"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	private static void init() {
		pool = new DruidDataSource();
		//加载属性文件,初始化配置
		loadProp(fileName);
		pool.setUrl(url);
		pool.setUsername(username);
		pool.setPassword(password);
		
		//设置连接池中初始连接数
		pool.setInitialSize(initialSize);
		//设置最大连接数
		pool.setMaxActive(maxActive);
		//设置最小的闲置链接数
		pool.setMinIdle(minIdle);
		//设置最大的等待时间(等待获取链接的时间)
		pool.setMaxWait(maxWait);
	}
	
	/**
	 * 链接获取
	 * @return
	 */
	public static Connection getConn() {
		try {
			//如果连接池为空或者被异常关闭,则重新初始化一个
			if(pool == null || pool.isClosed()) {
				init();
			}
			return pool.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
		
	}
	
	
 
	/**
	 * 资源关闭
	 * 
	 * @param stmt
	 * @param conn
	 */
	public static void close(ResultSet rs,Statement stmt, Connection conn) {
		try {
			if(rs != null) {
				rs.close();
			}
			if (stmt != null) {
				stmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
 
	/**
	 * 直接执行一个DML语句
	 * @param sql    sql语句
	 * @param params 参数
	 * @return 执行sql语句后影响记录的行数
	 */
	public static int executeDML(String sql, Object[] params) {
		Connection conn = getConn();
		PreparedStatement ps = null;
		int count = 0;

		try {
			ps = conn.prepareStatement(sql);

			// 给sql语句传参
			handleParams(params, ps);

			System.out.println(ps);
			count = ps.executeUpdate();
			return count;
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		} finally {
			close(null, ps, conn);
		}
	}
 
	
	/**
	 * 执行查询操作
	 * 
	 * @param sql    sql查询语句
	 * @param params sql参数列表
	 * @param clazz  存储对象
	 * @return Class对象的集合list
	 */
	public static <T> List<T> executeQuery(String sql, Object[] params, Class<T> clazz) {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		// 存储结果result
		List<T> list = new ArrayList<>();

		try {
			conn = getConn();
			pstm = conn.prepareStatement(sql);

			handleParams(params, pstm);

			rs = pstm.executeQuery();

			ResultSetMetaData rsmd = rs.getMetaData();
			// 获取列的行数
			int count = rsmd.getColumnCount();
			// 存储所有列的名字
			List<String> column = new ArrayList<String>();

			for (int i = 0; i < count; i++) {
				column.add(rsmd.getColumnName(i + 1).toLowerCase());
			}

			while (rs.next()) {

				T obj = clazz.newInstance();
				for (String columnName : column) {
					Field field = clazz.getDeclaredField(columnName);
					field.setAccessible(true);

					String type = field.getType().getName();
					if ("int".equals(type) || "java.lang.Integer".equals(type)) {
						int value = rs.getInt(columnName);
						field.set(obj, value);
					} else if ("double".equals(type) || "java.lang.Double".equals(type)) {
						double val = rs.getDouble(columnName);
						field.set(obj, val);
					} else if ("float".equals(type) || "java.lang.Float".equals(type)) {
						float val = rs.getFloat(columnName);
						field.set(obj, val);
					} else if ("java.lang.String".equals(type)) {
						String val = rs.getString(columnName);
						field.set(obj, val);
					} else if ("java.util.Date".equals(type)) {
						Date val = rs.getDate(columnName);
						field.set(obj, val);
					} else if ("boolean".equals(type) || "java.lang.Boolean".equals(type)) {
						boolean val = rs.getBoolean(columnName);
						field.set(obj, val);
					}

				}
				list.add(obj);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			close(rs, pstm, conn);
		}
		return list.size()==0?null:list;
	}
	
	
	/**
	 * 给sql语句传参
	 * 
	 * @param params 参数列表
	 * @param ps     PreparedStatement
	 * @throws SQLException
	 */
	public static void handleParams(Object[] params, PreparedStatement ps) throws SQLException {
		if (params != null) {
			for (int i = 0; i < params.length; i++) {
				ps.setObject(i + 1, params[i]);
			}
		}

	}
	
	/**
	 * 封装查询单个对象的方法
	 * @param sql    sql查询语句
	 * @param params sql参数列表
	 * @param clazz  存储对象
	 * @return 数据对象
	 */
	public static <T> T executeOneQuery(String sql, Object[] params, Class<T> clazz) {
		List<T> list = executeQuery(sql, params, clazz);
		if(list == null || list.size() == 0) {
			return null;
		}else {
			return list.get(0);
		}
	}
	
	
}