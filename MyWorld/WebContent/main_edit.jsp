<%@ page import="java.net.URLEncoder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" >
<link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MyWorld Edit</title>
</head>
<body>

<div class="container">
 			<jsp:include page="main_header.jsp"/>  
 			<%@ include file="dbconn.jsp" %>
	<%
		String user_id = (String) session.getAttribute("userID");

		ResultSet rs = null;	
		PreparedStatement pstmt = null;		
		try{
			String sql = "select * from member where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,user_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				String name = rs.getString("name");			
	%>

  	<div class="jumbotron p-4 p-md-5 text-white rounded bg-dark">
  	 <form class ="form-change" method="post" action="edit_process.jsp" enctype="multipart/form-data">
  		<div class="row">
   			<div class="col-md-6 px-0">
   		   		<h1 class="display-4"><%=name %></h1>
   		   		<!-- 자기소개 내용 변경하기 추가!  -->
   		   		<h5>[1] 자기소개 내용을 변경하세요 </h5>
   		   		<textarea name = "description" cols="40" rows="3"></textarea>
    	 	</div>
    	 	<!-- 프로필 사진 변경하기 ! -->
   		    <div class="col-md-6 px-0" >
   		    	<div class="row"><h5> [2] 프로필 사진을 변경하세요 [필수]</h5></div>
    			<br>
    			<div class="row" style="text-algin:right"><input type="file" name="profile_image"></div>
    		</div>
    	</div>
    	<div class="row">
    	<div class="col-md-6 px-0">
  		  <div>
  		  	<br>
  		  	  		 				<h5>[3] 프로필 대표 음악을 선택하세요.</h5>
  		  	<!-- 음악 변경하는 부분  -->
								
  		  	<select name="musicFile">
  		  	<%
				}
			PreparedStatement pstmt2 = null;
			ResultSet rs2=null;
			try{
				sql = "select * from music where m_owner = ?" ;
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,user_id);
				rs = pstmt.executeQuery();


			
				while(rs.next()){
					//가져온 값들을 저장해주고.
					String music_id = rs.getString("m_id");
					
					sql = "select * from music_shop where m_id = ?" ;
					pstmt2 = conn.prepareStatement(sql);
					pstmt2.setString(1,music_id);
					rs2 = pstmt2.executeQuery();
  		  			//음악이 있으면 audio 보이기 . 없으면 안보이기 ..설정! 
  		  			
  		  			if(rs2.next()){
  		  				String musicFile = rs2.getString("m_filename");
  		  			%>
  		    			<!-- 음악 선택 : edit 누른 경우에 -->
						<option value="<%=musicFile%>"><%=musicFile%></option>
  		  			<%
  		  			  	
  		  			}
				}
			}catch(SQLException ex){
				out.println("SQLEXception: "+ex.getMessage());
			}finally{
				if(rs2!=null)
					rs2.close();
				if(pstmt2!=null)
					pstmt2.close();
			}
		  		%>
			</select>
			</div>
			<br>
		<input class="btn btn-sm btn-outline-secondary" type="submit" value="적용">

				<% 
		}catch(SQLException ex){//music table 호출 실패 
			out.println("SQLException : "+ex.getMessage());
		}finally{
			if(rs!=null)
				rs.close();
			if(pstmt!=null)
				pstmt.close();
			if(conn!=null)
				conn.close();
		}%>
  		  </div>
  		  </div>
  	</form>
   </div> 
  	
	
	
</div><!-- container -->
 	
 	<main role="main" class="container">
 		<div style="text-align:center;">
 			<h3> MyWorld 수정 모드 사용중 입니다. </h3>
 		</div>
	</main>
		<jsp:include page="footer.jsp"/>
	
</body>
</html>