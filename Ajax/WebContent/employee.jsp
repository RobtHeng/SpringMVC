<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
<script type="text/javaScript" src="scripts/jquery.min.js"></script>
<script type="text/javaScript" src="scripts/jquery.blockUI.js "></script>
<script type="text/javaScript">

	$(function(){
		$("document").ajaxStart(function(){
			debuggr
			$.blockUI({
			message:$('#loading'),
			css:{
				top:($(window).height()-400)/2+'px',
				left:($(window).width(-400))/2+'px',
				width:'400px',
				border:'none'
			}
		});
		}).ajaxStop($.unblockUI);
		
		$("#city").change(function(){
			var city=$(this).val();
			
			if(city != ""){
				var url ="employeeServlet?method=listDepartments";
				var args={"locationId":city,"time":new Date()};
				$("#department").empty();
				$("#department").html("<option value=''>请选择...</option>");
				$.getJSON(url,args,function(data){
					if(data.length == 0){
						alert("当前城市没有部门");
					}else{
						for(var i=0;i<data.length;i++){
							debugger;
							var deptId=data[i].departmentId;
							var deptName=data[i].departmentName;
							$("#department").append("<option value='"+deptId+"'>"+deptName+"</option>");
						}
					}
				});
			}
		});
		
		$("#department").change(function(){
			var department=$(this).val();
			
			if(department != ""){
				var url ="employeeServlet?method=listEmployees";
				var args={"departmentId":department,"time":new Date()};
				$("#employee").empty();
				$("#employee").html("<option value=''>请选择...</option>");
				$.getJSON(url,args,function(data){
					if(data.length == 0){
						alert("当前部门没有职工");
					}else{
						for(var i=0;i<data.length;i++){
							debugger;
							var empId=data[i].employeeId;
							var empName=data[i].lastName;
							$("#employee").append("<option value='"+empId+"'>"+empName+"</option>");
						}
					}
				});
			}
		});
		
		$("#employee").change(function(){
			var employee=$(this).val();
			
			if(department != ""){
				var url ="employeeServlet?method=getEmployee";
				var args={"employeeId":employee,"time":new Date()};
				$.getJSON(url,args,function(data){
					if(data.length == 0){
						alert("当前职工没有详细信息！");
					}else{
							debugger;
							$("#empdetails").css('display','block');
							var empId=data.employeeId;
							var empName=data.lastName;
							var email=data.email;
							var salary=data.salary;
							$("#id").empty();
							$("#name").empty();
							$("#email").empty();
							$("#salary").empty();
							$("#id").html(empId);
							$("#name").html(empName);
							$("#email").html(email);
							$("#salary").html(salary);
							
						}
				});
			}
		});
		
	})


</script>
</head>
<body>
	<img alt="" id="loading" src="images/loading.jpg" style="display:none" />
	<center>
		<br /><br />
		City:
		
		<select id="city">
			<option value="">请选择...</option>
			<c:forEach items="${locations }" var="location">
				<option value="${location.locationId }">${location.city}</option>
			</c:forEach>
		</select>
		
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		
		Department:
		<select id="department">
			<option value="">请选择...</option>
		</select>
		
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		
		Employee:
		<select id="employee">
			<option value="">请选择...</option>
		</select>
		
		<br /><br />
		<table id="empdetails" border="1" cellspacing="0" cellpadding="5" style="display:none">
			<tr>
				<th>Id</th>
				<th>Name</th>
				<th>Email</th>
				<th>Salary</th>
			</tr>
			<tr>
				<td id="id"></td>
				<td id="name"></td>
				<td id="email"></td>
				<td id="salary"></td>
			</tr>
		</table>
	</center>
</body>
</html>