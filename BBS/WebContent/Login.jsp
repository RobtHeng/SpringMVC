<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<%
String action =request.getParameter("action");
String username=request.getParameter("uname");
String password=request.getParameter("password");

%>
<!DOCTYPE html>
<html lang="en" >

<head>
  <meta charset="gbk">
  <title>CSS Login form</title>
  
  
  
      <link rel="stylesheet" href="images/style.css">

  
</head>

<body>
  <div id="boxForm">
  <h2 id="title">Login</h2>
  <form action="Login.jsp" method="post">
  	<input type="hidden" name="action" value="post"/>
    <input class='text' id='un' name='uname' placeholder='Uname' required>
    <br>
    <input class='text' id='pwd'  name='password' placeholder='Password' required>
    <br>
    <input id='rememberMe' name='rememberMe' type='checkbox'> <label>Remember me</label>
    <br>
    <input class='button' type='submit' value='Connection'>
  </form>
</div>
  
  

    <script  src="images/style.css"></script>
<%
if(action!=null && action.equals("post")){
	if(username==null || !username.equals("admin")){
		%>
 		<font color="white" size=5>username not correct!"</font>
		<%
	}
	else if(password==null || !password.equals("admin")){
		%>
		<font color="white" size=5>password not correct!"</font>
		<%
		}else{
			session.setAttribute("admin", "true");
			response.sendRedirect("ShowArticleTree.jsp");
	}
}
%>


</body>

</html>
