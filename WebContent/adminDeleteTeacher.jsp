<%@ page language="java" import="java.util.*,com.entity.Teacher" contentType="text/html; charset=utf-8"%>
<jsp:useBean id="teacherDao" class="com.dao.TeacherDao" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>管理员登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  	<%
  	    teacherDao.deleteTeacherById(Integer.parseInt(request.getParameter("sid")));
  		response.sendRedirect("adminSearchTeacher.jsp");
  	 %>
  </body>
</html>
