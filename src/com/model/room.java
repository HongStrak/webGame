package com.model;

import java.util.ArrayList;

public class room {
	private String rName;
	private boolean isEnter=true;
	private ArrayList<Tank> tl = new ArrayList<Tank>();
	public ArrayList<Tank> getTl() {
		return tl;
	}
	public void setTl(ArrayList<Tank> tl) {
		this.tl = tl;
	}
	public String getrName() {
		return rName;
	}
	public void setrName(String rName) {
		this.rName = rName;
	}
	public boolean isEnter() {
		return isEnter;
	}
	public void setEnter(boolean isEnter) {
		this.isEnter = isEnter;
	}
	
}
