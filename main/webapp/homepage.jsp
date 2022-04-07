<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="com.DataBase.MyDb"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/homepage.css">
<script src="js/prefixfree.min.js"></script>
<title>个人主页</title>
</head>
<body>

<%
	String id = (String) session.getAttribute("userId");
	MyDb service = new MyDb();
	String sql = String.format("select * from users where user_id='%s'", id);
	service.getConn("social_web", "root", "123456");
	ResultSet rs = service.executeQuery1(sql);
	rs.next();
	String nickname = rs.getString("user_nickname");
	%>
	
<div id = "banner"><div id = "banner-content"><img src="images/logow.png"   width = 150px height = 100px></div></div>
	<h1><%=nickname %>, 欢迎回来！</h1>
	
	<img class = "logo1" src = "images/look1.png" onclick = pic1()>
	<img class = "logo2" src = "images/send1.png" onclick = pic2()>
	<img class = "logo3" src = "images/reset1.png" onclick = pic3()>
	<img class = "logo4" src = "images/info1.png" onclick = pic4()>
	
</body>

<script>
function pic1(){
	location.href = "showPage.jsp";
}
function pic2(){
	location.href = "putPost.jsp";
}
function pic3(){
	location.href = "resetPasswd.jsp";
}
function pic4(){
	location.href = "person.jsp";
}
</script>
</html>