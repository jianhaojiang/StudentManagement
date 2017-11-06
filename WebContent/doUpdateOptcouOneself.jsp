<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
request.setCharacterEncoding("utf-8"); 
response.setContentType("text/html;charset=UTF-8");
 %>
<jsp:useBean id="optcou" class="com.entity.optcou" />
<jsp:useBean id="optcouDao" class="com.dao.OptcouDao"/>
<jsp:setProperty property="*" name="optcou"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>老师登录</title>
    
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
    
        optcouDao.UpdataOptcou(optcou);
	    //System.out.println("调试1");
  		response.sendRedirect("doUpdataResult.jsp");
     %>
  </body>
</html>
