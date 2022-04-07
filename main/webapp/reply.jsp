<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK" import="com.jspsmart.upload.*"%>
<%@page import="com.DataBase.MyDb"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<%
	String img = (String) session.getAttribute("img");
	String id = (String) session.getAttribute("userId");
	String nickname = (String) session.getAttribute("nickname");
	Date currentTime = new java.util.Date();//得到当前系统时间 
	SimpleDateFormat sim = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
	String strdate = sim.format(currentTime); //将日期时间格式化 
	String reply_id = strdate + id;
	String content = request.getParameter("content");

	MyDb service = new MyDb();
	service.getConn("social_web", "root", "123456");
	String sql = String.format("insert into replys values('%s','%s','%s','%s','%s','%S')", reply_id, strdate, id, img,
			content, nickname);
	service.executeUpdate2(sql);
	response.sendRedirect(String.format("showPost.jsp?img=%s",img));
	%>
	<%
	service.closeConn();
	%>
</body>

</html>