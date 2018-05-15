<?xml version="1.0" encoding="gbk" ?>
<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<%@ page import="java.sql.*" %>

<%!
private void delete(Connection conn,int id){
	Statement stmt=null;
	ResultSet rs=null;

	try{
		stmt = conn.createStatement();
		String sql="select *from article where pid="+id;
		rs=stmt.executeQuery(sql);
		while (rs.next()){
				int gid=rs.getInt("id");
				//String sqldelete="delete from article where id="+gid;
				//stmt.executeUpdate(sqldelete);
				delete(conn,gid);
		}
		String sqldelete="delete from article where id="+id;
		stmt.executeUpdate(sqldelete);
	}catch(SQLException e){
		e.printStackTrace();
		
	}finally{
		try{
			if(rs!=null){
				rs.close();
				rs=null;
			}
			if(stmt!=null){
				stmt.close();
				stmt=null;
			}
		}
		catch(SQLException e){
			e.printStackTrace();
		}
	}
}
%>
 <% 
 String admin=(String)session.getAttribute("admin");
 if(admin == null || !admin.equals("true")){
	 out.println("别想直接删除！");
	 return;
 }
 %>

<%
	int id = Integer.parseInt(request.getParameter("id"));
	int pid = Integer.parseInt(request.getParameter("pid"));

	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/bbs","root","sasa");
	
	conn.setAutoCommit(false);
	delete(conn,id);
	Statement stmtt =conn.createStatement();
	ResultSet ss=stmtt.executeQuery("select count(*) from article where id="+pid);
	ss.next();
	int count=ss.getInt(1);
	ss.close();
	stmtt.close();
	if(count<=0){
		Statement sst=conn.createStatement();
		sst.executeUpdate("update article set isleaf=0 where id="+pid);
		sst.close();
	}
	conn.commit();
	conn.setAutoCommit(true);
	conn.close();
	response.sendRedirect("ShowArticleTree.jsp");
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