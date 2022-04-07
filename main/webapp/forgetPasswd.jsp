<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	contentType="text/html; charset=utf-8"%>

<!DOCTYPE html>
<html>

<head>
<link rel="stylesheet" href="css/forget.css">
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<title>密码找回</title>

</head>

<body>
	<div class = "greenbox">
		<form action="forgetPasswd1.jsp" method="post" name="lform">
			<h1>
				要找回密码的账号：<br />
			</h1>
			<input type="text" name="id" placeholder="输入你的账号"></input>
			<br><br><br>
			
		</form>
		<button onclick="validate()">确认</button>
		<br><br><br>
			<a href=userLogin.jsp class="backtoreg">切换到登录页面</a>
	</div>
</body>
<script>
	function validate() {
		var user = document.lform.id.value;


		if (user == "") {
			alert("请输入账号");
			document.lform.id.focus();//光标定位在文本框acccountName中
			return;
		}
		else{
		document.lform.submit();
		}
	}
</script>

</html>