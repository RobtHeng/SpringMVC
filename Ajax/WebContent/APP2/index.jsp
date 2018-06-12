<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
<script type="text/javaScript" src="${pageContext.request.contextPath}/scripts/jquery.min.js"></script>
<script type="text/javaScript">

	$(function(){
		$("a").click(function(){
			debugger
			var url=this.href;
			var args={"time":new Date()};
			$.ajax({
				url:url,
				dataType:'json',
				success: function(data){
					debugger
					$("#bookName").html(data.bookName);
					$("#totalBookNumber").html(data.totalBookNumber);
					$("#totalMoney").html(data.totalMoney);
				},
				error:function(error){ 
					 alert(1111)
				} 
			});
			 
			 return false;
		});
	})

</script>
</head>
<body>
	您已经将&nbsp;<span id="bookName"></span> &nbsp;加入到购物车中，
	购物车中的书有&nbsp;<span id="totalBookNumber"></span> &nbsp; 本。
	总价格&nbsp;<span id="totalMoney"></span> &nbsp;元
	<br /><br/>
	Java &nbsp;&nbsp;<a href="${pageContext.request.contextPath}/valiateUserName?id=Java&price=100">加入购物车</a>
	<br /><br/>
	
	Oracle &nbsp;&nbsp;<a href="${pageContext.request.contextPath}/valiateUserName?id=Oracle&price=200">加入购物车</a>
	<br /><br/>
	
	Struts2 &nbsp;&nbsp;<a href="${pageContext.request.contextPath}/valiateUserName?id=Struts2&price=300">加入购物车</a>
	<br /><br/>

</body>
</html>