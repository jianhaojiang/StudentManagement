<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="com.entity.*,com.dao.StudentDao,com.dao.TeacherDao,com.dao.CourseDao" %>
<jsp:useBean id="studentDao" class="com.dao.StudentDao" />
<jsp:useBean id="teacherDao" class="com.dao.TeacherDao" />
<jsp:useBean id="courseDao" class="com.dao.CourseDao" />

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>教师登录</title>
    
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
				background:url(images/updateCourse.jpg);
			}
			form {
				text-align:center;
				margin:30px auto;
				width:400px;
				border:1px solid #000;
			}
		</style> 
		
  </head>
  
  <body>
    <%
    	Teacher teacher = (Teacher)session.getAttribute("user");
	    //System.out.println("老师scourse："+teacher.getScourse());
    	int cid = Integer.parseInt(request.getParameter("cid"));
    	//System.out.println("号码cid："+Integer.parseInt(request.getParameter("cid")));
    	int sid = Integer.parseInt(request.getParameter("sid"));
    	double score = Double.parseDouble(request.getParameter("score"));
    	//System.out.println("号码sid："+Integer.parseInt(request.getParameter("sid")));
    	Student student = studentDao.getStudent(Integer.parseInt(request.getParameter("sid")));
    	String string=courseDao.getCourseById(cid).getCname();
    	
    	//System.out.println("cid对应的课程："+string);
    	if(!teacher.getScourse().equals(string)){
    %>
    	<h1>没有权限修改学生其他科目的成绩！</h1>
    <%
    	}else{
     %>
     	<form action="doUpdateOptcouOneself.jsp?sid=<%=sid %>&cid=<%=cid %>" method="post">
	    	<p><label>当前学生： <%=student.getSname()%></label></p>
	    	<p><label>当前课程： <%=string%></label></p>
	    	<p><label>修改成绩：</label>
  		    <input type="text" name="score" value="<%=score<0?"":score%>"></p>
  		    <p><input type="submit" value="更新"></p>
    	</form>
    <%
    	}
     %>
     <a href="doUpdataResult.jsp">点击返回</a>
  </body>
</html>
