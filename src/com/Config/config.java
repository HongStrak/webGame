package com.Config;

import java.util.ArrayList;
import java.util.Map;
import java.util.TreeMap;

import com.model.Tank;
import com.model.room;

public class config {
	public static ArrayList<room> rl = new ArrayList<room>();
	
	//悬着坦克集合群发消息
	public static void GroupSend(ArrayList<Tank> tl,String str){
		for(Tank t:tl){
			t.offer(str);
		}
	}
}
