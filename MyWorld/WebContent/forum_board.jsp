<%@ page import="java.net.URLEncoder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" >
<link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>MyWorld Forum</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	 <div class="container">
	    <jsp:include page="main_header.jsp"/>
 		<hr>
 	</div>
 	
 	<main role="main" class="container">
 	<%@ include file="dbconn.jsp" %>
 	
		<!-- 게시글 작성하기 버튼  -->
		<div class="row flex-nowrap justify-content-between align-items-center">
			<div class="col-2 d-flex justify-content-end align-items-center">
				<a class="btn btn-sm btn-outline-secondary" href="./forum_post.jsp">글 작성하기</a>
			</div>
		</div>
		<br>
		
		<!-- 게시글 출력  -->
		<div class="container">
			
		<%
		int cnt =0;

		//현재 세션 정보 가져오기 .( sign in 한  유저. )
		String user_id = (String) session.getAttribute("userID");
		
		ResultSet rs = null;
		PreparedStatement pstmt = null;		
		try{
			String sql = "select * from forum where f_writer = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,user_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				//가져온 값들을 저장해주고.
				if(cnt%2==0){
					 %><div class="row mb-2"><%
				}
				String title = rs.getString("f_title");
				String content  = rs.getString("f_contents");
				String postTime = rs.getString("f_postingTime");
				cnt++;
				%>

    			<div class="col-md-6">
      				<div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
        				<div class="col p-4 d-flex flex-column position-static">
         				 	<strong class="d-inline-block mb-2 text-primary">[<%=cnt %>]</strong>
          					<h2 class="mb-0"><%=title %></h2>
          					<br>
          					<div class="mb-1 text-muted"><%=postTime %></div>
          					<p class="mb-auto"><%=content %></p>
        				</div>
      				</div>
    			</div>

				<% 		
				if(cnt%2==0){
					 %></div><!-- row end --><%
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

			
		</div><!-- container end -->
			<jsp:include page="footer.jsp"/>
		
	</main> <!-- main end -->
	
</body>
</html>