

<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@page import="com.DataBase.MyDb"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<link href="css/new.css" rel="stylesheet" type="text/css" media="all">
<title>发布</title>
</head>
<body background=images/forest3.jpg>
<% response.setCharacterEncoding("GBK");%>
<div id="showpost">
	<div class="header">
		<a href="homepage.jsp" style="color:#FFFFFF;font-size=16px">返回个人主页</a>
	</div>

		<form name="articleform" class="form-horizontal" action="do_post.jsp" method="post" enctype="multipart/form-data">
		<div class="title">
			<h2 style="margin: 40px 0px 20px 20px;">主题</h2>
			<input type="text" name="theme" placeholder="请输入主题" style="border-radius: 7px;width: 60%;height: 50px;margin: 10px 0px 10px 10px;background-color: #FFF0F5;border: #FFF0F5;"></input>
		</div>
		
		<div>
			<h2 style="margin: 40px 0px 20px 20px;">内容</h2>
			<input type="text" name="content" placeholder="请输入内容" style="border-radius: 7px;width: 60%;height: 150px;margin: 10px 0px 10px 10px;background-color: #FFF0F5;border: #FFF0F5;"></input>	
		</div>
		<div style="text-align: left;">
			
    		<h3>上传图片<br>
    		<input type="file" name="image" style="border-radius: 7px;width: 20%;height: 25px;margin: 0px 80px 10px 10px;background-color: #F0FFFF;"></input></h3>
			<!--<input type="submit" value="发表" />  -->
			<button class = "buttonpink" type = "submit">发表</button>
			
		</div>
		</form>
</div>

<br>


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
			text-align:left;
	}

		
</style>

</html>
