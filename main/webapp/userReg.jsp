<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	contentType="text/html; charset=utf-8"%>

<!DOCTYPE html>
<html>

<head>

<title>Login</title>
</head>

<body>
	<div align="center">
		<br /> <br /> <br />
		<form action="LoginReg?action_flag=userReg" method="post" name="lform">

			<h3>
				账号<br />
			</h3>
			<input type="text" name="id" placeholder="输入你的账号" onblur="if(/[^0-9a-zA-Z]/g.test(value))alert('只能输入数字与英文')"
				style="border-radius: 7px;"></input>

			<h3>
				密码：<br />
			</h3>
			<input type="text" name="passwd" placeholder="输入密码" onblur="if(/[^0-9a-zA-Z]/g.test(value))alert('只能输入数字与英文')"
				style="border-radius: 7px;"></input>

			<h3>
				确认密码：<br />
			</h3>
			<input type="text" name="passwd1" placeholder="确认密码" onblur="if(/[^0-9a-zA-Z]/g.test(value))alert('只能输入数字与英文')"
				style="border-radius: 7px;"></input>
			<h3>
				昵称：<br />
			</h3>
			<input type="text" name="nickname" placeholder="输入昵称"
				style="border-radius: 7px;"></input>
			<h3>
				邮箱：<br />
			</h3>
			<input type="text" name="email" placeholder="输入邮箱"
				style="border-radius: 7px;"></input>
			<h3>
				设置密保问题：<br />
			</h3>
			<input type="text" name="ques" placeholder="输入问题"
				style="border-radius: 7px;"></input>
			<h3>
				设置答案：<br />
			</h3>
			<input type="text" name="ans" placeholder="输入答案"
				style="border-radius: 7px;"></input>

		</form>
					<p>
				<input type="button" onclick="validate()" value="注册">
			</p>
		<br> <a href=userLogin.jsp class="backtoreg">切换到登录页面</a> <br />
		<a href=index.jsp>返回主页</a> <br /> <br /> <br /> <br />
	</div>
</body>
<script>
	function validate() {
		var user = document.lform.id.value;
		var nickname = document.lform.nickname.value;
		var psw1 = document.lform.passwd.value;
		var psw2 = document.lform.passwd1.value;
		var ques = document.lform.ques.value;
		var ans = document.lform.ans.value;
		if (user == "") {
			alert("请输入账号");
			document.lform.id.focus();//光标定位在文本框acccountName中
			return;
		} else if (nickname == "") {
			alert("请输入昵称");
			document.lform.id.focus();//光标定位在文本框acccountName中
			return;
		} else if (psw1 == "") {
			alert("请输入密码");
			document.lform.psw1.focus();//光标定位在文本框acccountName中
			return;
		} else if (psw2 != psw1) {
			alert("密码不一致，请重新输入");
			document.lform.psw1.focus();//光标定位在文本框acccountName中
			return;
		} else if (ques == "") {
			alert("请输入密保问题");
			document.lform.ques.focus();//光标定位在文本框acccountName中
			return;
		} else if (ans == "") {
			alert("请输入密保答案");
			document.lform.ans.focus();//光标定位在文本框acccountName中
			return;
		}
		var x=document.lform.email.value;
		  var atpos=x.indexOf("@");
		  var dotpos=x.lastIndexOf(".");
		  if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length){
		    alert("不是一个有效的 e-mail 地址");
		    return;}
		document.lform.submit();
	}
</script>

</html>