<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="com.entity.Student" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>学生登录</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		* {
/* 			border:1px solid #F00; */
		}
		body {
			background:#AAFFEE url(images/10.jpg);
			text-align:center;
			
		}
		#wel {
			margin: 100px 400px 0 400px;
			//border:1px solid #000;
		}
		a {
		  
		   // margin:10px 10px;
			font-size:1.5em;
			background: #BBFFEE;
			text-decoration:none;
		}
		a:hover {background: #00BBFF;}
	</style>

  </head>
  
  <body>
  	
  	<div id="wel">
  		<h1>欢迎登录，<%=((Student)session.getAttribute("user")).getSname()%></h1>
  		<p><a href="QueryServlet">选课</a></p>
  		<p><a href="studentSelected.jsp">查看已选课程</a></p>
  		<p><a href="index.jsp">退出登录</a></p>
  	</div>
  </body>
</html>
