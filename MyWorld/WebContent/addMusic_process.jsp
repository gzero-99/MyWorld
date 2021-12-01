<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="com.oreilly.servlet.*"%>
<%@ page import ="com.oreilly.servlet.multipart.*"%>
<%@ page import ="java.util.*" %>
<%@ page import ="java.io.*" %>
<html>
<head>
<meta charset="UTF-8">
<title>add Music process SQL</title>
</head>
<body>
	<%@ include file="dbconn.jsp" %>
	<%
		request.setCharacterEncoding("utf-8");
		
		//상대경로 -> 절대경로로바꾼 후 파일 업로드 
 		String uploadPath = request.getSession().getServletContext().getRealPath("/music");
 		//out.println("절대경로 : " + uploadPath +"<br/>");


		MultipartRequest multi = new MultipartRequest(request, uploadPath
		, 10*1024*1024, "utf-8", new DefaultFileRenamePolicy());		
		
		String id = multi.getParameter("musicId");
		String name = multi.getParameter("name");
		String singer = multi.getParameter("singer");
		String price = multi.getParameter("price");
		String description = multi.getParameter("description");
		String releasDate = multi.getParameter("releaseDate");
		String genre = multi.getParameter("genre");
		
		Enumeration files = multi.getFileNames();
		String n = (String) files.nextElement();
		
		String filename = multi.getFilesystemName(n); //저장파일이름 -중복시 1,2,3붙음 
		String musicFile = filename;
			
		Statement stmt = null;
			
		//테이블 삽입 .
		try{
			String sql = "INSERT INTO music_shop(m_id, m_name, m_filename, m_price, m_singer, m_description, m_releaseDate, m_genre) VALUES('" 
				+ id + "','" + name + "','" + musicFile + "','" + price + "','" + singer + "','" + description + "','" + releasDate + "','" + genre + "')";
				
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
			//out.println("Music_shop 테이블 삽입이 성공했습니다. ");
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter writer = response.getWriter(); 
			writer.println("<script>alert('음악 등록에 성공했습니다.'); location.href='addMusic.jsp';</script>"); 
			writer.close();
		}catch (SQLException ex){
			//out.println("Music_shop 테이블 삽입이 실패했습니다. <br>");
			//out.println("SQLException: "+ex.getMessage());
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter writer = response.getWriter(); 
			writer.println("<script>alert('음악 등록을 실패했습니다.다시 시도하십시오.'); location.href='addMusic.jsp';</script>"); 
			writer.close();
		}finally{
			if(stmt !=null)
				stmt.close();
			if(conn!=null)
				conn.close();
		}

	
	//src 에  ./music/파일명.mp3하면 됨 .
	%>
	<!--  audio autoplay controls> <source src="./music/bensound-littleidea.mp3" type="audio/mp3"> </audio-->

	<!-- iframe src="./music/bensound-littleidea.mp3" allow="autoplay" id="audio"></iframe-->

</body>
</html>