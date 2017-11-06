<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
request.setCharacterEncoding("utf-8"); 
response.setContentType("text/html;charset=UTF-8");
 %>
<jsp:useBean id="course" class="com.entity.Course" />
<jsp:setProperty property="*" name="course"/>
<jsp:useBean id="courseDao" class="com.dao.CourseDao"/>
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
  		courseDao.updateCourse(course);
  		response.sendRedirect("adminSearchCourse.jsp");
     %>
  </body>
</html>
