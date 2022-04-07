<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="com.DataBase.MyDb"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>

<title>查看个人信息</title>
</head>
<body background=images/forest3.jpg>
	<div id="showpost">
	<div class="header">
		<a href="homepage.jsp" style="color:#FFFFFF;font-size=16px">点击跳转个人主页</a>
	</div>
	<br>
	<br>
	
</div>
	<%
	String id = (String) session.getAttribute("userId");
	MyDb service = new MyDb();
	String sql = String.format("select * from users where user_id='%s'", id);
	service.getConn("social_web", "root", "123456");
	ResultSet rs = service.executeQuery1(sql);
	rs.next();
	String nickname = rs.getString("user_nickname");
	String email = rs.getString("user_email");
	%>
	<table  border="1" cellpadding="2"  cellspacing="0"  style="margin: 10px 40px;border:2px solid #FFC1C1;width: 80%;background-color: #FFC1C1; text-align: center;">
		<tr>
			<td>账号</td>
			<td>昵称</td>
			<td>邮箱</td>
		</tr>
		<tr>
			<td><%=id%></td>
			<td><%=nickname%></td>
			<td><%=email%></td>
		</tr>
	</table>

	<%
	service.closeConn();
	%>
</body>

<style>
	*{
		font-family:"Microsoft Yahei";
	}
	.header{
			width: 100%;
			height: 36px;
			line-height: 36px;
			background-color: 	#CD9B9B;
			text-align: right;
	}

</style>

</html>