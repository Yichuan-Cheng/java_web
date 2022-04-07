<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK" import="com.jspsmart.upload.*"%>
<%@page import="com.DataBase.MyDb"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link href="css/post.css" rel="stylesheet" type="text/css" media="all">
</head>
<body>
	<%
	String img = request.getParameter("img");

	MyDb service = new MyDb();
	service.getConn("social_web", "root", "123456");
	String sql = String.format("delete from posts where post_img='%s';", img);
	service.executeUpdate2(sql);
	service.closeConn();
	%>
	<div class = "pinkbox">
	<h3>删除成功！</h3>
	<a href="adminshowPage.jsp">返回主页</a>
	</div>
	
</body>

</html>