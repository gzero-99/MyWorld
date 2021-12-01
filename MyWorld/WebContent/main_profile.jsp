<%@ page import="java.net.URLEncoder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<%@ include file="dbconn.jsp" %>
	<%
		//현재 세션 정보 가져오기 .( sign in 한  유저. )
		String user_id = (String) session.getAttribute("userID");
		
		ResultSet rs = null;
		PreparedStatement pstmt = null;		
		try{
			String sql = "select * from member where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,user_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				//가져온 값들을 저장해주고.
				String name = rs.getString("name");
				String profile  = rs.getString("profile");
				String intro = rs.getString("intro");
				
	%>

  	<div class="jumbotron p-4 p-md-5 text-white rounded bg-dark">
  		<div class="row">
   			<div class="col-md-6 px-0">
   		   		<h1 class="display-4"><%=name %></h1>
    	  		<p class="lead my-3"><%=intro %></p>
    	 		<!--  p class="lead mb-0"><a href="#" class="text-white font-weight-bold">Continue reading...</a></p-->
    	 	</div>
   		    <div class="col-md-6 px-0" style="text-align:center; display:flex;">
    			<img data-src="holder.js/300x300" class="img-thumbnail" alt="300x300" src="./uploadFile/<%=profile %>" 
					data-holder-rendered="true" style="width: 300px; height:300px;margin:auto; display:inline-block;">
    		</div>
    	</div>
    	<div class="col-md-6 px-0" class="row" >
  		  <div>
  		  	<br>
  		  	<%
				}
			//이미 1인 부분이 있다고 생각하고 ..
			sql = "select * from music where m_owner = ? and m_main_on = '1'" ;
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,user_id);
			rs = pstmt.executeQuery();

			if(rs.next()){
				//가져온 값들을 저장해주고.
				String music_id = rs.getString("m_id");
				sql = "select * from music_shop where m_id = ?" ;
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,music_id);
				rs = pstmt.executeQuery();
  		  		//음악이 있으면 audio 보이기 . 없으면 안보이기 ..설정! 
  		  		
  		  		if(rs.next()){
  		  			String musicFile = rs.getString("m_filename");
  		  		  	%>
  		  		  	
  		  		  	<audio autoplay controls> <source src="./music/<%=musicFile %>" 
  		    			type="audio/mp3"> </audio>
  		    			<!-- 음악 선택하는 창 하나 띄우기 .. - edit 누른 경우에 -->
  		  		  	<% 
  		  		}

			}else{
				
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
  		  </div>
    	</div> 
	</div>
</body>
</html>