package com.entity;

public class optcou {
	private int sid;
	private int cid;
	private String score;
	
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
		// System.out.println("调试1");
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;		
	}
}
