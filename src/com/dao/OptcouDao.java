package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
//import java.math.BigDecimal;

import com.entity.*;
import com.util.DBUtil;

public class OptcouDao {

public void UpdataOptcou(optcou optcou) {
	Connection conn = null;
	PreparedStatement pstmt = null;
	double score=-1;
	try{
	 score=Double.parseDouble(optcou.getScore());
	}catch(Exception e){
		e.printStackTrace();
	}
	//BigDecimal a = new BigDecimal(Double.toString(optcou.getScore()));  
	try {
		conn = DBUtil.getConnection();
		String sql = "update optcou set score=? where sid=? and cid=? ";
		//System.out.println("调试1：");
		pstmt = conn.prepareStatement(sql);
		pstmt.setDouble(1, score);
		pstmt.setInt(2, optcou.getSid());
		pstmt.setInt(3, optcou.getCid());	
		//System.out.println("调试2："+optcou.getScore());
		pstmt.executeUpdate();
		//System.out.println("调试3：");

	} catch (SQLException ex) {
		ex.printStackTrace();
	} finally {
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
	
public ArrayList<optcou> getAllOptcou(int cid) {
	
	ArrayList<optcou> list = new ArrayList<optcou>();
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		conn = DBUtil.getConnection();
		String sql = "select * from optcou where cid=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, cid);
		rs = pstmt.executeQuery();
		while (rs != null && rs.next()) {
			optcou optcou1 = new optcou();
			optcou1.setSid(rs.getInt(1));
			optcou1.setCid(rs.getInt(2));
			optcou1.setScore(rs.getString(3));
			list.add(optcou1);
		}
	} catch (SQLException ex) {
		ex.printStackTrace();
	}
	
	return list;
}

}
