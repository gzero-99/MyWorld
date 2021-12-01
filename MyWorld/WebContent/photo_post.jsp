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
 		
 		<form name="newPhoto" class="form-horizontal" method="post" 
 			action="photoPost_process.jsp" enctype="multipart/form-data">
 			<div class="form-group row">
				<label class="col-sm-2">제목</label> 
				<div class="col-sm-3">
					<input type="text" name="title" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">사진 </label>
				<div class="col-sm-5">
					<input type="file" name="photoFile" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">날짜 및 시간 </label>
				<div class="col-sm-3">
					<input type="text" name="time" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">사진 설명</label>
				<div class="col-sm-5">
					<textarea name="comment" cols="70" rows="5"></textarea>
				</div>
			</div>
 			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type= "submit" class="btn btn-primary" value="Post"> 
					<input type="button" style="border-color:black; "class="btn" onclick="location.href='photo_board.jsp'" value="취소">
				</div>
			</div>
 		</form>

	
	</main>
				<jsp:include page="footer.jsp"/>
	
</body>
</html>