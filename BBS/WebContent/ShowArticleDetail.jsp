<?xml version="1.0" encoding="gbk" ?>
<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
 <%@ page import= "java.sql.*"%>
 

 <%
 	String strId=request.getParameter("id");
 	int id = Integer.parseInt(strId);
 	
 	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/bbs","root","sasa");

	Statement stmt =conn.createStatement();
	ResultSet rs=stmt.executeQuery("select *from article where id="+id+"");
	
 %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title>Insert title here</title>
</head>
<body>
<%
if(rs.next()){
%>
	<table border="1">
		<tr>
			<td>ID</td>
			<td><%=rs.getInt("id") %></td>
		</tr>
		
		<tr>
			<td>Title</td>
			<td><%=rs.getString("title") %></td>
		</tr>
		
		<tr>
			<td>Content</td>
			<td><%=rs.getString("cont") %></td>
		</tr>
	</table>
	
	<a href="Reply.jsp?id=<%=rs.getInt("id")%>&rootid=<%=rs.getInt("rootid")%>">回复</a>
<%
} 
rs.close();
stmt.close();
conn.close();
%>
</body>
</html>