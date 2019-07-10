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
import com.service.JsonUtils;

/**
 * Servlet implementation class ByShoot
 */
@WebServlet("/ByShoot")
public class ByShoot extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ByShoot() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//这俩行的代码是必要的
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		
		ArrayList<Tank> tl = config.tl;
		String name = request.getParameter("name");
		int attack = 0;
		try {
			attack = Integer.parseInt(request.getParameter("attack"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		for(Tank t:tl){
			if(t.getName().equals(name)){
				
				t.setHp((t.getHp()-attack));
				
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
