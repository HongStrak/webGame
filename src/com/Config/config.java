package com.Config;

import java.util.ArrayList;
import java.util.List;

import com.model.Tank;

public class config {
	public static ArrayList<Tank> tl = new ArrayList<Tank>();


	public static void update(String name,String x,String y){
		for(int i=0;i<tl.size();i++){
			Tank t = tl.get(i);
			if(t.getName().equals(name)){
				tl.remove(t);
			}
		}
		
		Tank nt = new Tank();
		nt.setX(x);
		nt.setY(y);
		nt.setName(name);
		tl.add(nt);
	}
}
