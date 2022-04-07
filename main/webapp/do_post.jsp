<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK" import="com.jspsmart.upload.*"%>
<%@page import="com.DataBase.MyDb"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<%
	response.setCharacterEncoding("GBK");

	SmartUpload su = new SmartUpload();
	//初始化SmartUpload ,必须有要，不然有异常
	su.initialize(this.getServletConfig(), request, response);
	su.setMaxFileSize(1 * 1024 * 1024);
	su.setTotalMaxFileSize(10 * 1024 * 1024);
	su.setAllowedFilesList("jpg,png,JPG,PNG,jpeg");
	su.upload();

	//获取其它参数
	//获取文件，如果文件为多个，循环遍历即可
	Files files = su.getFiles();
	String theme = su.getRequest().getParameter("theme");
	String content = su.getRequest().getParameter("content");
	String id = (String) session.getAttribute("userId");
	Date currentTime = new java.util.Date();//得到当前系统时间 
	SimpleDateFormat sim = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
	String strdate = sim.format(currentTime); //将日期时间格式化 
	String fileName = strdate + id + ".jpg";
	//String fileName=files.getFile(0).getFileName();
	//saveAs方法第二个参数用法可以自己详究一下
	files.getFile(0).saveAs("E:\\EclipseWorkspace\\social_web\\src\\main\\webapp\\data/" + fileName,
			File.SAVEAS_PHYSICAL);

	MyDb service = new MyDb();
	String sql = null;
	String sql1 = String.format("select * from users where user_id='%s'", id);
	service.getConn("social_web", "root", "123456");
	ResultSet rs = service.executeQuery1(sql1);
	rs.next();
	String nickname = rs.getString("user_nickname");
	sql = String.format("insert into posts values('%s','%s','%s','%s','%s',0,0,'%s')", fileName, strdate, id, theme,
			content, nickname);
	service.executeUpdate2(sql);
	service.closeConn();
	getServletContext().getRequestDispatcher("/putPostSuccess.jsp").forward(request, response);
	%>

</body>

</html>