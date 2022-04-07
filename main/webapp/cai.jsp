<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="com.DataBase.MyDb"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*"%>
<%
String img = request.getParameter("img");
MyDb service = new MyDb();
String sql = String.format("select * from posts where post_img='%s'", img);
service.getConn("social_web", "root", "123456");
ResultSet rs = service.executeQuery1(sql);
rs.next();
int cai = rs.getInt("post_cai");
cai += 1;
sql = String.format("update posts set post_cai=%d where post_img='%s';", cai, img);
service.executeUpdate2(sql);
service.closeConn();
response.sendRedirect(String.format("showPost.jsp?img=%s",img));
%>
