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
	//��ʼ��SmartUpload ,������Ҫ����Ȼ���쳣
	su.initialize(this.getServletConfig(), request, response);
	su.setMaxFileSize(1 * 1024 * 1024);
	su.setTotalMaxFileSize(10 * 1024 * 1024);
	su.setAllowedFilesList("jpg,png,JPG,PNG,jpeg");
	su.upload();

	//��ȡ��������
	//��ȡ�ļ�������ļ�Ϊ�����ѭ����������
	Files files = su.getFiles();
	String theme = su.getRequest().getParameter("theme");
	String content = su.getRequest().getParameter("content");
	String id = (String) session.getAttribute("userId");
	Date currentTime = new java.util.Date();//�õ���ǰϵͳʱ�� 
	SimpleDateFormat sim = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
	String strdate = sim.format(currentTime); //������ʱ���ʽ�� 
	String fileName = strdate + id + ".jpg";
	//String fileName=files.getFile(0).getFileName();
	//saveAs�����ڶ��������÷������Լ��꾿һ��
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