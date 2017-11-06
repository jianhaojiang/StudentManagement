<%@ page language="java" import="java.util.*, java.net.*" contentType="text/html; charset=utf-8"%>
<jsp:useBean id="student" class="com.entity.Student" />
<jsp:useBean id="studentDao" class="com.dao.StudentDao"/>
<%-- <jsp:setProperty property="*" name="course"/> --%>
 
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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

<!-- <link rel="stylesheet" type="text/css" href="styles.css"> -->

</head>

<body>
	<%
		request.setCharacterEncoding("utf-8"); 
	  	response.setContentType("text/html;charset=UTF-8");
	  	student.setSpwd(request.getParameter("spwd"));
	  	student.setSname(request.getParameter("sname"));
		studentDao.addStudent(student);
		//request.getRequestDispatcher("adminAddStudent.jsp").forward(request, response);
		response.sendRedirect("adminAddStudent.jsp"); 
	 %>
</body>
</html>
 