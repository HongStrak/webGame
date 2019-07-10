package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.User;
import com.service.IUserService;
import com.service.JsonUtils;
import com.service.UserServiceImpl;
import com.util.Conversion;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/user")
public class UserServlet extends BaseServlet{
	private static final long serialVersionUID = 1L;

	private static int perpageCount = 10;
	
	private static IUserService service = new UserServiceImpl();
	
	protected void cday(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String nowpage = request.getParameter("nowpage");
		
		List<User> list = null;
		//IUserService service = new UserServiceImpl();

		if(username==null || username.trim().equals("")) {
			list = service.pageSelectCloseUser(Integer.parseInt(nowpage), perpageCount);
		}else {
			list = service.selectCloseUserByName(username);
		}
		
		int totalCount = service.selectTotalCount();
		int pageCount = totalCount%perpageCount==0?totalCount/perpageCount:totalCount/perpageCount+1;
		Map map = new HashMap<>();
		map.put("list", list);
		map.put("totalCount", totalCount);
		map.put("pageCount", pageCount);
		//转换json
		String json = JsonUtils.objectToJson(map);
		response.getWriter().print(json);
	}
	
	protected void selectAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String nowpage = request.getParameter("nowpage");
		
		List<User> list = null;
		//IUserService service = new UserServiceImpl();
		Map map = new HashMap<>();


		if(username==null || username.trim().equals("")) {
			list = service.pageSelectUser(Integer.parseInt(nowpage), perpageCount);
		}else {
			list = service.selectUserByName(username);
			map.put("byname", "true");
		}
		
		int totalCount = service.selectTotalCount();
		int pageCount = totalCount%perpageCount==0?totalCount/perpageCount:totalCount/perpageCount+1;
		map.put("list", list);
		map.put("totalCount", totalCount);
		map.put("pageCount", pageCount);
		//转换json
		String json = JsonUtils.objectToJson(map);
		response.getWriter().print(json);
	}
	
	protected void toEditUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String id = request.getParameter("id");
		if(id == null) {
			return;
		}
		//IUserService service = new UserServiceImpl();
		User user = service.selectUserById(Integer.parseInt(id));
		request.setAttribute("user", user);
		request.getRequestDispatcher("/backstage/user/edit.jsp").forward(request, response);
	}

	protected void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String[] idss = request.getParameterValues("ids");
		if(idss == null) {
			return;
		}
		int [] ids = new int[idss.length];
		
		for (int i = 0;i<idss.length; i++) {
			ids[i] = Integer.parseInt(idss[i]);
		}
		
		//IUserService service = new UserServiceImpl();
		Integer num = service.deleteUserByIds(ids);

		//将修改的条数传送回去
		String nums = JsonUtils.objectToJson(num);
		response.getWriter().print(nums);
	}
	
	protected void updateUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String credit = request.getParameter("credit");
		String cday = request.getParameter("cday");
		Object params[] = {username,password,credit,cday};
		
		Integer num = service.updateUserByIds(Integer.parseInt(id), params);
		PrintWriter out = response.getWriter();
		if(num == 1) {
			out.print("true");
		}else {
			out.print("false");
		}
		
	}
	
	protected void addUser(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		service.addUser(username, password);
		response.sendRedirect("index.jsp");
	}

}
