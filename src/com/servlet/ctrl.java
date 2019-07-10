package com.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.Tank;
import com.model.room;
import com.service.JsonUtils;
import com.Config.*;
/**
 * Servlet implementation class ctrl
 */
@WebServlet("/ctrl")
public class ctrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ctrl() {
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
		System.out.println(name);
		ArrayList<room> rl = config.rl;
		for(room r:rl){
			if(r.getrName().equals(RoomName)){
				tl = r.getTl();
			}
		}
		
		String x = request.getParameter("x");
		String y = request.getParameter("y");
		
		for(Tank t:tl){
			if(t.getName().equals(name)){
				t.setX(x);
				t.setY(y);
			}
		}
		String json = JsonUtils.objectToJson(tl);
		response.getWriter().print(json);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
