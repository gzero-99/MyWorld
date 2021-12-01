<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="java.io.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<%@ include file="dbconn.jsp" %>
	<!-- 왜 이리로 안 넘어오지?  -->
	<%
	//현재 세션 정보 가져오기 .( sign in 한  유저. )
	String user_id = (String) session.getAttribute("userID");
	
	String m_id = request.getParameter("musicId");
	if(m_id == null || m_id.trim().equals("")){
		response.sendRedirect("shop.jsp");
		return;
	}

	Statement stmt = null;		
	try{
		//cart 디비에 받아온 음악 id 를 세션의 유저(장바구니 주인)와 함께 저장해준다. 
		String sql = "insert into cart(music_id, owner) values('"
				+ m_id + "','" + user_id + "')";
		stmt = conn.createStatement();
		stmt.executeUpdate(sql);

	}catch(SQLException ex){
		out.println("SQLException : "+ex.getMessage());

	}finally{
		if(stmt!=null)
			stmt.close();
		if(conn!=null)
			conn.close();
		response.setContentType("text/html; charset=UTF-8"); 
		PrintWriter writer = response.getWriter(); 
		writer.println("<script>alert('선택한 음악이 장바구니에 추가되었습니다.'); location.href='shop.jsp';</script>"); 
		writer.close();
	}

	%>
</body>
</html>