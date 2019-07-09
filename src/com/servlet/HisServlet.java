package com.servlet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.History;
@WebServlet("/history")
public class HisServlet extends BaseServlet {
	public void searchhistory(HttpServletRequest request, HttpServletResponse response){
		int pz=6;//每页显示的记录数
		
		String heroname = request.getParameter("heroname");
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/orcl", "scott", "admin");
			
			int cp=1;
			String currentPage = request.getParameter("cp");
			if(currentPage!=null){
				cp=Integer.parseInt(currentPage);
			}
			
			String sql="select * from (select t1.*,rownum num from "
					+ "(select * from history order by heronum desc) t1 where rownum<="+pz*cp+") t2 "
					+ "where t2.num>"+(cp-1)*pz+"and  1=1";
			if(heroname!=null && !heroname.equals("")){
				sql=" select * from history where heroname=? ";
			} 
			PreparedStatement psmt = conn.prepareStatement(sql);
			if(heroname!=null && !heroname.equals("")){
				psmt.setObject(1, heroname);
			}
			    
			ResultSet rs = psmt.executeQuery();
			List historys = new ArrayList();
			while(rs.next()){
				int heronum = rs.getInt(1); 
				String name = rs.getString(2);
				int victory = rs.getInt(3);
				float winrate=rs.getFloat(4);
				float averank=rs.getFloat(5);
				
				
				History history = new History();
				history.setHeronum(heronum);
				history.setHeroname(name);
				history.setVictory(victory);
				history.setWinrate(winrate);
				history.setAverank(averank);
				
				historys.add(history);
			}
			
			//计算总记录数
			sql="select count(*) from history";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			int count=0;
			if(rs.next()){
				count = rs.getInt(1);
			}
			
			
			//计算总页数
			int totalPage = count%pz==0?count/pz:count/pz+1;
			
			request.setAttribute("totalPage", totalPage);
			request.setAttribute("cp", cp);
			request.setAttribute("historys", historys);
			request.getRequestDispatcher("History.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
