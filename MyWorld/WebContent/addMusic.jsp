<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" >

<title>음악 등록</title>
</head>
<!-- validaion.js파일에서 유효성 검사  -->
<script type="text/javascript" src="./resources/js/validation.js"></script>
<body>
	<fmt:setLocale value='<%=request.getParameter("language") %>'/>
	<fmt:bundle basename="bundle.message">
	
	<!--  jsp:include page="menu.jsp"/-->
	<div class="jumbotron" style="background-color:#a1d7ff;">
		<div class="container">
			<jsp:include page="initial_header.jsp"/>
			<h1 class ="display-3"><fmt:message key="title"/></h1>
		</div>
	</div>
	<div class="container">
		<div class="text-right">
			<a href="?language=ko"> Korean </a>|<a href="?language=en"> English </a>	
			&nbsp;&nbsp;
			<a href="logout.jsp" class="btn btn-sm btn-success pull-right">logout</a>
		</div>
		<form name="newMusic" action="./addMusic_process.jsp" class="form-horizontal" 
			method="post" enctype="multipart/form-data">
			<div class="form-group row"> 
				<label class="col-sm-2"><fmt:message key="musicId"/></label>
				<div class="col-sm-3">
					<input type="text" id="musicId" name="musicId" class="form-control">
					<!-- 유효성 검사 위해 id 속성 추가 -->
 				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="name"/></label>
				<div class="col-sm-3">
					<input type="text" id="name" name="name" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="singer"/></label>
				<div class="col-sm-3">
					<input type="text" name="singer" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="price"/></label>
				<div class="col-sm-3">
					<input type="text" id="price" name="price" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="description"/></label>
				<div class="col-sm-3">
					<textarea name="description" cols="60" rows="3" class="form-control"></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="releaseDate"/></label>
				<div class="col-sm-3">
					<input type="text" name="releaseDate" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="genre"/></label>
				<div class="col-sm-3">
					 <select name="genre">
						<option value="pop"><fmt:message key="genrePop"/></option>
						<option value="cinematic"><fmt:message key="genreCinema"/></option>
						<option value="acoustic"><fmt:message key="genreAcou"/></option>												
						<option value="electronica"><fmt:message key="genreElec"/></option>
						<option value="jazz"><fmt:message key="genreJazz"/></option>						
					</select>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="musicFile"/></label>
				<div class="col-sm-5">
					<input type="file" name="musicFile" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type= "submit" class="btn btn-primary" 
					value="<fmt:message key="button"/>" 
					onclick="CheckAddMusic()">
				</div>
			</div>
		</form>
	<jsp:include page="footer.jsp"/>	
 	</div>
 	</fmt:bundle>
</body>
</html>