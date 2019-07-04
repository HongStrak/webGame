package com.model;

import java.util.Date;
 
public class History {
	private int heronum ;
	private String heroname;
	private int victory;
	private float winrate;
	private float averank;
	
	
	
	
	public History() {
		super();
	}
	
	
	public History(int heronum, String heroname, int victory, float winrate, float averank) {
		super();
		this.heronum = heronum;
		this.heroname = heroname;
		this.victory = victory;
		this.winrate = winrate;
		this.averank = averank;
	}


	public int getHeronum() {
		return heronum;
	}
	public void setHeronum(int heronum) {
		this.heronum = heronum;
	}
	public String getHeroname() {
		return heroname;
	}
	public void setHeroname(String heroname) {
		this.heroname = heroname;
	}
	public int getVictory() {
		return victory;
	}
	public void setVictory(int victory) {
		this.victory = victory;
	}
	public float getWinrate() {
		return winrate;
	}
	public void setWinrate(float winrate) {
		this.winrate = winrate;
	}
	public float getAverank() {
		return averank;
	}
	public void setAverank(float averank) {
		this.averank = averank;
	}
	
	
}
