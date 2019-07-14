package com.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.Config.*;
import com.model.room;
/**
 * Servlet implementation class startGame
 */
@WebServlet("/startGame")
public class startGame extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public startGame() {
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
		
		ArrayList<room> rl = config.rl;
		boolean isEnter = true;
//		String blo="true";
		synchronized (rl) {
			for(room r:rl){
				if(r.getrName().equals(RoomName)){
					isEnter=r.isEnter();
					System.out.println(r.isEnter());
				}
			}
		}
//		if(isEnter==true){
//			blo="true";
//		}else{
//			blo="false";
//		}
		response.getWriter().print(isEnter);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
