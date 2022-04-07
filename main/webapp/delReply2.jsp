<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK" import="com.jspsmart.upload.*"%>
<%@page import="com.DataBase.MyDb"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>

<!DOCTYPE html>
<html>
<head>
<title>【管理员】用户删除成功</title>
<link href="css/post.css" rel="stylesheet" type="text/css" media="all">
</head>
<body>
	<%
	String img = (String) session.getAttribute("img");
	String id = request.getParameter("id");
	MyDb service = new MyDb();
	service.getConn("social_web", "root", "123456");
	String sql = String.format("delete from replys where reply_id='%s';", id);
	service.executeUpdate2(sql);
	service.closeConn();
	%>
<div class = "pinkbox">
<h3>删除成功！</h3>
	<a href="showPost.jsp?img=<%=img%>">查看</a>
</div>
	
</body>

</html>