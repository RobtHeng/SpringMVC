<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
<script type="text/javaScript" src="scripts/jquery.min.js"></script>
<script type="text/javaScript">

		$(function(){
			$("a").click(function(){
				var url=this.href;
				var args={"time":new Date()};
				$("#content").load(url,args);
				
				return false;
			});
		});

	//window.onload=function(){
		////1.获取a节点，添加onclick事件
		//document.getElementsByTagName("a")[0].onclick=function(){
			//创建一个XMLHttpRequest对象
			//var request = new XMLHttpRequest();
	
			//准备发送请求的数据
			//var url=this.href + "?time="+ new Date();
			//var method="POST";

			//调用XMLHttpRequest 对象的open方法
			//request.open(method,url);
			
			//request.setRequestHeader("ContentType", "application/x-www-form-urlencodded");
			//调用send方法
			//request.send("name='atguigu'");
			
			//为XMLHttpRequest 对象添加 onreadystatechange 响应函数
			//request.onreadystatechange=function(){
				//alert(request.readyState);
				//判断响应是否完成：readyState 属性值为4
				//if(request.readyState==4){
					//if(request.status==200|| request.status==304){
						//alert(request.responseText);
					//}
				//}
			//}
			
			//取消a节点的默认行为
			//return false;
		//}
	//}
	
	
	
	
</script>
</head>
<body>

	<a href="helloAjax.txt">HelloAjax</a>
	<div id="content"></div>
</body>
</html>