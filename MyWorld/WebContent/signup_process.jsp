<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="com.oreilly.servlet.*"%>
<%@ page import ="com.oreilly.servlet.multipart.*"%>
<%@ page import ="java.util.*" %>
<%@ page import ="java.io.*" %>
<html>
<head>
<meta charset="utf-8">
<title>Database SQL</title>
</head>
<body>
	<%@ include file="dbconn.jsp" %>
	<%
		request.setCharacterEncoding("utf-8");
		
		//상대경로 -> 절대경로로바꾼 후 파일 업로드 
 		String uploadPath = request.getSession().getServletContext().getRealPath("/uploadFile");
 		//out.println("절대경로 : " + uploadPath +"<br/>");


		MultipartRequest multi = new MultipartRequest(request, uploadPath
		, 5*1024*1024, "utf-8", new DefaultFileRenamePolicy());		
		
		String id = multi.getParameter("id");
		String passwd = multi.getParameter("passwd");
		String name = multi.getParameter("name");
		
		Enumeration files = multi.getFileNames();
		String n = (String) files.nextElement();
		
		String filename = multi.getFilesystemName(n); //저장파일이름 -중복시 1,2,3붙음 
		String profile = filename;
			
		//String profile = request.getParameter("filename");
		String intro = multi.getParameter("intro");
			
		Statement stmt = null;
			
		//테이블 삽입 .
		try{
		
			String sql = "INSERT INTO member(id, passwd, name, profile, intro) VALUES('" 
				+ id + "','" + passwd + "','" + name + "','" + profile + "','" + intro + "')";
				
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
			out.println("Member 테이블 삽입이 성공했습니다. ");
		}catch (SQLException ex){
			out.println("Member 테이블 삽입이 실패했습니다. <br>");
			out.println("SQLException: "+ex.getMessage());
		}finally{
			if(stmt !=null)
				stmt.close();
			if(conn!=null)
				conn.close();
		}


	%>
		<!--  img data-src="holder.js/200x200" class="img-thumbnail" alt="200x200" src="./uploadFile/IMG_7741.jpeg" 
						data-holder-rendered="true" style="width: 200px; height:200px;"-->
	response.setContentType("text/html; charset=UTF-8"); 
	PrintWriter writer = response.getWriter(); 
	writer.println("<script>alert('가입에 성공했습니다. 로그인 하십시오.'); location.href='signin.jsp';</script>"); 
	writer.close();
</body>
</html>
