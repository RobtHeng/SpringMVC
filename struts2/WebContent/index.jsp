<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Date" %> 
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Insert title here</title>
</head>
<body>
	
	<a href="product-input.action">Product input</a>
	<br /><br />
	
	<a href="TestActionContext.action?name=atguigu" >Test ActionContext</a>
	<br /><br />
	
	<a href="TestAwareAction.action?name=atguigu" >Test AwareAction</a>
	<br /><br />
	
	<a href="TestServletActionContext.action?name=atguigu" >Test ServletActionContext</a>
	<br /><br />
	
	<a href="TestServletAwareAction.action?name=atguigu" >Test ServletAwareAction</a>
	<br /><br />
	
	<a href="login-ui.do" >Login UI</a>
	<br /><br />
	
	<s:url value="/getProduct" var="url">
		<s:param name="productId" value="'productId'"></s:param>
	</s:url>
	${url}
	<br /><br />
		
	<s:url action="testAction" namespace="/helloWorld" method="save" var="url1">
	</s:url>
	${url1}
	<br /><br />
	
	<s:url value="testUrl" var="url2" includeParams="get" ></s:url>
	<br /><br />
	${url2}
	
	
	<%
		if(application.getAttribute("date")==null)
			application.setAttribute("date", new Date());
	%>
	
</body>
</html>