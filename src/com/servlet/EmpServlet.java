package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.EmpServiceImpl;
import com.service.IEmpService;

/**
 * Servlet implementation class EmpServlet
 */
@WebServlet("/emp")
public class EmpServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;

	protected void login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		System.out.println(username+"-->"+password);
		if(username==null || password == null) {
			return;
		}
		IEmpService service = new EmpServiceImpl();
		if(service.checkEmp(username, password)){
			request.getSession().setAttribute("loginname", username);
			response.getWriter().print("true");
			//response.sendRedirect("backstage/index.jsp");
		}
	}

	
	protected void login2(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		System.out.println(username+"-->"+password);
		if(username==null || password == null) {
			return;
		}
		IEmpService service = new EmpServiceImpl();
		if(service.checkEmp(username, password)){
			request.getSession().setAttribute("loginname", username);
		//	response.getWriter().print("true");
			response.sendRedirect("backstage/index.jsp");
		}
	}
	
	protected void checkout(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getSession().removeAttribute("loginname");
		//System.out.println("true");
		response.getWriter().print("true");
		//response.sendRedirect("/backstage/index.jsp");
	}
}
