<%@ page import="java.net.URLEncoder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" >
<link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sign Up</title>
</head>
<body>
	<div class = "jumbotron" style="background-color:#a1d7ff; ">
		<div class="container">
			<jsp:include page="initial_header.jsp"/>
			<h1 class="display-5">Welcome to MyWorld</h1>
		</div>
	</div>
	<div class="container" align="center">
		<div class="col-md-6 col-md-offset-6">
			<h3 class ="form-signup-heading">Sign up to start your own world</h3>
			<form class="form-signup" method="post" action="signup_process.jsp" enctype="multipart/form-data">
				<p> 아이디 <input type="text" name="id">
				<p> 비밀번호  <input type="password" name="passwd">
				<p> 이 름 <input type="text" name="name">
				<p> 프로필 이미지  <input type="file" name="filename">
				<p> <textarea name="intro" cols="40" rows="5" placeholder="자기소개를 입력해주세요."></textarea>
				<p> <button type="submit" value="가입"style="background-color:#a1d7ff; border-color:black; 
 					color:white; border-radius: 12px;" class="btn btn-lg" >가입</button> 
 					<button type="reset" value="취소" style="background-color:#ffc3de; border-color:black; 
 					color:white; border-radius: 12px;" class="btn btn-lg">취소</button>
			</form>
		<!-- 나중에 아이디 중복 불가 관리 알림 추가하기.  -->
		<!-- 	//삽입 전에 이미 id가 존재하는지 check  -->
		</div>
		<jsp:include page="footer.jsp"/>
	</div>
</body>
</html>