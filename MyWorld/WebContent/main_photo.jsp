<%@ page import="java.net.URLEncoder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<%int cnt=0; %>
	<%@ include file="dbconn.jsp"%>
	<%
		//현재 세션 정보 가져오기 .( sign in 한  유저. )
		String user_id = (String) session.getAttribute("userID");
		
		ResultSet rs = null;
		PreparedStatement pstmt = null;		
		try{
			String sql = "select * from photo where p_uploader = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,user_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				if(cnt%2==0){
					 %><div class="row mb-2"><%
				}
				//가져온 값들을 저장해주고.
				String title = rs.getString("p_title");
				String photo  = rs.getString("p_photo");
				String postTime = rs.getString("p_postingTime");
				String comment = rs.getString("p_comment");
				cnt++;
				%>

    			<div class="col-md-6">
    	  			<div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
        				<div class="col p-4 d-flex flex-column position-static">
          					<strong class="d-inline-block mb-2 text-primary">[<%=cnt %>]</strong>
          					<h3 class="mb-0"><%=title %></h3>
          					<br>
          					<div class="mb-1 text-muted"><%=postTime %></div>
          					<p class="card-text mb-auto"><%=comment %></p>
        				</div>		
        				<div class="col-auto d-none d-lg-block">
        					<img src="./uploadFile/<%=photo %>" width="200" height="250"/>
        				</div>
      				</div>
    			</div>

				<% 		
					if(cnt%2==0){
			 				%></div><%
						}
				}	
		}catch(SQLException ex){//music table 호출 실패 
			out.println("SQLException : "+ex.getMessage());
		}finally{
			if(rs!=null)
				rs.close();
			if(pstmt!=null)
				pstmt.close();
			if(conn!=null)
				conn.close();
		}
	%>
</body>
</html>