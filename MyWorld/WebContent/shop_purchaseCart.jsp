<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="java.io.*" %>
<%@ page import="java.net.URLEncoder" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>	<!-- cart에서 유저 해당 음악 모두 구매하기 + music DB에 등록하기  .. -->
	<%@ include file="dbconn.jsp" %>
	
<%		
	//현재 세션 정보 가져오기 .( sign in 한  유저. )
	String user_id = (String) session.getAttribute("userID");

	
	//[1] 카트에서 유저에 해당하는 음악 : music DB에 소유 등록하기 +  [2]cart에서 record 지우기(deleteCart.jsp)).
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	try{
		String sql="select * from cart where owner =? ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,user_id);
		rs = pstmt.executeQuery();
		

		while(rs.next()){
			String music_id = rs.getString("music_id"); //차례대로 가져온 음악들 ..
			
			Statement stmt =null;
			try{ //music DB에 저장해주기. (소유 등록)
				String sql2 = "insert into music(m_id, m_owner, m_main_on) values ('"
						+music_id+"','"+user_id+"','0')";
				stmt = conn.createStatement();
				stmt.executeUpdate(sql2);
			}catch(SQLException ex){
				
			}finally{
				if(stmt!=null)
					stmt.close();
			}
			
		}
	}catch(SQLException ex){
		
	}finally{
		if(rs!=null)
			rs.close();
		if(pstmt!=null)
			pstmt.close();
	}



	//[2]
	Statement stmt = null;
	try{
		String sql="delete from cart where owner='" + user_id +"'";
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
		writer.println("<script>alert('구매에 성공했습니다. 감사합니다~^^ '); location.href='shop.jsp';</script>"); 
		writer.close();
%>
		
</body>
</html>