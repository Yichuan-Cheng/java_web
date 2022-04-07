<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="com.jspsmart.upload.*"%>
<%@page import="com.DataBase.MyDb"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>

<head>
<link rel="stylesheet" href="css/forget.css">
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<title>密码找回</title>
</head>

<body>
	<%
	response.setContentType("text/html;charset=utf-8");
	request.setCharacterEncoding("utf-8");
	String id = (String) session.getAttribute("userId");
	String ans = request.getParameter("ans");
	String passwd = request.getParameter("passwd");
	MyDb service = new MyDb();
	String sql = String.format("select * from users where user_id='%s'", id);
	service.getConn("social_web", "root", "123456");
	ResultSet rs = service.executeQuery1(sql);
	rs.next();
	String trueans = rs.getString("user_answer");
	String show = null;
	if (ans.equals(trueans)) {
		sql = String.format("update users set user_password='%s' where user_id='%s'", passwd, id);
		service.executeUpdate2(sql);
		show = "修改成功！";

	} else {
		show = "修改失败!密保答案错误！";

	}
	%>
	<div class = "box">
	<br><br><br>
	<h1><%=show%></h1>
	<a href='userLogin.jsp'>返回登录页面</a>
	</div>
	<%
	service.closeConn();
	%>
	
</body>
</html>