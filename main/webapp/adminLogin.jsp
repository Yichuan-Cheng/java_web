<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	contentType="text/html; charset=utf-8"%>
<%@page import="com.DataBase.MyDb"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>

<head>
  <link rel="stylesheet" href="css/admin.css">
<script src="js/prefixfree.min.js"></script>
<title>管理员登录</title>
</head>

<body>
<div class = "success">
	<div class = "pinkbox">
		<form action="LoginReg?action_flag=adminLogin" method="post"
			name="lform">
			<br>
			<h2>欢迎，管理员</h2>
			<h1>
				输入管理员账号<br />
			</h1>
			<input type="text" name="id" placeholder="输入你的账号" onblur="if(/[^0-9a-zA-Z]/g.test(value))alert('只能输入数字与英文')"
				style="border-radius: 7px;"></input>
				<h1>密码:</h1>
			<input type="text" name="passwd" placeholder="输入密码" onblur="if(/[^0-9a-zA-Z]/g.test(value))alert('只能输入数字与英文')"
				style="border-radius: 7px;"></input>

			
		</form>
					<p>
				<button onclick="validate()" value="登录">登录</button>
			</p>
		<a href = "userLogin.jsp">切换到用户登录</a><br>
		<a href = "index.jsp">回到主页</a>
	</div>
	</div>
</body>

<script>
	function validate() {
		var user = document.lform.id.value;

		var psw1 = document.lform.passwd.value;

		if (user == "") {
			alert("请输入账号");
			document.lform.id.focus();//光标定位在文本框acccountName中
			return;
		}

		else if (psw1 == "") {
			alert("请输入密码");
			document.lform.psw1.focus();//光标定位在文本框acccountName中
			return;
		}

		document.lform.submit();
	}
</script>

</html>