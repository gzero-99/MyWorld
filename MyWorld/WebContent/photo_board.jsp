<%@ page import="java.net.URLEncoder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" >
<link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>MyWorld Photo</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	 <div class="container">
	    <jsp:include page="main_header.jsp"/>
 		<hr>
 	</div>
 	
 	<main role="main" class="container">
 			
		<!-- 사진 업로드 버튼  -->
		<div class="row flex-nowrap justify-content-between align-items-center">
			<div class="col-2 d-flex justify-content-end align-items-center">
				<a class="btn btn-sm btn-outline-secondary" href="./photo_post.jsp">사진 업로드하기</a>
			</div>
		</div>
		<br>
		<!-- 사진 게시글 출력 -->
		<div class="container">
			<jsp:include page="main_photo.jsp"/>
		</div>
	
	</main>
			<jsp:include page="footer.jsp"/>
	
</body>
</html>