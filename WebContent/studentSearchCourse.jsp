<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="com.entity.*,com.dao.*" %>
<jsp:useBean id="courseDao" class="com.dao.CourseDao" />
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
  		//out.print("("+request.getAttribute("course")+")");
  	%>
  
  		<h1>查看课程</h1>
  		<form action="QueryServlet" method="post">
  			输入要查询的课程名：<input type="text" name="course" value="" />
  			<input type="submit" value="搜索">
  		</form>
  		
  	  	<table border="1px" cellspacing="0px">
  		<tr>
  			<td>课程号</td>
  			<td>课程名</td>
  			<td>学分</td>
  			<td>操作</td>
  		</tr>
  		
  		<%
  			int cutpage = 1;//当前页码
  			final int cntPrePage = 7;//单页显示的数目
  			if (request.getParameter("cutpage") != null) {
  				cutpage = Integer.parseInt(request.getParameter("cutpage"));
  			}
  			String[] color = {"yellow", "green"};
  			
  			Student student = (Student)session.getAttribute("user");
  			ArrayList<Course> list = (ArrayList<Course>)request.getAttribute("courseList");
  			int count = list.size();
  			int prepage = cutpage - 1;
  			int nxtpage = cutpage + 1;
  			if (prepage <= 0) prepage = 1;
  			if (cutpage * cntPrePage >= count) nxtpage = cutpage;
  			
  			if (list != null && list.size() > 0) {
  				for (int i = (cutpage-1)*cntPrePage; i < cutpage*cntPrePage && i < count; i++) {
	  				Course course = list.get(i);
	  	%>
		<tr bgcolor="<%=color[i%2] %>" >
			<td><%=course.getCid() %></td>
			<td><%=course.getCname() %></td>
			<td><%=course.getCredit() %></td>
			<td><a href="studentSelectCourse.jsp?cid=<%=course.getCid()%>">选课</a></td>
		</tr>
	  			
	  	<%
	  			}
	  		}
  		%>
  		</table>
  		<p><a href="QueryServlet?cutpage=<%=prepage%>&course=<%=request.getAttribute("course") %>">[上一页]</a>
  			&nbsp;(<%=cutpage %>/<%=(count-1)/cntPrePage+1 %>)&nbsp;
  			<a href="QueryServlet?cutpage=<%=nxtpage%>&course=<%=request.getAttribute("course") %>">[下一页]</a></p>
  		<p><a href="studentMain.jsp">[返回主界面]</a></p>
  </body>
</html>
