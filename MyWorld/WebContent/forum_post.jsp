<%@ page import="java.net.URLEncoder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" >
<link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MyWorld Forum</title>
</head>
<!--  script type="text/javascript" src="./resources/js/validation.js"></script--->
<body>
	 <div class="container">
	    <jsp:include page="main_header.jsp"/>
 		<hr>
 	</div>
 	 <main role="main" class="container">
 	
 		<form name="newForum" class="form-horizontal" method="post" 
 			action="forumPost_process.jsp">
 			<div class="form-group row">
				<label class="col-sm-2">제목</label> 
				<div class="col-sm-3">
					<input id="title" type="text" name="title" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">날짜 및 시간 </label>
				<div class="col-sm-3">
					<input id="time" type="text" name="time" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">내용</label>
				<div class="col-sm-5">
					<textarea id="content" name="content" cols="100" rows="10" ></textarea>
				</div>
			</div>
 			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type= "submit" class="btn btn-primary" value="Post"> <!-- onclick="CheckAddForum()" -->
					<input type="button" style="border-color:black; "class="btn" onclick="location.href='forum_board.jsp'" value="취소">
				</div>
			</div>
 		</form>


	</main>
			<jsp:include page="footer.jsp"/>
</body>
</html>