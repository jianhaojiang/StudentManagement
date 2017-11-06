package com.entity;
import com.entity.MD5;

public class Student {
	
	private int sid;
	private String spwd;
	private String sname;
	

	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public String getSpwd() {
		return spwd;
	}
	
	public String getMD5Spwd() {
		return MD5.makeMD5(spwd);
	}
	
	public void setSpwd(String spwd) {
		this.spwd = spwd;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	
	
	
}
