<%@ page import="java.net.URLEncoder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" >
<link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sign in</title>
</head>
<body>
	<div class = "jumbotron" style="background-color:#a1d7ff;" >
		<div class="container">
			<jsp:include page="initial_header.jsp"/>
			<h1 class="display-3">Welcome back to MyWorld</h1>
		</div>
	</div>
	<div class="container" align="center">
		<div class="col-md-5 col-md-offset-5">
			<h3 class="form-signin-heading">Sign in to your own world</h3>
			<form action="signin_process.jsp"	method="POST">
				<p> 아이디  <input type="text" name="id">
				<p> 비밀번호  <input type="password" name="passwd">
				<p> <input type="submit"style="background-color:#a1d7ff; border-color:black; 
 					color:white; border-radius: 12px;" class="btn btn-lg" value="로그인">
			</form>
		</div>
		<jsp:include page="footer.jsp"/>
	</div>
				
	
</body>
</html>