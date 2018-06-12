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
		$(":input[name='username']").change(function(){
			var val=$(this).val();
			val=$.trim(val);
			
			if(val !=""){
				var url= "${pageContext.request.contextPath}/valiateUserName?id=Java&price=100";
				debugger
				var args={"userName":val,"time":new Date()};
				$.post(url,args,function(data){
					$("#message").html(data);
				});
			}
			
		});
	
	})
</script>
</head>
<body>

<form action="form" method="post">
	
	UserName:<input type="text" name="username"/>
	<div id="message"></div>
	<input type="submit" value="Submit"/>
	
</form>

</body>
</html>