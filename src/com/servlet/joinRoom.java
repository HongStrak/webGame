package com.servlet;

import java.io.IOException;
import java.util.ArrayList;
import com.Config.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.Tank;
import com.model.room;

/**
 * Servlet implementation class joinRoom
 */
@WebServlet("/joinRoom")
public class joinRoom extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public joinRoom() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String RoomName = request.getParameter("RoomName");
		String name = request.getParameter("name");
		ArrayList<room> rl = config.rl;
		ArrayList<Tank> tl = null;
		synchronized (rl) {
			
		
		for(room r:rl){
			if(r.getrName().equals(RoomName)){
				tl = r.getTl();
			}
		}
		Tank t = new Tank();
		t.setName(name);
		tl.add(t);
		request.getRequestDispatcher("room.jsp?RoomName="+RoomName+"&name="+name).forward(request, response);
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
