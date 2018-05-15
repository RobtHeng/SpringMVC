<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
</head>
<body>

	<a href="testView">test view</a>	
	<br/><br/>
	<a href="testRedirect">test Redirect</a>	
	<br/><br/>

	<form action="testModelAttribute" method="post">
		<input type="hidden" name="id" value="1"/>
		username:<input type="text" name="username" value="Tom"/>
		<br/>
		email:<input type="text" name="email" value="1234@qq.com"/>
		<br/>
		age:<input type="text" name="age" value="12"/>
		<br/>
		<input type="submit" value="submit"/>
	</form>

	<br/><br/>
	<form action="testPojo" method="post">
		username:<input type="text" name="username"/>
		<br/>
		password:<input type="text" name="password"/>
		<br/>
		email:<input type="text" name="email"/>
		<br/>
		age:<input type="text" name="age"/>
		<br/>
		city:<input type="text" name="address.city"/>
		<br/>
		province:<input type="text" name="address.province"/>
		<input type="submit" value="Submit"/>
	</form>
	<br/><br/>
	<a href="testServletAPI">test ServletAPI</a>	
	<br/><br/>
	<a href="testModelAndView">test ModelAndView</a>	
	<br/><br/>
	<a href="testSessionAttributtes">test SessionAttributtes</a>	
	<br/><br/>
	
	
	<a href="testCookieValue">test CookieValue</a>	
	<br/><br/>
	<a href="testRequestParam?username=zhangheng&age=20">test RequestParam</a>	
	<br/><br/>
	<form action="testRest/1" method="post">
		<input type="hidden" name="_method" value="put"/>
		<input type="submit" value="testRest put"/>
	</form>
	<br/><br/>
	<form action="testRest/1" method="post">
		<input type="hidden" name="_method" value="Delete"/>
		<input type="submit" value="testRest delete"/>
	</form>
	<br/><br/>
	<form action="testRest" method="post">
		<input type="submit" value="testRest post"/>
	</form>
	<br/><br/>
	<a href="testRest/1">test Rest Get</a>	
	<br/><br/>
	
	<form action="helloworld" method="post">
		<input type="submit" value="submit"/>
	</form>
	<br/><br/>
	<a href="testParams?age=10">test Params</a>	
	<br/><br/>
	<a href="testVariable/1">test Variable</a>	
	<br/><br/>
	<a href="pathVariable/cool">path Variable</a>	
</body>
</html>