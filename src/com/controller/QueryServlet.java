package com.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.CourseDao;
import com.entity.Course;

public class QueryServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8"); 
		resp.setCharacterEncoding("utf-8");
		String cname = "";
		//得到页面传过来的课程名称
		if (req.getParameter("course") != null) cname = req.getParameter("course");
		cname = cname.trim();//返回副本，去除前空白后空白
		ArrayList<Course> list = new ArrayList<Course>();
		CourseDao dao = new CourseDao();
		if ("".equals(cname)) {
			//在JavaBean页面得到所有课程
			list = dao.getAllCourse();
		} else {
			//在JavaBean页面得到查询的课程
			list = dao.getCourseByName(cname);
		}
		req.setAttribute("courseList", list);
		req.setAttribute("course", cname);
		req.getRequestDispatcher("studentSearchCourse.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
