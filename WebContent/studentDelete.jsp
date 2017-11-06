<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="com.entity.*,com.dao.StudentDao" %>
<jsp:useBean id="studentDao" class="com.dao.StudentDao" />

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>学生登录</title>
    
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
    	Student student = (Student)session.getAttribute("user");
    	int cid = Integer.parseInt(request.getParameter("cid"));
    	if (studentDao.deleteCourse(student, cid)) {
    %>
    	<h1>删除成功！</h1>
    <%
    	} else {
     %>
    	<h1>删除失败，已出成绩课程不可以删除！</h1>
    <%
    	}
     %>
     <a href="studentSelected.jsp">返回查看已选课程</a>
  </body>
</html>
