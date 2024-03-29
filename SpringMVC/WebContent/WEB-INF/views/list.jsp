<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
<script type="text/javascript" src="scripts/jquery.min.js"></script>

<script type="text/javascript">
	$(function(){
		$(".delete").click(function(){
			var href=$(this).attr("href");
			$("form").attr("action",href).submit();
			return false;
		});
	})
</script>

</head>
<body>

	<form action="" method="post">
		<input type="hidden" name="_method" value="delete"/>
	</form>
<c:if test="${empty requestScope.employees }">
		没有任何员工信息
	</c:if>
	<c:if test="${!empty requestScope.employees }">
		<table border="1" cellpadding="10" cellspacing="0">
			<tr>
				<th>ID</th>
				<th>LastName</th>
				<th>Email</th>
				<th>Gender</th>
				<th>Department</th>
				<th>Edit</th>
				<th>Delete</th>
			</tr>
			<c:forEach items="${requestScope.employees }" var="emp">
				<tr>
					<td>${emp.id}</td>
					<td>${emp.lastName}</td>
					<td>${emp.email}</td>
					<td>${emp.gender==0?'Female':'Male'}</td>
					<td>${emp.department.departmentName}</td>
					<td><a href="emp/${emp.id }">Edit</a></td>
					<td><a class="delete" href="emp/${emp.id }">delete</a></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	<br/><br/>
	
	<a href="emp">Add New Employees</a>
		
</body>
</html>