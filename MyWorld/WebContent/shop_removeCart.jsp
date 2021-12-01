<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="java.io.*" %>
<%@ page import="java.net.URLEncoder" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>	<!-- cart에서 해당 음악은 지우기 .. -->
	<%@ include file="dbconn.jsp" %>
	
<%		
	//현재 세션 정보 가져오기 .( sign in 한  유저. )
	String user_id = (String) session.getAttribute("userID");
	//parameter로 받아온 music id.
	String m_id = request.getParameter("musicId");
	
	//유저에 해당하고, musicID에 해당하는 거 cart에서 record 지우기.
	Statement stmt = null;
	try{
		String sql="delete from cart where owner='"
				+ user_id +"' and music_id = '" + m_id +"'";
		stmt = conn.createStatement();
		stmt.executeUpdate(sql);
	}catch(SQLException ex){
		out.println("SQLException: "+ex.getMessage());
	}finally{
		if(stmt !=null)
			stmt.close();
		if(conn!=null)
			conn.close();
	}
	response.setContentType("text/html; charset=UTF-8"); 
	PrintWriter writer = response.getWriter(); 
	writer.println("<script>alert('장바구니에서 음악을 삭제했습니다.'); location.href='shop_cart.jsp';</script>"); 
	writer.close();
%>
		
</body>
</html>