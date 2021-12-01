<%@ page import="java.net.URLEncoder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" >
<link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MyWorld</title>
</head>
<body>

	 <div class="container">
	    <jsp:include page="main_header.jsp"/>
 		<jsp:include page="main_profile.jsp"/>
 	</div>
 	
 	<main role="main" class="container">
 		<jsp:include page="main_photo.jsp"/>
 			<jsp:include page="footer.jsp"/>
	</main>
	
</body>
</html>