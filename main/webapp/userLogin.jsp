<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>

	<!DOCTYPE html>
	<html>

<head>

	<title>Login&Register</title>
    <meta charset="UTF-8">
    <title>欢迎来到拾柒，注册/登录</title>
    <link rel="stylesheet" href="css/mylogin.css">
<script src="js/prefixfree.min.js"></script>
</head>
<body>
<div class="container">
  <div class="welcome">
    <div class="pinkbox">
      <!-- 注册 -->
      <div class="signup nodisplay">
        <h1>Register</h1>
        <form action="LoginReg?action_flag=userReg" method="post" name="lform">
          <input type="text" name = "id" placeholder="输入您的账号" onblur="if(/[^0-9a-zA-Z]/g.test(value))alert('只能输入数字与英文')">
          <input type="password" name = "passwd" placeholder="设置一个密码" onblur="if(/[^0-9a-zA-Z]/g.test(value))alert('只能输入数字与英文')">
          <input type="password" name = "passwd1" placeholder="确认密码" onblur="if(/[^0-9a-zA-Z]/g.test(value))alert('只能输入数字与英文')">
          <input type="text" name = "nickname" placeholder="输入昵称">
          <input type="text" name = "email" placeholder="输入邮箱">
          <input type="text" name = "ques" placeholder="设置密保问题">
          <input type="text" name = "ans" placeholder="设置答案">
         
        </form>
         <button class="button submit" onclick="validate()">注册</button>
      </div>

      <!-- 登录 -->
      <div class="signin">
        <h1>登录</h1>
        <form class="more-padding" autocomplete="off" action="LoginReg?action_flag=userLogin" method = "post" name = "rform">
          <input type="text" name = "id" placeholder="用户名" onblur="if(/[^0-9a-zA-Z]/g.test(value))alert('只能输入数字与英文')">
          <input type="password" name = "passwd" placeholder="密码" onblur="if(/[^0-9a-zA-Z]/g.test(value))alert('只能输入数字与英文')">
          <div class="checkbox">
            <input type="checkbox" id="remember" /><label for="remember">记住我</label>
          </div>
          
          <button class="buttom sumbit" onclick="validate2()">登录</button>
				<a class = "hyper" href = forgetPasswd.jsp>忘记密码？</a>
           </form>
          
        
      </div>
    </div>

    <div class="leftbox">
      <h2 class="title"><span>拾柒</span><br>拾起时光中的美好</h2>
      <p class="desc">莫愁前路无知己 <span>天下谁人不识君</span></p>
      <img class="flower smaller" src="images/y1.png" />
      <p class="account">已有账号?</p>
      <button class="button" id="signin">点击登录</button>
    </div>

    <div class="rightbox">
      <h2 class="title"><span>拾柒</span>&<br>17</h2>
      <p class="desc">相遇<span>不负每一份美好</span></p>
      <img class="flower" src="images/f2.png" />
      <p class="account">还没有账号？</p>
      <button class="button" id="signup">立即注册</button>
    </div>
  </div>
</div>   

<!-- partial -->
  <script src="js/jquery.min.js"></script><script src="js/script.js"></script>
</body>

<script>
function validate(){
var user=document.lform.id.value;
var nickname=document.lform.nickname.value;
var psw1=document.lform.passwd.value;
var psw2=document.lform.passwd1.value;
var ques=document.lform.ques.value;
var ans=document.lform.ans.value;
if(user==""){
alert("请输入账号");
document.lform.id.focus();//光标定位在文本框acccountName中
return;
}
else if(nickname==""){
	alert("请输入昵称");
	document.lform.id.focus();//光标定位在文本框acccountName中
	return;
	}
else if(psw1==""){
	alert("请输入密码");
	document.lform.psw1.focus();//光标定位在文本框acccountName中
	return;
	}
else if(psw2 != psw1){
alert("密码不一致，请重新输入");
document.lform.psw1.focus();//光标定位在文本框acccountName中
return;
}
else if(ques==""){
	alert("请输入密保问题");
	document.lform.ques.focus();//光标定位在文本框acccountName中
	return;
	}
else if(ans==""){
	alert("请输入密保答案");
	document.lform.ans.focus();//光标定位在文本框acccountName中
	return;
	}
document.lform.submit();
}

function validate2(){
	var user=document.rform.id.value;
	var psw=document.rform.passwd.value;
	
	if(user==""){
		alert("请输入账号");
		document.rform.id.focus();//光标定位在文本框acccountName中
		return;
	}
	else if(psw == ""){
		alert("请输入密码");
		document.rform.psw.fucus();
		return;
	}
	document.rform.submit();
}
</script>

</html>
	
		<!-- 
		<div align="center" class = >
			<br />
			<br />
			<br />
			<form action="LoginReg?action_flag=userLogin" method="post" >
				<h3>账号<br /></h3><input type="text" name="id" placeholder="输入你的账号" style="border-radius: 7px;"></input>

				<h3>密码：<br /></h3><input type="text" name="passwd" placeholder="输入密码"
					style="border-radius: 7px;"></input>
				<p><input type="submit" value="登录"> </p>
			</form><br>
						<a href=forgetPasswd.jsp class="backtoreg">忘记密码？</a>
			<a href=userReg.jsp class="backtoreg">切换到注册页面</a>
			<br />
			<br />
			<br />
			<br />
			<br />
		</div>
	</body>

	</html> -->