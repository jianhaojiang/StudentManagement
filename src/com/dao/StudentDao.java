package com.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.entity.*;
import com.entity.Student;
import com.util.DBUtil;

public class StudentDao {
	
	public boolean isValid(Student student) {
		
		Connection conn = null;
		PreparedStatement pstmt = null; 
		ResultSet rs = null;
		
		try {
			conn = DBUtil.getConnection();
			String sql = "select * from student where sid=? and spwd=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, student.getSid());
			//System.out.println(student.getSpwd());
			pstmt.setString(2, student.getMD5Spwd());
			rs = pstmt.executeQuery();
			
			if (rs != null && rs.next()) {
				//System.out.println(rs.getString(2));
				student.setSname(rs.getString("sname"));
				return true;
			} else {
				return false;
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		
		return false;
	}
	
	public ArrayList<OptCourse> getSelectedCourse(Student student) {
		
		ArrayList<OptCourse> list = new ArrayList<OptCourse>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBUtil.getConnection();
			String sql = "select course.cid, cname, credit, score from student, course, optcou where student.sid = optcou.sid and course.cid = optcou.cid and student.sid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, student.getSid());
			rs = pstmt.executeQuery();
			while (rs != null && rs.next()) {
				OptCourse oc = new OptCourse();
				oc.setCid(rs.getInt(1));
				oc.setCname(rs.getString("cname"));
				oc.setCredit(rs.getInt("credit"));
				oc.setScore(rs.getDouble("score"));
				list.add(oc);
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		
		return list;
	}
	
	public ArrayList<Student> getAllStudent() {
		
		ArrayList<Student> list = new ArrayList<Student>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBUtil.getConnection();
			String sql = "select * from student";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs != null && rs.next()) {
				Student student = new Student();
				student.setSid(rs.getInt(1));
				student.setSpwd(rs.getString(2));
				student.setSname(rs.getString(3));
				list.add(student);
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		
		return list;
	}
	
    public Student getStudent(int sid) {
		
	//	ArrayList<Student> list = new ArrayList<Student>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Student student = new Student();
		
		try {
			//System.out.println("Dao号码1：");
			conn = DBUtil.getConnection();
			String sql = "select * from student where sid=?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, sid);
			rs = pstmt.executeQuery();
			if (rs != null && rs.next()){
				student.setSid(rs.getInt(1));
				student.setSpwd(rs.getString(2));
				student.setSname(rs.getString(3));
			}
			
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return student;
	}

	public boolean deleteCourse(Student student, int cid) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBUtil.getConnection();
			String sql = "select score from optcou where sid=? and cid=? and score > 0";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, student.getSid());
			pstmt.setInt(2, cid);
			rs = pstmt.executeQuery();
			if (rs != null && rs.next()) {
				// 存在成绩 不可以删除
				return false;
			} else {
				// 成绩不存在，可以删除
				sql = "delete from optcou where sid=? and cid=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, student.getSid());
				pstmt.setInt(2, cid);
				pstmt.executeUpdate();
				return true;
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		
		return false;
		
	}
	
	public boolean addCourse(Student student, int cid) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBUtil.getConnection();
			String sql = "select * from optcou where sid=? and cid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, student.getSid());
			pstmt.setInt(2, cid);
			rs = pstmt.executeQuery();
			if (rs != null && rs.next()) {
				// 该同学已经选过该门课 不能重复选择
				return false;
			} else {
				// 没选过 可以选择
				sql = "insert into optcou(sid, cid) values(?, ?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, student.getSid());
				pstmt.setInt(2, cid);
				pstmt.executeUpdate();
				return true;
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		
		return false;
	}
	
	public void addStudent(Student student) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBUtil.getConnection();
			String sql = "insert into student(sname, spwd) values(?, ?)";
			pstmt = conn.prepareStatement(sql);
			System.out.println( student.getMD5Spwd());
			pstmt.setString(1, student.getSname());
			pstmt.setString(2, student.getMD5Spwd());
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
	
	public void deleteStudentById(int sid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBUtil.getConnection();
			String sql = "delete from student where sid=?";
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
//	public static void main(String[] args) {
//		StudentDao dao = new StudentDao();
//		Student student = new Student();
//		student.setSid(100000000);
//		student.setSpwd("1");
//		dao.isValid(student);
//		System.out.println(student.getSname());
////		
////		ArrayList<OptCourse> list = dao.getSelectedCourse(student);
////		for (OptCourse oc: list) {
////			System.out.println(oc.getCname() + "," + oc.getCredit() + "," + oc.getScore());
////		}
//		
//		//dao.deleteCourse(student, 100000003);
//		
//	}
}
