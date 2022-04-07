<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>
<title>管理员登录失败！</title>
    <link rel="stylesheet" href="css/my.css">
</head>
<body>
<div class = "greenbox">

 
 <img class = "logoyes" src = "images/error.png">
	<h1>管理员账号或密码错误！</h1>
	<button class="button" id="jumptohome" onclick = btn()>重新登录</button>
</div>	
<script src="js/script.js"></script>
</body>

<script>
function btn()
{
	location.href = "adminLogin.jsp";
	}
</script>
</html>




<!--  <html>
<head>
<title>管理员登录失败！</title>
</head>
<body>
	管理员账号或密码错误！
	<a href="adminLogin.jsp">点击跳转重新登录</a>
</body>
</html>-->