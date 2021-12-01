<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="com.oreilly.servlet.*"%>
<%@ page import ="com.oreilly.servlet.multipart.*"%>
<%@ page import ="java.util.*" %>
<%@ page import ="java.io.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<%@ include file="dbconn.jsp" %>
	<%
		request.setCharacterEncoding("utf-8");

		String user_id = (String) session.getAttribute("userID");
		String title = request.getParameter("title");
		String time = request.getParameter("time");
		String contents = request.getParameter("content");
 		Statement stmt = null;
			
		//forum 테이블 삽입 .
		try{
			String sql = "INSERT INTO forum (f_title, f_contents, f_postingTime, f_writer) VALUES('" 
				+ title + "','" + contents + "','" + time + "','" + user_id + "')";
				
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
			
			//out.println("forum 테이블 삽입이 성공했습니다. ");
		}catch (SQLException ex){
			out.println("forum 테이블 삽입이 실패했습니다. <br>");
			out.println("SQLException: "+ex.getMessage());
		}finally{
			if(stmt !=null)
				stmt.close();
			if(conn!=null)
				conn.close();
		}
		response.setContentType("text/html; charset=UTF-8"); 
		PrintWriter writer = response.getWriter(); 
		writer.println("<script>alert('성공적으로 글을 업로드하였습니다.'); location.href='forum_board.jsp';</script>"); 
		writer.close();
	%>