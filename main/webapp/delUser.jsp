<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK" import="com.jspsmart.upload.*"%>
<%@page import="com.DataBase.MyDb" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
 
<!DOCTYPE html>
<html>
<head>
<title>������Ա���û�ɾ���ɹ�</title>
<link href="css/post.css" rel="stylesheet" type="text/css" media="all">
</head>
<body>
	<% 
	String id =request.getParameter("id");
    MyDb service = new MyDb();
	service.getConn("social_web", "root", "123456");
    String sql=String.format("delete from posts where post_id='%s';",id);
    service.executeUpdate2(sql);
    sql=String.format("delete from users where user_id='%s';",id);
    service.executeUpdate2(sql);
    sql=String.format("delete from replys where user_id='%s';",id);
    service.executeUpdate2(sql);
    service.closeConn();
%>
<br><br><br>
<h3>ɾ���ɹ���</h3>
<a href="usermanage.jsp">������ҳ</a>
</body>

</html>