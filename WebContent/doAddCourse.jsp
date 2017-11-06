<%@ page language="java" import="java.util.*, java.net.*" contentType="text/html; charset=utf-8"%>
<jsp:useBean id="course" class="com.entity.Course" />
<jsp:useBean id="courseDao" class="com.dao.CourseDao"/>
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
	//   	out.print(request.getParameter("cname"));
	//   	out.print(request.getParameter("credit"));
	//   	out.print(URLEncoder.encode(request.getParameter("cname"),"utf-8"));
	  	course.setCredit(Integer.parseInt(request.getParameter("credit")));
	  	course.setCname(request.getParameter("cname"));
		courseDao.addCourse(course);
		//request.getRequestDispatcher("adminAddCourse.jsp").forward(request, response);
		response.sendRedirect("adminAddCourse.jsp");
	 %>
</body>
</html>
 