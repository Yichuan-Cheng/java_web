<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="com.DataBase.MyDb"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>

<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width,initial-scale=1.0">
		<title>【管理员】论坛主页</title>
		<script src="lib/vue.js"></script>
		<script src="lib/elementui.js"></script>
		<link rel="stylesheet href="lib/elementui.css">
	</head>
	<body>
		<div id="showpage">
			<div class="plate-show">
				<div class="background" >
					<img src="images/T0.jpg" alt="">
					<h2 style="color:#2E8B57;">欢迎来到论坛管理界面</h2>
				</div>
			</div>
			<br>
			<div class="list">
			
<%!int pageSize = 4;
	int pageCount;
	int showPage;%>

<!-- 连接数据库并从数据库中调取记录-->
<%
MyDb service = new MyDb();
String sql = "select * from posts ORDER BY post_date DESC;";
service.getConn("social_web", "root", "123456");
ResultSet rs = service.executeQuery1(sql);
//将游标移到最后一行 
rs.last();
//获取最后一行的行号 
int recordCount = rs.getRow();
if (recordCount > 0) {

	//计算分页后的总数 
	pageCount = (recordCount % pageSize == 0) ? (recordCount / pageSize) : (recordCount / pageSize + 1);
	int least = recordCount - (4 * pageCount - 4);
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
	for (int i = 1; i <= topageSize; i++) {
%>
<table  style="margin: 10px 40px;border:2px solid #F0FFFF;width: 93%;background-color: #F0FFF0;">
	<tr>
		<th style="color: #008B00;text-align: left;">楼主：<%=rs.getString("user_nickname")%></th>
		<td style="text-align: right;">发表于：<%=rs.getString("post_date")%></td>
	</tr>
	<tr>
		<%
		String a = rs.getString("post_content");
		String img = rs.getString("post_img");
		String b = rs.getString("post_theme");
		if (a.length() > 5) {
			a = a.substring(0, 5);
		}
		a = a + "........";
		%>
		<td colspan="3" style="background-color: #F0FFFF;width:100%;">【<%=b%>】<%=a%></td>
	</tr>

</table>

<a href="delPost.jsp?img=<%=img%>" style="color: #008B00;font-size=16px; margin: 0px 40px; ">删除</a>

<a href="adminshowPost.jsp?img=<%=img%>" style="color: #008B00;font-size=16px; margin: 0px 40px;">查看</a>
<br>
<br>
<%
rs.next();
}
rs.close();
%>
<br>
<br>
<div class="words" style="text-align: center;">
	第<%=showPage%>页（共<%=pageCount%>页）
	<br>
	<a href="adminshowPage.jsp?showPage=1" style="color: #2E8B57">首页</a>
	<a href="adminshowPage.jsp?showPage=<%=showPage - 1%>" style="color: #2E8B57; :hover{color: #000000}">上一页</a>
	<%
	//根据pageCount的值显示每一页的数字并附加上相应的超链接
	for (int i = 1; i <= pageCount; i++) {
	%>
	<a href="adminshowPage.jsp?showPage=<%=i%>" style="color: #2E8B57;"><%=i%></a>
	<%
	}
	%>
	<a href="adminshowPage.jsp?showPage=<%=showPage + 1%>" style="color: #2E8B57;">下一页</a>

	<a href="adminshowPage.jsp?showPage=<%=pageCount%>" style="color: #2E8B57;">末页</a>
	

<!-- 通过表单提交用户想要显示的页数 -->
	<form action="" method="get">
		跳转到第<input type="text" name="showPage" size="4">页 <input
			type="submit" name="submit" value="跳转">
	</form>
	<%
	}
	service.closeConn();
	%>

	<a href="adminhomepage.jsp" style="color: #2E8B57;">返回主页</a> 
</div>
			</div>
		</div>
	
	</body>
	
		<style>
		*{
			margin: 0;
			padding: 0;
			box-sizing: border-box;
			font-family:"Microsoft Yahei";
		}

		.list{
			width:98%;
			margin: 20px auto;
			background-color: #FFFFFF;
		}
		.plate-show{
			width: 100%;
		}
		.plate-show .background{
			width: 100%;
			text-align: center;
		}
		.plate-show .background .h2{
			color: #00BFFF;
			margin: 10px 0px;
		}
		.list .table{
			border: 1px solid #FFC1C1;
			bg-color: #FFC1C1;
			margin: 40px 40px;
		}
	</style>
</html>
	