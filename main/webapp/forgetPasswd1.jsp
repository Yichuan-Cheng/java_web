<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="com.jspsmart.upload.*"%>
<%@page import="com.DataBase.MyDb"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>

<head>

<title>密码找回</title>

<link rel="stylesheet" href="css/forget.css">
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
</head>

<body>
	<%
	String id = request.getParameter("id");
	session.setAttribute("userId", id);
	MyDb service = new MyDb();
	String sql = String.format("select * from users where user_id='%s'", id);
	service.getConn("social_web", "root", "123456");
	ResultSet rs = service.executeQuery1(sql);
	rs.next();
	int recordCount = rs.getRow();
	if(recordCount>0){
	String ques = rs.getString("user_question");
	%>
	<div class = "box">
		<form action="forgetPasswd2.jsp" method="post" name="lform">
		<br>
		<img src = "images/question.png" width = 30px height = 30px>
			<h3>密保问题：
			<%=ques%></h3>
			<h2>
				输入答案：<br />
			</h2>
			<input type="text" name="ans" placeholder="输入答案"
				style="border-radius: 7px;"></input> 
				<h2>输入新密码：</h2>
				<input type="text" name="passwd" placeholder="输入新密码"
					style="border-radius: 7px;"></input>
			<h2>
			确认密码：
			</h2>
				<input type="text" name="passwd1" placeholder="确认新密码"
					style="border-radius: 7px;"></input>
					<br><br>
			
		</form>
		<button onclick="validate()">提交</button>
		<br> <a href=userLogin.jsp class="backtoreg">切换到登录页面</a> <br />
		<br /> <br /> <br /> <br />
	</div>
	<%
	service.closeConn();
	%>
	
	
</body>
<script>
	function validate() {

		var ans = document.lform.ans.value;
		var passwd = document.lform.passwd.value;
		var passwd1 = document.lform.passwd1.value;
		if (ans == "") {
			alert("请输入密保答案");
			document.lform.ans.focus();//光标定位在文本框acccountName中
			return;
		}
		if (passwd == "") {
			alert("请输入新密码");
			document.lform.passwd.focus();//光标定位在文本框acccountName中
			return;
		}
		if (passwd != passwd1) {
			alert("密码不一致！");
			document.lform.passwd.focus();//光标定位在文本框acccountName中
			return;
		}
		else {
		document.lform.submit();
		}
	}
</script>
<%}
	else{%>
	<br><br><br><br><br>
	<img src="images/none.png" width = 50px height = 50px>
	<h1>查无此账号</h1>
	<a class = "hyper" href = forgetPasswd.jsp>返回</a>
	<%} %>
</html>