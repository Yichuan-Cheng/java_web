<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="com.DataBase.MyDb"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/managerhome.css">
<script src="js/prefixfree.min.js"></script>

<title>管理员之家</title>
</head>
<body>
<div class = pinkbox>
<h3>想做些什么？</h3>
<table align = "center">
<tr><td><button onclick = "btn1()">看帖子</button></td><td>&nbsp&nbsp&nbsp&nbsp</td>
	<td><button onclick = "btn2()">管理用户</button></td></tr>
</table>
	
</div>
</body>
<script>
function btn1()
{
	location.href = "adminshowPage.jsp";
	}
function btn2()
{
	location.href = "usermanage.jsp";
	}
</script>

</html>