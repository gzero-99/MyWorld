<%@ page import="java.net.URLEncoder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v3.8.5">
    <title>Start MyWorld</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.3/examples/cover/">

    <!-- Bootstrap core CSS -->
	<link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="./resources/css/bootstrap.min.css" >

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
         
        }
      }
    </style>
    <!-- Custom styles for this template -->
    <link href="./cover.css" rel="stylesheet">
  </head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body class="text-center">
<%
//세션이 연결되어 있으면 세션 연결을 끊는다 .(세션 삭제)
if(request.isRequestedSessionIdValid()==true){
	session.invalidate();
}

%>
<fmt:setLocale value='<%=request.getParameter("language") %>'/>
<fmt:bundle basename="bundle.message">
	
    <div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
  	<header class="masthead mb-auto">
    	<div class="inner">
    	  <h3 class="masthead-brand">MyWorld</h3>
    	  	<nav class="nav nav-masthead justify-content-center">
    		    <a class="nav-link active" href="initial.jsp"><fmt:message key="home"/></a>
        		<a class="nav-link" href="initial_features.jsp"><fmt:message key="features"/></a>
        		<a class="nav-link" href="initial_contacts.jsp"><fmt:message key="contact"/></a>
      		</nav>
    	</div>
  	</header>

  <main role="main" class="inner cover">
    <h1 class="cover-heading"><fmt:message key="start"/></h1>
    <p class="lead" style=" font-weight: bold;"><fmt:message key="comment"/></p> 
   	<p class="lead"> <!-- 일반 사용자는 세션 만드는 로그인으로 실시  -->
   		 	<a href="./signin.jsp" class="btn btn-lg btn-secondary"><fmt:message key="signin"/></a>
   		  	<a href="./signup.jsp" class="btn btn-lg btn-secondary"><fmt:message key="signup"/></a>
   	</p>
  </main>

  	<footer class="mastfoot mt-auto">
   	 <div class="inner">
   	 	<!-- 관리자 로그인은 login.jsp 의 role쓰는 거로 로그인시키기 . -->
   	   <p> <a href="./admin_process.jsp" class="btn btn-secondary"><fmt:message key="adminOnly"/></a> </p>
   	  	<div class="text-right">
			<a href="?language=ko"> Korean </a>|<a href="?language=en"> English </a>	
		</div>
   	 </div>
  	</footer>

	<!-- footer 추가하기. -->
	<jsp:include page="footer.jsp"/>
	
	</div>
</fmt:bundle>

</body>
</html>