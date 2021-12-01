<%@ page import="java.net.URLEncoder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" >
<link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MyWorld Payment Info</title>
</head>
<body>
	 <div class="container">
	    <jsp:include page="main_header.jsp"/>
 		<hr>
 	</div>
 	<main role="main" class="container">
	 	<div style="text-align:center;"class="container">
 			<h2>결제 정보 입력</h2>
 		</div>
 		<div class="container">
 			<form action="./paymentInfo_process.jsp" class="form-horizontal"method="post">
 				<div class="form-group row">
					<label class="col-sm-2">성명</label>
					<div class="col-sm-3">
						<input name="name" type="text"class="form-control">
					</div>
				</div>
 				<div class="form-group row">
					<label class="col-sm-2">카드 회사</label>
					<div class="col-sm-3">
						<input name="company" type="text"class="form-control">
					</div>
				</div>				
 				<div class="form-group row">
					<label class="col-sm-2">카드 번호</label>
					<div class="col-sm-3">
						<input name="card" type="text"class="form-control">
					</div>
				</div>		
 				<div class="form-group row">
					<label class="col-sm-2">유효기간</label>
					<div class="col-sm-3">
						<select name ="month">
							<option value="1월">1월</option>
							<option value="2월">2월</option>
							<option value="3월">3월</option>
							<option value="4월">4월</option>
							<option value="5월">5월</option>
							<option value="6월">6월</option>
							<option value="7월">7월</option>
							<option value="8월">8월</option>
							<option value="9월">9월</option>
							<option value="10월">10월</option>
							<option value="11월">11월</option>
							<option value="12월">12월</option>							
						</select>
						<select name ="year">
							<option value="2021년">2021년</option>
							<option value="2022년">2022년</option>
							<option value="2023년">2023년</option>
							<option value="2024년">2024년</option>
							<option value="2025년">2025년</option>
							<option value="2026년">2026년</option>
							<option value="2027년">2027년</option>
							<option value="2028년">2028년</option>
							<option value="2029년">2029년</option>
							<option value="2030년">2030년</option>
							<option value="2031년">2031년</option>
						</select>
					</div>
				</div>
				 <div class="form-group row">
					<label class="col-sm-2">비밀번호 (앞 2자리)</label>
					<div class="col-sm-3">
						<input name="pw" type="password"class="form-control">
					</div>
				</div>	
				<div class="form-group row">
					<div class="col-sm-offset-2 col-sm-10">
						<a href="./shop_cart.jsp"
							class="btn btn-secondary" role="button">이전</a>
						<input type="submit" class="btn btn-primary" value="등록"> 
					</div>
				</div>							
 			</form>
 		</div>
 	</main>
 	<jsp:include page="footer.jsp"/>
</body>
</html>