package com.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.entity.*;
import com.util.DBUtil;

public class TeacherDao {
	
	public boolean isValid(Teacher teacher) {
		//System.out.println("教师验证成功3");
		Connection conn = null;
		PreparedStatement pstmt = null; 
		ResultSet rs = null;
		
		try {
			//System.out.println("教师验证成功4");
			conn = DBUtil.getConnection();
			String sql = "select * from teacher where sid=? and spwd=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, teacher.getSid());
			//System.out.println(teacher.getSid());
			pstmt.setString(2, teacher.getMD5Spwd());
			//System.out.println(teacher.getSpwd());
			rs = pstmt.executeQuery();
			if (rs != null && rs.next()) {
				//System.out.println("教师验证成功");
				teacher.setSname(rs.getString("sname"));
				teacher.setScourse(rs.getString("scourse"));
				return true;
			} else {
				return false;
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		//System.out.println("教师验证失败");
		return false;
	}
	

	//已改
	public ArrayList<Teacher> getAllTeacher() {
		
		ArrayList<Teacher> list = new ArrayList<Teacher>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBUtil.getConnection();
			String sql = "select * from teacher";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs != null && rs.next()) {
				Teacher teacher = new Teacher();
				teacher.setSid(rs.getInt(1));
				teacher.setSpwd(rs.getString(2));
				teacher.setSname(rs.getString(3));
				teacher.setScourse(rs.getString(4));
				list.add(teacher);
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return list;
	}
	
	//已改
	public void addTeacher(Teacher teacher) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBUtil.getConnection();
			String sql = "insert into teacher(sid,sname,spwd,scourse) values(?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, teacher.getSid());
			pstmt.setString(2, teacher.getSname());
			pstmt.setString(3, teacher.getMD5Spwd());
			pstmt.setString(4, teacher.getScourse());
			pstmt.executeUpdate();
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
	//已改
	public void deleteTeacherById(int sid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBUtil.getConnection();
			String sql = "delete from teacher where sid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sid);
			pstmt.executeUpdate();
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
//	public boolean deleteCourse(Student student, int cid) {
//		
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		
//		try {
//			conn = DBUtil.getConnection();
//			String sql = "select score from optcou where sid=? and cid=? and score > 0";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, student.getSid());
//			pstmt.setInt(2, cid);
//			rs = pstmt.executeQuery();
//			if (rs != null && rs.next()) {
//				// 存在成绩 不可以删除
//				return false;
//			} else {
//				// 成绩不存在，可以删除
//				sql = "delete from optcou where sid=? and cid=?";
//				pstmt = conn.prepareStatement(sql);
//				pstmt.setInt(1, student.getSid());
//				pstmt.setInt(2, cid);
//				pstmt.executeUpdate();
//				return true;
//			}
//		} catch (SQLException ex) {
//			ex.printStackTrace();
//		}
//		
//		return false;
//		
//	}
	
//	public boolean addCourse(Student student, int cid) {
//		
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		
//		try {
//			conn = DBUtil.getConnection();
//			String sql = "select * from optcou where sid=? and cid=?";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, student.getSid());
//			pstmt.setInt(2, cid);
//			rs = pstmt.executeQuery();
//			if (rs != null && rs.next()) {
//				// 该同学已经选过该门课 不能重复选择
//				return false;
//			} else {
//				// 没选过 可以选择
//				sql = "insert into optcou(sid, cid) values(?, ?)";
//				pstmt = conn.prepareStatement(sql);
//				pstmt.setInt(1, student.getSid());
//				pstmt.setInt(2, cid);
//				pstmt.executeUpdate();
//				return true;
//			}
//		} catch (SQLException ex) {
//			ex.printStackTrace();
//		}
//		
//		return false;
//	}
//	public ArrayList<OptCourse> getSelectedCourse(Teacher teacher) {
//	
//	ArrayList<OptCourse> list = new ArrayList<OptCourse>();
//	Connection conn = null;
//	PreparedStatement pstmt = null;
//	ResultSet rs = null;
//	
//	try {
//		conn = DBUtil.getConnection();
//		String sql = "select course.cid, cname, credit, score from student, course, optcou where student.sid = optcou.sid and course.cid = optcou.cid and student.sid=?";
//		pstmt = conn.prepareStatement(sql);
//		pstmt.setInt(1, teacher.getSid());
//		rs = pstmt.executeQuery();
//		while (rs != null && rs.next()) {
//			OptCourse oc = new OptCourse();
//			oc.setCid(rs.getInt(1));
//			oc.setCname(rs.getString("cname"));
//			oc.setCredit(rs.getInt("credit"));
//			oc.setScore(rs.getDouble("score"));
//			list.add(oc);
//		}
//	} catch (SQLException ex) {
//		ex.printStackTrace();
//	}
//	
//	return list;
//}

}
