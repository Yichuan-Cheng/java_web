<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK" import="com.jspsmart.upload.*"%>
<%@page import="com.DataBase.MyDb"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<title>重置密码</title>
<link rel="stylesheet" href="css/forget.css">
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
</head>
<body>
	<%
	String id = (String) session.getAttribute("userId");

	MyDb service = new MyDb();
	service.getConn("social_web", "root", "123456");
	String sql = String.format("select * from users where user_id='%s';", id);
	ResultSet rs = service.executeQuery1(sql);
	%>

	<form action="resetPasswd1.jsp" method="post" name="lform">
<div class = "box">
		<h3>
			原密码：<br />
		</h3>
		<input type="text" name="oldPasswd" placeholder="输入你的原密码"
			style="border-radius: 7px;"></input>

		<h3>
			新密码：<br />
		</h3>
		<input type="text" name="passwd" placeholder="输入新密码"
			style="border-radius: 7px;"></input>

		<h3>
			确认密码：<br />
		</h3>
		<input type="text" name="passwd1" placeholder="确认密码"
			style="border-radius: 7px;"></input>
			<br><br>
		<input type="button" onclick="validate()" value="修改">
		<br><br><br><br>
		<a href="adminshowPage.jsp">返回主页</a>
	<br>
	<a href=forgetPasswd.jsp>忘记密码？</a>
	</div>
	</form>
	<%
	service.closeConn();
	%>
</body>
<script>
	function validate() {
		var opsw = document.lform.oldPasswd.value;
		var psw1 = document.lform.passwd.value;
		var psw2 = document.lform.passwd1.value;
		if (opsw == "") {
			alert("请输入原始密码");
			document.lform.oldPasswd.focus();//光标定位在文本框acccountName中
			return;
		} else if (psw1 == "") {
			alert("请输入新密码");
			document.lform.passwd.focus();//光标定位在文本框acccountName中
			return;
		} else if (psw2 != psw1) {
			alert("密码不一致，请重新输入");
			document.lform.passwd1.focus();//光标定位在文本框acccountName中
			return;
		}
		document.lform.submit();
	}
</script>
</html>