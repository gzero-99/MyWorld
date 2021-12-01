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

		//상대경로 -> 절대경로로바꾼 후 사진 파일 업로드 
		String uploadPath = request.getSession().getServletContext().getRealPath("/uploadFile");
		MultipartRequest multi = new MultipartRequest(request, uploadPath
				, 5*1024*1024, "utf-8", new DefaultFileRenamePolicy());	
		
		String title = multi.getParameter("title");
		String time = multi.getParameter("time");
		String comment = multi.getParameter("comment");

		Enumeration files = multi.getFileNames();
		String name = (String) files.nextElement();
		String filename = multi.getFilesystemName(name);
		
		Statement stmt = null;
		//photo table 삽입 .
		try{
			String sql = "INSERT INTO photo (p_title, p_photo, p_postingTime, p_uploader, p_comment) VALUES('" 
					+ title + "','" + filename + "','" + time + "','" + user_id + "','" + comment + "')";
					
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
		}catch(SQLException ex){
			out.println("SQLException: "+ex.getMessage());
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter writer = response.getWriter(); 
			writer.println("<script>alert('디비저장실패'); location.href='photo_board.jsp';</script>"); 
			writer.close();

		}finally{
			if(stmt !=null)
				stmt.close();
			if(conn!=null)
				conn.close();
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter writer = response.getWriter(); 
			writer.println("<script>alert('성공적으로 사진을 업로드하였습니다.'); location.href='photo_board.jsp';</script>"); 
			writer.close();
		}

	%>
</body>
</html>