<%@ page import="java.net.URLEncoder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" >
<link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String user_id = (String) session.getAttribute("userID");

	//form 에서 쿠키 getParameter로 가지고 간 데이터를 
	//쿠키 클래스 생성해서 변수에 저장해서
	Cookie id = new Cookie("Payment_id",user_id);
	Cookie name = new Cookie("Payment_name",
		URLEncoder.encode(request.getParameter("name"), "utf-8"));
	Cookie company = new Cookie("Payment_company",
			URLEncoder.encode(request.getParameter("company"), "utf-8"));
	Cookie card = new Cookie("Payment_card",
			URLEncoder.encode(request.getParameter("card"), "utf-8"));
	Cookie month = new Cookie("Payment_month",
			URLEncoder.encode(request.getParameter("month"), "utf-8"));
	Cookie year = new Cookie("Payment_year",
			URLEncoder.encode(request.getParameter("year"), "utf-8"));
	Cookie pw = new Cookie("Payment_pw",
			URLEncoder.encode(request.getParameter("pw"), "utf-8"));
	
	id.setMaxAge(24*60*60);
	name.setMaxAge(24*60*60);
	company.setMaxAge(24*60*60);
	card.setMaxAge(24*60*60);
	month.setMaxAge(24*60*60);
	year.setMaxAge(24*60*60);
	pw.setMaxAge(24*60*60);

	//7가지 정보 쿠키에 넣음 .
	response.addCookie(id);
	response.addCookie(name);
	response.addCookie(company);
	response.addCookie(card);
	response.addCookie(month);
	response.addCookie(year);
	response.addCookie(pw);

	response.sendRedirect("paymentInfo_print.jsp");
	
%>
</body>
</html>