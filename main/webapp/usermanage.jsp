<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="com.DataBase.MyDb"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*"%>

<%!int pageSize = 4;
	int pageCount;
	int showPage;%>

<html>
<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width,initial-scale=1.0">
		<title>【管理员】用户管理界面</title>
		<script src="lib/vue.js"></script>
		<script src="lib/elementui.js"></script>
		<link rel="stylesheet href="lib/elementui.css">
</head>
<body background=images/bg1.jpg ;width= 100%;>
<div class="usermanage">
	<div class="header">
		<div class="not-login" style="text-align: center;">
			<span style="color: #F0FFF0;">用户管理界面</span>
		</div>
	</div>

<table  border="1" cellpadding="2" cellspacing="0" style="margin: 10px 40px;border:2px solid #8FBC8F;width: 93%;background-color: #8FBC8F; text-align: center;">
	<tr>
		<td>用户ID</td>
		<td>用户密码</td>
		<td>用户昵称</td>
		<td>用户邮箱</td>
		<td>用户密保问题</td>
		<td>用户密保答案</td>
		<td>用户管理</td>
	</tr>
	<%
MyDb service = new MyDb();
String sql = "select * from users ORDER BY user_id DESC;";
service.getConn("social_web", "root", "123456");
ResultSet rs = service.executeQuery1(sql);
//将游标移到最后一行 
rs.last();
//获取最后一行的行号 
int recordCount = rs.getRow();
if (recordCount > 0) {

	//计算分页后的总数 
	pageCount = (recordCount % pageSize == 0) ? (recordCount / pageSize) : (recordCount / pageSize + 1);
	int least = recordCount-(4*pageCount-4);
	//获取用户想要显示的页数：
	String integer = request.getParameter("showPage");
	if (integer == null) {
		integer = "1";
	}
	try {
		showPage = Integer.parseInt(integer);
	} catch (NumberFormatException e) {
		showPage = 1;
	}
	if (showPage <= 1) {
		showPage = 1;
	}
	if (showPage >= pageCount) {
		showPage = pageCount;
	}
	int topageSize = pageSize;
	if (showPage == pageCount) {
		topageSize = least;
	}
	//如果要显示第showPage页，那么游标应该移动到的position的值是：
	int position = (showPage - 1) * pageSize + 1;
	//设置游标的位置
	rs.absolute(position);
	//用for循环显示本页中应显示的的记录
	for (int i = 1; i <= topageSize; i++) {
%>

	<tr>
		<td><%=rs.getString("user_id")%></td>
		<td><%=rs.getString("user_password")%></td>
		<td><%=rs.getString("user_nickname")%></td>
		<td><%=rs.getString("user_email")%></td>
		<td><%=rs.getString("user_question")%></td>
		<td><%=rs.getString("user_answer")%></td>
		<td><a href="delUser.jsp?id=<%=rs.getString("user_id")%>" style="color: #F0FFF0;">注销</a></td>
	</tr>



<%
rs.next();
}
%>
</table>
</body>
</html>	



<br>

<div class="words" style="text-align: center;">
	<div style="color: #F0FFF0">第<%=showPage%>页（共<%=pageCount%>页）</div>
	
	<br>
	<a href="usermanage.jsp?showPage=1" style="color: #FFFFFF">首页</a>
	<a href="usermanage.jsp?showPage=<%=showPage - 1%>" style="color: #FFFFFF;">上一页</a>
	<%
	//根据pageCount的值显示每一页的数字并附加上相应的超链接
	for (int i = 1; i <= pageCount; i++) {
	%>
	<a href="usermanage.jsp?showPage=<%=i%>" style="color: #FFFFFF;"><%=i%></a>
	<%
	}
	%>
	<a href="usermanage.jsp?showPage=<%=showPage + 1%>" style="color: #FFFFFF;">下一页</a>

	<a href="usermanage.jsp?showPage=<%=pageCount%>" style="color: #FFFFFF;">末页</a>
	
	<!-- 通过表单提交用户想要显示的页数 -->
	<form action="" method="get" style="color: #F0FFF0">
		跳转到第<input type="text" name="showPage" size="4" style="color: #F0FFF0">页 <input
			type="submit" name="submit" value="跳转">
	</form>
	<%
	}
	service.closeConn();
	%>
	<a href="adminhomepage.jsp" style="color: #F0FFF0;">返回</a> 
</div>
<style>
		*{
			margin: 0;
			padding: 0;
			box-sizing: border-box;
			font-family:"Microsoft Yahei";
		}
		.list .table{
			border: 1px solid #FFC1C1;
			bg-color: #FFC1C1;
			margin: 40px 40px;
		}
		.header{
			width: 100%;
			height: 36px;
			line-height: 36px;
			background-color: #006400;
			text-align: right;
		}

</style>
</div>