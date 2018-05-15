<?xml version="1.0" encoding="gbk" ?>
<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<%@ page import="java.sql.*"%>


<%
int pageSize=3;
String strPageNo = request.getParameter("pageNo");
int pageNo;
if(strPageNo==null || strPageNo.equals("")){
	pageNo=1;	
}else{
	try{
		pageNo=Integer.parseInt(strPageNo.trim());
	}catch(NumberFormatException e){
		pageNo=1;
	}
	if(pageNo<=0){
		pageNo=1;
	}
}




Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/bbs","root","sasa");

Statement stCount=conn.createStatement();
ResultSet rsCount=stCount.executeQuery("select count(*) from article where pid=0");
rsCount.next();
int totalRecords= rsCount.getInt(1);
int totalPages=totalRecords % pageSize == 0 ? totalRecords/pageSize : (totalRecords/pageSize)+1;
if(totalPages<pageNo){
	pageNo=totalPages;
}
int startPos=(pageNo-1)*pageSize;
rsCount.close();
stCount.close();

Statement stmt =conn.createStatement();
ResultSet rs=stmt.executeQuery("select *from article where pid=0 limit "+startPos+" ,"+pageSize+"");

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title>Insert title here</title>
</head>
<body>
<a href="Post.jsp">发表新帖</a>
<br/>
共<%=totalRecords %>条数据 
<table border="1">
<%
while(rs.next()){
%>
  <tr>
  	<td>
  		<%=rs.getString("title") %>
  	</td>
  </tr>
<% 
}
rs.close();
stmt.close();
conn.close();
%>  
  
  
</table>
共<%=totalPages %>页 第<%=pageNo%>页
<a href="ShowArticleFlat.jsp?pageNo=<%=pageNo-1%>"> < </a> &nbsp;
<a href="ShowArticleFlat.jsp?pageNo=<%=pageNo+1%>"> > </a>
<form name="form1" action="ShowArticleFlat.jsp">
	<select name="pageNo" onchange="document.form1.submit()">
		<%
		for(int i=1;i<totalPages;i++){
		%>
		<option value=<%=i %> <%=(pageNo==i) ? "selected" : "" %>>第<%=i %>页
		<%
		}
		%>
	</select>
</form>

<form name="form2"action="ShowArticleFlat.jsp">
	<input type=text size=4 name="pageNo" value=<%=pageNo%> />
	<input type="submit" value="go"/>
	
</form>

</body>
</html>