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
    <title>Feature of MyWorld</title>

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

<fmt:setLocale value='<%=request.getParameter("language") %>'/>
<fmt:bundle basename="bundle.message">
	
    <div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
  	<header class="masthead mb-auto">
    	<div class="inner">
    	  <h3 class="masthead-brand">MyWorld</h3>
    	  	<nav class="nav nav-masthead justify-content-center">
    		    <a class="nav-link" href="initial.jsp"><fmt:message key="home"/></a>
        		<a class="nav-link active" href="#"><fmt:message key="features"/></a>
        		<a class="nav-link" href="initial_contacts.jsp"><fmt:message key="contact"/></a>
      		</nav>
    	</div>
  	</header>

  <main role="main" class="inner cover">
    <h1 class="cover-heading"><fmt:message key="start"/></h1>
    </main>
	<div style="display:flex;">
		<div style="margin:0 auto;">
		<table >
		<tr>
			<th><fmt:message key="edit"/></th>
			<th><fmt:message key="home"/></th>
			<th><fmt:message key="forum"/></th>
		</tr>		
		<tr>
			<td><img src="./uploadFile/edit.png" width="200"></td>
			<td><img src="./uploadFile/home.png" width="200"></td>
			<td><img src="./uploadFile/forum.png" width="200"></td>

		</tr>
		</table>

		<table>
		<tr>
			<th><fmt:message key="photo"/></th>
			<th><fmt:message key="shop"/></th>
		</tr>
		<tr>
			<td><img src="./uploadFile/photo.png" width="200"></td>
			<td><img src="./uploadFile/shop.png" width="200"></td>
		</tr>
		</table>
		</div>
	</div>
 

  	<footer class="mastfoot mt-auto">
   	 <div class="inner">
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