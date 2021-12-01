<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" >
<link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>Login</title>
</head>
<body>
	<!-- jsp:include page="menu.jsp"/-->
	<div class = "jumbotron" style="background-color:#a1d7ff;">
		<div class="container">
			<jsp:include page="initial_header.jsp"/>
			<h1 class="display-3">Admin login</h1>
		</div>
	</div>
	<div class="container" align="center">
		<div class="col-md-5 col-md-offset-5">
			<h3 class="form-signin-heading">Admin login to add music list</h3>
			<%
				String error = request.getParameter("error");
				if(error!=null){
					out.println("<div class='alert alert-danger'>");
					out.println("아이디와 비밀번호를 확인해 주세요. ");
					out.println("</div>");
				}
			%>
			<form class="login-Form" action="j_security_check" method="post">	
				<div class="form-group">
					<label for="inputUserName" class="sr-only">User ID</label>
					<input type="text" class="form-control" placeholder="ID" name='j_username' required autofocus>
 				</div>
				<div class="form-group">
					<label for="inputPassword" class="sr-only">Password</label>
					<input type="password" class="form-control" placeholder="Password" name='j_password' required>
 				</div> 
 				<p> <input type="submit" style="background-color:blue; border-color:blue; color:white; border-radius: 12px;" class="btn btn-lg" type="submit" value="Login">			
				<input type="button" style="background-color:white; border-color:black; color:black; border-radius: 12px;" class="btn btn-lg" type="button" onclick="location.href='initial.jsp'" value="back">			
				</p>
			</form>		
		</div>
		<jsp:include page="footer.jsp"/>
	</div>
			
</body>
</html>