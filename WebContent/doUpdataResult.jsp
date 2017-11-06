<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="com.entity.*,com.dao.*" %>
<jsp:useBean id="studentDao" class="com.dao.StudentDao" />
<jsp:useBean id="courseDao" class="com.dao.CourseDao" />
<jsp:useBean id="optcouDao" class="com.dao.OptcouDao" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>学生信息</title>
    
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
			background: url(images/studentSelected.jpg);
		}
		table {
			border-collapse:collapse;
			margin:0px auto;
			text-align:center;
			font-size:1.2em;
		}
		h1 {
			text-align:center;
		}

		p {
			font-size:1.2em;
			text-align:center;
		}
	
	</style>

  </head>
  
  <body>
    <%
   Teacher teacher=(Teacher)session.getAttribute("user");
    %>	
  	<h1><%=teacher.getScourse() %>的成绩信息</h1>
  	<%
  	
  	
  	%>
  
  	<table border="1px" cellspacing="0px">
  		<tr>
  		    <td>课程</td>
  			<td>学号</td>
  			<td>姓名</td>
  			<td>成绩</td>
  			<td>操作</td>
  		</tr>
  		
  		<%
  			String[] color = {"yellow", "green"};
  		   // System.out.println("号码："+Integer.parseInt(request.getParameter("sid")));
  			
  			//System.out.println("号码："+Integer.parseInt(request.getParameter("sid")));
  			//System.out.println("学号1："+(studentDao.getStudent(Integer.parseInt(request.getParameter("sid")))).getSid());
  			//System.out.println("学号2："+student.getSid());
            Course course=courseDao.getCourseById(teacher.getScourse());
  			ArrayList<optcou> list = optcouDao.getAllOptcou(course.getCid());
  			for (int i = 0; i < list.size(); i++) {
  				optcou opt = list.get(i);
  				Student student=studentDao.getStudent(opt.getSid());
  		%>
  			<tr bgcolor="<%=color[i%2] %>" >
  			    <td><%=teacher.getScourse() %></td>
  				<td><%=opt.getSid() %></td>
	  			<td><%=student.getSname() %></td>
	  			<!-- 如何把为null的成绩不显示出来 把默认成绩改成了-1 -->
	  			<td><%=Double.parseDouble(opt.getScore())<0?"":Double.parseDouble(opt.getScore()) %></td>
	  			<td><a href="resultAmendOneself.jsp?cid=<%=opt.getCid() %>&sid=<%=student.getSid() %>&score=<%=Double.parseDouble(opt.getScore())<0?-1:Double.parseDouble(opt.getScore()) %>">修改</a></td>
  			</tr>
  			
  		<%
  			}
  		%>
  		
  	</table>
  	<p><a href="teacherMain.jsp">[返回主界面]</a></p>
  	
  </body>
</html>