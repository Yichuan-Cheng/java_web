<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK" import="com.jspsmart.upload.*"%>
<%@page import="com.DataBase.MyDb"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<title>��������</title>
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
			ԭ���룺<br />
		</h3>
		<input type="text" name="oldPasswd" placeholder="�������ԭ����"
			style="border-radius: 7px;"></input>

		<h3>
			�����룺<br />
		</h3>
		<input type="text" name="passwd" placeholder="����������"
			style="border-radius: 7px;"></input>

		<h3>
			ȷ�����룺<br />
		</h3>
		<input type="text" name="passwd1" placeholder="ȷ������"
			style="border-radius: 7px;"></input>
			<br><br>
		<input type="button" onclick="validate()" value="�޸�">
		<br><br><br><br>
		<a href="adminshowPage.jsp">������ҳ</a>
	<br>
	<a href=forgetPasswd.jsp>�������룿</a>
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
			alert("������ԭʼ����");
			document.lform.oldPasswd.focus();//��궨λ���ı���acccountName��
			return;
		} else if (psw1 == "") {
			alert("������������");
			document.lform.passwd.focus();//��궨λ���ı���acccountName��
			return;
		} else if (psw2 != psw1) {
			alert("���벻һ�£�����������");
			document.lform.passwd1.focus();//��궨λ���ı���acccountName��
			return;
		}
		document.lform.submit();
	}
</script>
</html>