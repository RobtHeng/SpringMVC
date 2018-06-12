<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
</head>
<body>

	<h4>Test AwareAction Page</h4>
	
	application : ${applicationScope.applicationKey2}
	<br /><br />
	
	session : ${sessionScope.sessionKey}
	<br /><br />
	
	request : ${requestScope.requestKey}
	<br /><br />

	<%
		if(application.getAttribute("date")==null)
			application.setAttribute("date", new Date());
	%>

</body>
</html>