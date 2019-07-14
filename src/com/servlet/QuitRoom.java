package com.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.Config.*;
import com.model.Tank;
import com.model.room;
/**
 * Servlet implementation class QuitRoom
 */
@WebServlet("/QuitRoom")
public class QuitRoom extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuitRoom() {
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
		String RoomName = request.getParameter("RoomName");
		
		//从房间列表中找到对应房间
		ArrayList<room> rl = config.rl;
		ArrayList<Tank> tl = null;
		
		room room = null;
		synchronized (rl) {
			
		
		for(room r:rl){
			if(r.getrName().equals(RoomName)){
				room = r;
				tl = r.getTl();
			}
		}
		
		if(!name.equals(RoomName)){
			//从坦克列表中删除对象
		//	synchronized (tl) {
			Tank t= null;
				for(int i=0;i<tl.size();i++){
					t=tl.get(i);
					if(t.getName().equals(name)){
						tl.remove(t);
					}
				}
		//	}
			
			request.getRequestDispatcher("gameLo.jsp?name="+name).forward(request, response);
		}else if(name.equals(RoomName)){
			rl.remove(room);
			request.getRequestDispatcher("gameLo.jsp?name="+name).forward(request, response);
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
