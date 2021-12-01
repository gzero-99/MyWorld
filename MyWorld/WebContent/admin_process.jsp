<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="com.oreilly.servlet.*"%>
<%@ page import ="com.oreilly.servlet.multipart.*"%>
<%@ page import ="java.util.*" %>
<%@ page import ="java.io.*" %>
<html>
<head>
<meta charset="utf-8">
<title> Sign in Security </title>
</head>
<body>
	<!-- 여기에서 admin 로그인을 시작해야한다 !  그래야 408 오류 안뜸 !-->
	<%

		//관리자 role이 맞으면, 상품(음악) 등록하기
		if(request.isUserInRole("mw_admin")){
			%>
			<!--  a href = "addMusic.jsp" > 음악 등록 </a-->
			<% 
			//response.sendRedirect("addMusic.jsp");
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter writer = response.getWriter(); 
			writer.println("<script>alert('mw_admin 관리자님을 환영합니다.'); location.href='addMusic.jsp';</script>"); 
			writer.close();
		}
		else{ //아니면, 그냥 시작하기... -> 말고 다시 로그인 시도 
			%>
			<!--  a href = "myWorld.jsp"> 시작하기 </a-->
			<%
			//사실상 이 부분은  써질 일이 없음 .
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter writer = response.getWriter(); 
			writer.println("<script>alert('관리자 로그인을 실패했습니다.'); location.href='admin_process.jsp';</script>"); 
			writer.close();
			//response.sendRedirect("admin_process.jsp");
		}
			
	%>
</body>
</html>
