package com.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.TreeMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.Config.*;
import com.model.*;
/**
 * Servlet implementation class addRoom
 */
@WebServlet("/addRoom")
public class addRoom extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addRoom() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");	
		response.setCharacterEncoding("utf-8");	
		
		
		
		String name = request.getParameter("name");
		ArrayList<room> rl = config.rl;
		synchronized (rl) {
			
		
		room r = new room();
		r.setrName(name);
		ArrayList<Tank> tl = new ArrayList<Tank>();
		Tank t = new Tank();
		t.setName(name);
		tl.add(t);
		r.setTl(tl);
		rl.add(r);
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
