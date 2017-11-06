package com.dao;

public class AdminDao {
	public boolean isValid(String username, String password) {
		if ("001".equals(username) && "001".equals(password))
			return true;
		return false;
	}
}
