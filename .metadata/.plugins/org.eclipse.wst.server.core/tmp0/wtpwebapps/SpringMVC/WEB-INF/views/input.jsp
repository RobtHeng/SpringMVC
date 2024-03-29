<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
</head>
<body>
		
		<form action="${pageContext.request.contextPath}/testConversionServiceConverer" method="post">
			Employee:<input type="text" name="employee"/>
			<input type="submit" value="add"/>
		</form>
		<br/><br/>

	<form:form action="${pageContext.request.contextPath}/empForm" method="post" modelAttribute="employee">
		<c:if test="${employee.id==null}">
			LastName  :<form:input path="lastName" cssStyle="width:100px"/>
			<br/><br />
		</c:if>
		<c:if test="${employee.id!=null }">
			<form:hidden path="id" />
			<input type="hidden" name="_method" value="PUT"/>
		</c:if>
		
		Email     :<form:input path="email" cssStyle="width:100px"/>
		<br/><br />
		<%
			Map<String,String> genders=new HashMap();
			genders.put("1","Male");
			genders.put("0","Female");
			request.setAttribute("genders", genders);
		%>
		Gender    :<form:radiobuttons path="gender" items="${genders}" />
		<br/><br />
		Department:<form:select path="department.id"
			items="${departments}" itemLabel="departmentName" itemValue="id" cssStyle="width:100px"></form:select>
		<br/><br />
		
		<input type="submit" value="submit"/>
		
	</form:form>
</body>
</html>