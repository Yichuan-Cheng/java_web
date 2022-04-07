<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>
<title>登录成功</title>
    <link rel="stylesheet" href="css/my.css">
</head>
<body>
<div class = "greenbox">

 
 <img class = "logoyes" src = "images/yes.png">
	<h1>登录成功</h1>
	<button class="button" id="jumptohome" onclick = btn()>去主页看看</button>
</div>	
<script src="js/script.js"></script>
</body>

<script>
function btn()
{
	location.href = "homepage.jsp";
	}
</script>
</html>

