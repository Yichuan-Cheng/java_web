<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK" import="com.jspsmart.upload.*"%>
<%@page import="com.DataBase.MyDb"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<title>��������</title>
<link rel="stylesheet" href="css/forget.css">
</head>
<body>
	<%
	String id = (String) session.getAttribute("userId");
	String oldpasswd = request.getParameter("oldPasswd");
	String newpasswd = request.getParameter("passwd");
	MyDb service = new MyDb();
	service.getConn("social_web", "root", "123456");
	String sql = String.format("select * from users where user_id='%s';", id);
	ResultSet rs = service.executeQuery1(sql);
	rs.next();
	String show = null;
	String tpasswd = rs.getString("user_password");
	if (oldpasswd.equals(tpasswd)) {
		sql = String.format("update users set user_password='%s' where user_id='%s';", newpasswd, id);
		service.executeUpdate2(sql);
		show = "�޸�����ɹ���";
	} else {
		show = "�޸�����ʧ�ܣ�ԭ�������";
	}
	%>
	<div class = "box">
	<br><br><br><br>
	<h1><%=show%></h1>
	<br><br><br>
	<a href="homepage.jsp">�����ת������ҳ</a>
	<br>
	<a href="resetPasswd.jsp">��������</a>
	</div>
	<%
	service.closeConn();
	%>
</body>

</html>