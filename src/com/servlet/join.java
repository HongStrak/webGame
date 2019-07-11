package com.servlet;
import com.Config.*;
import com.dao.UserImpl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.Tank;
import com.model.User;
import com.service.IUserService;
import com.service.UserServiceImpl;
import com.util.JdbcUtil;



/**
 * Servlet implementation class join
 */
@WebServlet("/join")
public class join extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public join() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password=request.getParameter("password");
		IUserService userservice=new UserServiceImpl();
		List<User> list=userservice.query(username);
		if(list!=null)
		{
			User user=list.get(0);
			if(user.getPassword().equals(password))
			{
				request.getSession().setAttribute("user", user);
				response.sendRedirect("first.jsp");
			}
			else{
				request.getRequestDispatcher("first.jsp").forward(request, response);
			}
			
		}
		
		
			
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
