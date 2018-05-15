<?xml version="1.0" encoding="gbk" ?>
<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<%@ page import="java.sql.*" %>

<%
	request.setCharacterEncoding("gbk");
	int id = Integer.parseInt(request.getParameter("id"));
	int rootId=Integer.parseInt(request.getParameter("rootid"));
	String title=request.getParameter("title");
	if(title==null){
		out.println("error! please use my bbs in the right way!");
		return;
	}
	title=title.trim();
	if(title.equals("")){
		out.println("title could not be empty!");
		return;
	}
	String cont=request.getParameter("cont");
	if(cont==null){
		out.println("error! please use my bbs in the right way!");
		return;
	}
	cont=cont.trim();
	if(cont.equals("")){
		out.println("content could not be empty!");
		return;
	}
	cont=cont.replaceAll("\n", "<br>");
	
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/bbs","root","sasa");

	conn.setAutoCommit(false);
	String sql="insert into article values(null,?,?,?,?,now(),0)";
	PreparedStatement stmt =conn.prepareStatement(sql);
	Statement st=conn.createStatement();
	stmt.setInt(1, id);
	stmt.setInt(2, rootId);
	stmt.setString(3, title);
	stmt.setString(4, cont);
	stmt.executeUpdate();
	
	st.executeUpdate(" update article set isleaf=1 where id="+id);
	conn.commit();
	conn.setAutoCommit(true);
	
	stmt.close();
	conn.close();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title>Insert title here</title>
</head>
<body>
<font color="red" size="7">
	OK!
</font>
</body>
</html>