package com.model;

import java.util.LinkedList;
import java.util.Queue;

public class Tank {
private String x;
private String y;
private int hp=100;
private int headCount=0;
private Queue<String> mess = new LinkedList<String>();
public String messpoll(){
	return mess.poll();  //当列头为空时返回null
}
public void offer(String str){
	mess.offer(str);
}
public int getHeadCount() {
	return headCount;
}
public void setHeadCount(int headCount) {
	this.headCount = headCount;
}
public int getHp() {
	return hp;
}
public void setHp(int hp) {
	this.hp = hp;
}
public String getX() {
	return x;
}
public void setX(String x) {
	this.x = x;
}
public String getY() {
	return y;
}
public void setY(String y) {
	this.y = y;
}
private String name;
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}

}
