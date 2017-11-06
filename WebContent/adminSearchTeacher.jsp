<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="com.entity.*,com.dao.*" %>
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
	<style type="text/css">
		body {
			background:url(images/searchCourse.jpg);
		}
		h1,form {
			text-align:center;
		}
		table {
			border-collapse:collapse;
			margin:0px auto;
			text-align:center;
			font-size:1.2em;
		}
		p {
			font-size:1.2em;
			text-align:center;
		}
	</style>

  </head>
  
  <body>
  	<%
  		request.setCharacterEncoding("utf-8"); 
  		response.setContentType("text/html;charset=UTF-8");
  	%>
  
  		<h1>查看教师信息</h1>  		
  	  	<table border="1px" cellspacing="0px">
  		<tr>
  			<td>教师编号</td>
  			<td>姓名</td>
  			
  			<td>授课科目</td>
  			<td>删除</td>
  		</tr>
  		
  		<%
  			String[] color = {"yellow", "green"};
  			ArrayList<Teacher> list = (ArrayList<Teacher>)teacherDao.getAllTeacher();
  			if (list != null && list.size() > 0) {
  				for (int i = 0; i < list.size(); i++) {
  					Teacher teacher = list.get(i);
	  	%>
		<tr bgcolor="<%=color[i%2] %>" >
			<td><%=teacher.getSid() %></td>
			<td><%=teacher.getSname() %></td>
			
			<td><%=teacher.getScourse() %></td>
			<td><a href="adminDeleteTeacher.jsp?sid=<%=teacher.getSid() %>">删除</a></td>
		</tr>
	  			
	  	<%
	  			}
	  		}
  		%>
  		</table>
  		<p><a href="adminMain.jsp">[返回主界面]</a></p>
  </body>
</html>
