<?xml version="1.0" encoding="gbk" ?>
<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<%@ page import="java.sql.*" %> 
 <%
	request.setCharacterEncoding("gbk");
 	String action =request.getParameter("action");
 	if(action!=null && action.equals("post")){
 		String title=request.getParameter("title");
 		String cont=request.getParameter("cont");
 		cont=cont.replaceAll("\n", "<br>");
 		Class.forName("com.mysql.jdbc.Driver");
 		Connection conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/bbs","root","sasa");

 		conn.setAutoCommit(false);
 		String sql="insert into article values(null,0,?,?,?,now(),0)";
 		PreparedStatement stmt =conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
 		Statement sst=conn.createStatement();
 		
 		stmt.setInt(1, -1);
 		stmt.setString(2, title);
 		stmt.setString(3, cont);
 		stmt.executeUpdate();
 		
 		ResultSet rt=stmt.getGeneratedKeys();
 		rt.next();
 		int rootid=rt.getInt(1);
 		
 		sst.executeUpdate("update article set rootid="+rootid+" where id="+rootid);
 		
 		conn.commit();
 		conn.setAutoCommit(true);
 		
 		sst.close();
 		rt.close();
 		stmt.close();
 		conn.close();
 		response.sendRedirect("ShowArticleFlat.jsp");
 	}
%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title>Insert title here</title>
</head>
<body>
<form action="Post.jsp" method="post">
	<input type="hidden" name="action" value="post"/>
	<table border="1">
		<tr>
			<td>
				<input type="text" name="title" size="80"/>
			</td>
		</tr>
		<tr>
			<td>
				<textarea rows="12" cols="80" name="cont"></textarea>
			</td>
		</tr>
		<tr>
			<td>
				<input type="submit" value="提交"/>
			</td>
		</tr>
	</table>
</form>
</body>
</html>