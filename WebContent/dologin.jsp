<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="com.entity.*" %>
<jsp:useBean id="loginStudent" class="com.entity.Student" scope="page" />
<jsp:useBean id="loginTeacher" class="com.entity.Teacher" scope="page" />
<jsp:useBean id="studentDao" class="com.dao.StudentDao" scope="page" />
<jsp:useBean id="teacherDao" class="com.dao.TeacherDao" scope="page" />
<jsp:useBean id="adminDao" class="com.dao.AdminDao" scope="page" />
<jsp:setProperty property="spwd" param="password" name="loginStudent" />
<jsp:setProperty property="sid" param="inumber" name="loginStudent" />
<jsp:setProperty property="spwd" param="password" name="loginTeacher" />
<jsp:setProperty property="sid" param="inumber" name="loginTeacher" />
<!-- 创建学生类和老师类的对象loginStudent和loginTeacher,然后jsp:setProperty使用setsid和setspwd设置他们账号密码 -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>欢迎登录</title>

</head>

<body>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	request.setCharacterEncoding("utf-8");
	String username = request.getParameter("inumber");
	String password = request.getParameter("password");
	String identity = request.getParameter("identity");
	
	// 如果登录的是学生
	if ("student".equals(identity)) {
		if (studentDao.isValid(loginStudent)) {
			// 账号密码合法
			session.setAttribute("user", loginStudent);

	  		String[] isUserCookies = request.getParameterValues("isUseCookie");
	  		if (isUserCookies != null && isUserCookies.length > 0) {
	  			Cookie usernameCookie = new Cookie("username", username);
	  			Cookie passwordCookie = new Cookie("password", password);
	  			usernameCookie.setMaxAge(864000);//10 days
	  			passwordCookie.setMaxAge(864000);
	  			response.addCookie(usernameCookie);
	  			response.addCookie(passwordCookie);
	  		} else {
	  			Cookie[] cookies = request.getCookies();
	  			if (cookies != null && cookies.length > 0) {
	  				for (Cookie c: cookies) {
	  					if (c.getName().equals("username") || c.getName().equals("password")) {
	  						c.setMaxAge(0);
	  						response.addCookie(c);
	  					}
	  				}
	  			}
	  		}
			
			request.getRequestDispatcher("studentMain.jsp").forward(request, response);
		} else {
			// 不合法
			request.getRequestDispatcher("failure.jsp").forward(request, response);
		}
	} else if ("teacher".equals(identity)) {// 如果登录的是教师
		//System.out.println("教师验证成功1");
		if (teacherDao.isValid(loginTeacher)) {
			// 账号密码合法
			//System.out.println("教师验证成功2");
			session.setAttribute("user", loginTeacher);

	  		String[] isUserCookies = request.getParameterValues("isUseCookie");
	  		if (isUserCookies != null && isUserCookies.length > 0) {
	  			Cookie usernameCookie = new Cookie("username", username);
	  			Cookie passwordCookie = new Cookie("password", password);
	  			usernameCookie.setMaxAge(864000);//10 days
	  			passwordCookie.setMaxAge(864000);
	  			response.addCookie(usernameCookie);
	  			response.addCookie(passwordCookie);
	  		} else {
	  			Cookie[] cookies = request.getCookies();
	  			if (cookies != null && cookies.length > 0) {
	  				for (Cookie c: cookies) {
	  					if (c.getName().equals("username") || c.getName().equals("password")) {
	  						c.setMaxAge(0);
	  						response.addCookie(c);
	  					}
	  				}
	  			}
	  		}
			
			request.getRequestDispatcher("teacherMain.jsp").forward(request, response);
		} else {
			// 不合法
			request.getRequestDispatcher("failure.jsp").forward(request, response);
		}
	} else if ("admin".equals(identity)) {
		if (adminDao.isValid(username, password)) {
			// 账号密码合法

	  		String[] isUserCookies = request.getParameterValues("isUseCookie");
	  		if (isUserCookies != null && isUserCookies.length > 0) {
	  			Cookie usernameCookie = new Cookie("username", username);
	  			Cookie passwordCookie = new Cookie("password", password);
	  			usernameCookie.setMaxAge(864000);//10 days
	  			passwordCookie.setMaxAge(864000);
	  			response.addCookie(usernameCookie);
	  			response.addCookie(passwordCookie);
	  		} else {
	  			Cookie[] cookies = request.getCookies();
	  			if (cookies != null && cookies.length > 0) {
	  				for (Cookie c: cookies) {
	  					if (c.getName().equals("username") || c.getName().equals("password")) {
	  						c.setMaxAge(0);
	  						response.addCookie(c);
	  					}
	  				}
	  			}
	  		}
			
			request.getRequestDispatcher("adminMain.jsp").forward(request, response);
		} else {
			// 不合法
			request.getRequestDispatcher("failure.jsp").forward(request, response);
		}
	} else {
		out.print("<h1>啊哦，你好像走错路了！</h1><br><a href=\"index.jsp\">[返回主界面]</a>");
	}

 %>
 
 </body>
</html>