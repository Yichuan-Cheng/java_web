<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>管理员登录成功</title>
<link rel="stylesheet" href="css/admin.css">
<script src="js/prefixfree.min.js"></script>
</head>
<body>
<div class = "success">
	<div class = pinkbox>
	<h3>欢迎，管理员</h3>
	<h2><br>愿您今天也工作愉快☼</h2>
	<br>
	<button onclick = btn()>点击跳转管理</button>
	<br>
	</div>
	</div>
</body>

<script>
function btn()
{
	location.href = "adminhomepage.jsp";
	}
</script>
</html>