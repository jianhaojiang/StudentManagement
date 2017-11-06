<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="com.entity.*,com.dao.*" %>
<jsp:useBean id="studentDao" class="com.dao.StudentDao" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

  	<%
  		int cid = Integer.parseInt(request.getParameter("cid"));
  		Student student = (Student)session.getAttribute("user");
  		if (studentDao.addCourse(student, cid)) {
  			// 如果此同学没有选过该门课 选课成功
			request.setAttribute("selectResult", "选课成功！");	
  		} else {
  			// 选课失败
  			request.setAttribute("selectResult", "选课失败，请勿重复选择！");	
  		}
  		request.getRequestDispatcher("studentSelectResult.jsp").forward(request, response);
  	%>