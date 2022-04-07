<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="com.DataBase.MyDb"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<link href="css/new.css" rel="stylesheet" type="text/css" media="all">
<title>【管理员】管理发帖</title>
</head>
<body>
<div id="showpost">
	<div class="header">
		<a href="adminshowPage.jsp" style="color:#FFFFFF;font-size=16px">返回</a>
	</div>
		<%
	String img = request.getParameter("img");
	session.setAttribute("img", img);
	MyDb service = new MyDb();
	String sql = String.format("select * from posts where post_img='%s'", img);
	service.getConn("social_web", "root", "123456");
	ResultSet rs = service.executeQuery1(sql);
		rs.next();
		String a = rs.getString("post_content");
		int zan = rs.getInt("post_zan");
		int cai = rs.getInt("post_cai");
		String img_path="http://localhost:8080/social_web2/data/"+img;
		%>
		<div class="title">
			<h2 style="margin: 40px 0px 20px 20px;">主题</h2>
			<div style="background-color: #F0FFF0;margin: 10px 20px;width:95%;">
				<%=rs.getString("post_theme")%>
			</div>
		</div>
	<h2 style="margin: 40px 0px 20px 20px;">内容</h2>	
	<div class="picture">
		<div class="navi"></div>
		<div class="background">
			<img alt="" src="<%=img_path %>" style="width: 95%; margin: 10px 30px 20px 25px;">
			<img >
		</div>
		<div>
			<span style="width: 95%; margin: 10px 30px 20px 25px;"><%=a%></span>
		</div>
		<br>
		<br>
	</div>
	<div class="cai&zan" style="margin: 10px 10px;text-align: center;">		
		<a href="zan.jsp?img=<%=img%>" style="margin: 10px 10px 0px 0px;"><img src="images/zan.png" alt=""></a>
		<a href="cai.jsp?img=<%=img%>"><img src="images/cai.png" alt=""></a>
		<div>
			<span style="margin: 0px 0px 75px 35px;"><%=zan%></span>
			<span style="margin: 0px 0px 80px 80px;"><%=cai%></span>
		</div>
	</div>
	<br>
	<br>	
	<form action="reply.jsp?img=<%=img%>">
	 <h3 style="color: #00BFFF;margin: 10px 0px 0px 10px;">发表回复<br /></h3><input type="text" name="content" placeholder="请输入内容" style="border-radius: 7px;width: 97%;height: 50px;margin: 0px 0px 10px 10px;background-color: #F0FFFF;box-shadow: inset 0px 1px 1px #FFF0F5;"></input>
	 <br>
	 <button class = "buttongreen" type = "submit">回复</button>
	<!--<input type="submit" value="回复" / style="margin:10px;">  --> 
	</form>
<div class="replylist">
<span style="margin: 40px;">回复列表：</span>
	

<%!int pageSize = 4;
	int pageCount;
	int showPage;%>

<!-- 连接数据库并从数据库中调取记录-->
<%
sql = String.format("select * from replys where post_img='%s' ORDER BY reply_date ASC;",img);
rs = service.executeQuery1(sql);
//将游标移到最后一行 
rs.last();
//获取最后一行的行号 
int recordCount = rs.getRow();
if (recordCount > 0) {

//计算分页后的总数 
pageCount = (recordCount % pageSize == 0) ? (recordCount / pageSize) : (recordCount / pageSize + 1);
int least = recordCount -(pageSize*(pageCount-1));
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



<table  style="margin: 10px 40px;border:2px solid #F0FFFF;width: 93%;background-color:#F0FFF0;">
	<tr>
		<th style="color: #00BFFF;text-align: left;"><%=rs.getString("user_nickname")%></th>
		<td style="text-align: right;">回复于：<%=rs.getString("reply_date")%></td>
		<td style="text-align: right;">第<%=position+i-1 %>楼</td>
	</tr>
	<tr>
		<%
		String a1 = rs.getString("reply_content");
		%>
		<td colspan="3" style="background-color: #F0FFFF;width:100%;"><%=a1%></td>
	</tr>

</table>

<a href="delReply2.jsp?id=<%=rs.getString("reply_id")%>" style="color: #00BFFF;font-size=16px; display: block;text-align: right; ">删除</a>

</div>


<%
rs.next();
}
rs.close();
%>
<br>

<div class="reply-words" style="text-align: center;">
	第<%=showPage%>页（共<%=pageCount%>页）
	<br>
	<a href="adminshowPost.jsp?showPage=1&img=<%=img%>" style="color: #2E8B57;">首页</a>
	<a href="adminshowPost.jsp?showPage=<%=showPage - 1%>&img=<%=img%>" style="color: #2E8B57;">上一页</a>
	<%
	//根据pageCount的值显示每一页的数字并附加上相应的超链接
	for (int i = 1; i <= pageCount; i++) {
	%>
	<a href="adminshowPost.jsp?showPage=<%=i%>&img=<%=img%>" style="color: #2E8B57;"><%=i%></a>
	<%
	}
	%>
	<a href="adminshowPost.jsp?showPage=<%=showPage + 1%>&img=<%=img%>" style="color: #2E8B57;">下一页</a>

	<a href="adminshowPost.jsp?showPage=<%=pageCount%>&img=<%=img%>" style="color: #2E8B57;">末页</a>

	<!-- 通过表单提交用户想要显示的页数 -->
	<form action="" method="get">
		跳转到第<input type="text" name="showPage" size="4">页 <input
			type="submit" name="submit" value="跳转">
	</form>

	<%
	}service.closeConn();%>
     <div><a href="adminshowPage.jsp" style="color: #2E8B57;">返回</a></div>
	
</div>
</div>
</body>
<style>
	*{
		font-family:"Microsoft Yahei";
	}
	.header{
			width: 100%;
			height: 36px;
			line-height: 36px;
			background-color: #2E8B57;
			text-align: right;
	}
	.picture{
			width: 50%;
			margin: 20px auto;
			border: 2px solid  #2E8B57;
	}

	.picture .navi{
			height: 36px;
	}
		
</style>

</html>
