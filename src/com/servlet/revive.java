package com.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Config.config;
import com.model.Tank;
import com.model.room;
import com.service.JsonUtils;

/**
 * Servlet implementation class meDeath
 */
@WebServlet("/revive")
public class revive extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public revive() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		
		ArrayList<Tank> tl = null;
		String name = request.getParameter("name");
		String RoomName = request.getParameter("RoomName");
		ArrayList<room> rl = config.rl;
		for(room r:rl){
			if(r.getrName().equals(RoomName)){
				tl = r.getTl();
			}
		}
//		response.getWriter().print(name+"you death");
		for(Tank t:tl){
			if(t.getName().equals(name)){
				t.setHp(100);
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
