package com.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Config.config;
import com.model.room;
import com.service.JsonUtils;

@WebServlet("/room")
public class RoomServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;

	protected void refresh(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String roomName = request.getParameter("roomName");
		ArrayList<room> list = config.rl;
		for (room room : list) {
			if(room.getrName().equals(roomName)) {
				String tanks = JsonUtils.objectToJson(room.getTl());
				response.getWriter().write(tanks);
				return;
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
