<%@ page import="java.net.URLEncoder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" >
<link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>MyWorld Shop</title>
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<!--  script type="text/javascript"> 
	function addToCart(){
		if(confirm("음악을 장바구니에 추가하시겠습니까?")){
				document.addMusic.submit();
		}else{
			document.addMusic.reset();
		}
	}
</script-->
<body>
<!-- 좌측 메뉴바! -->
<div class="nav-scroller py-1 mb-2" style="position:fixed;">
    <nav class="nav d-flex justify-content-between">
    <ul style=" list-style:none;">
    	<!--  장바구니 버튼   -->
    	<li><a class="btn btn-sm btn-outline-secondary" href="./shop_cart.jsp">장바구니</a></li>
    	<!-- 음악 장르별로 이동 가능 -->
     	<li><a class="p-2 text-muted" href="#pop" style="font-size:1.2rem; font-family:cursive;">Pop</a></li>
      	<li><a class="p-2 text-muted" href="#elec" style="font-size:1.2rem; font-family:cursive;">Electronica</a></li>
        <li><a class="p-2 text-muted" href="#cinema" style="font-size:1.2rem; font-family:cursive;">Cinematic</a></li>
        <li><a class="p-2 text-muted" href="#jazz" style="font-size:1.2rem; font-family:cursive;">Jazz</a></li>
        <li><a class="p-2 text-muted" href="#acou" style="font-size:1.2rem; font-family:cursive;">Acoustic</a></li>
    </ul>
    </nav>
</div>

	 <div class="container">
	    <jsp:include page="main_header.jsp"/>
 		<hr>
 	</div>
 	
 	<main role="main" class="container">
 	<%@ include file="dbconn.jsp" %>

		<br>

		<!-- 음악 리스트  출력  -->
		<div class="container">
			
		<%
		int cnt =0;

		//현재 세션 정보 가져오기 .( sign in 한  유저. )
		String user_id = (String) session.getAttribute("userID");
		
		ResultSet rs = null;
		PreparedStatement pstmt = null;		
		try{
			String sql = "select * from music_shop where m_genre = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,"pop");
			rs = pstmt.executeQuery();
			cnt=0;
			%>
			<div class="container">
				<div >
					<a name="pop"></a>
					<h2>Pop</h2>
				</div>
			<%
			while(rs.next()){
				//가져온 값들을 저장해주고.
				if(cnt%2==0){
					 %><div class="row mb-2"><%
				}
				String mId = rs.getString("m_id");
				String mName  = rs.getString("m_name");
				String musicFile = rs.getString("m_filename");
				String mPrice = rs.getString("m_price");
				String mSinger = rs.getString("m_singer");
				String mDescription = rs.getString("m_description");

				cnt++;
				%>

    			<div class="col-md-6">
      				<div class="row">
        				<div class="col">
         				 	<p class="d-inline-block mb-2 text-primary">[<%=cnt %>]</p>
          					<h5 class="mb-0"><%=mName %></h5>
          					<br>
          					<div class="row">
          						<div class="col-md-4 mb-0 text-muted"><%=mSinger %></div>
          						<div class="col-md-4"><%=mPrice %>원</div>
          					</div>
          					<p class="mb-auto"><%=mDescription %></p>
          					<div class="row">
          							<div class="col-md-9 mb-0"><audio controls> <source src="./music/<%=musicFile %>" 	
  		    						type="audio/mp3"> </audio></div>
  		    						<div class="col">
  		    							<a class="btn btn-outline-secondary" href="./shop_addCart.jsp?musicId=<%=mId %>" >구매 &raquo;</a>
  		    						</div>
  		    					</div>
        				</div>
      				</div>
    			</div>

				<% 		
				if(cnt%2==0){
					 %></div><!-- row end --><%
				}
			}%>
			</div><!-- container end -->
			<hr>
			<%
			sql = "select * from music_shop where m_genre = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,"electronica");
			rs = pstmt.executeQuery();
			cnt=0;
			%>
			<div class="container">
				<div>
					<a name="elec"></a>
					<h2>Electronica</h2>
				</div>
			<%
			while(rs.next()){
				//가져온 값들을 저장해주고.
				if(cnt%2==0){
					 %><div class="row mb-2"><%
				}
				String mId = rs.getString("m_id");
				String mName  = rs.getString("m_name");
				String musicFile = rs.getString("m_filename");
				String mPrice = rs.getString("m_price");
				String mSinger = rs.getString("m_singer");
				String mDescription = rs.getString("m_description");

				cnt++;
				%>

    			<div class="col-md-6">
      				<div class="row">
        				<div class="col">
         				 	<p class="d-inline-block mb-2 text-primary">[<%=cnt %>]</p>
          					<h5 class="mb-0"><%=mName %></h5>
          					<br>
          					<div class="row">
          						<div class="col-md-4 mb-0 text-muted"><%=mSinger %></div>
          						<div class="col-md-4"><%=mPrice %>원</div>
          					</div>
          					<p class="mb-auto"><%=mDescription %></p>
          					<div class="row">
          							<div class="col-md-9 mb-0"><audio controls> <source src="./music/<%=musicFile %>" 	
  		    						type="audio/mp3"> </audio></div>
  		    						<div class="col">
  		    							<a class="btn btn-outline-secondary" href="./shop_addCart.jsp?musicId=<%=mId %>" >구매 &raquo;</a>
  		    						</div>  		    					
  		    				</div>
        				</div>
      				</div>
    			</div>

				<% 		
				if(cnt%2==0){
					 %></div><!-- row end --><%
				}
			}%>
			</div><!-- container end -->
			<hr>
			<%
			sql = "select * from music_shop where m_genre = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,"cinematic");
			rs = pstmt.executeQuery();
			cnt=0;
			%>
			<div class="container">
				<div>
					<a name="cinema"></a>
					<h2>Cinematic</h2>
				</div>
			<%
			while(rs.next()){
				//가져온 값들을 저장해주고.
				if(cnt%2==0){
					 %><div class="row mb-2"><%
				}
				String mId = rs.getString("m_id");
				String mName  = rs.getString("m_name");
				String musicFile = rs.getString("m_filename");
				String mPrice = rs.getString("m_price");
				String mSinger = rs.getString("m_singer");
				String mDescription = rs.getString("m_description");

				cnt++;
				%>

    			<div class="col-md-6">
      				<div class="row">
        				<div class="col">
         				 	<p class="d-inline-block mb-2 text-primary">[<%=cnt %>]</p>
          					<h5 class="mb-0"><%=mName %></h5>
          					<br>
          					<div class="row">
          						<div class="col-md-4 mb-0 text-muted"><%=mSinger %></div>
          						<div class="col-md-4"><%=mPrice %>원</div>
          					</div>
          					<p class="mb-auto"><%=mDescription %></p>
          					<div class="row">
          							<div class="col-md-9 mb-0"><audio controls> <source src="./music/<%=musicFile %>" 	
  		    						type="audio/mp3"> </audio></div>
  		    						<div class="col">
  		    							<a class="btn btn-outline-secondary" href="./shop_addCart.jsp?musicId=<%=mId %>" >구매 &raquo;</a>
  		    						</div>  		    					
  		    				</div>
        				</div>
      				</div>
    			</div>

				<% 		
				if(cnt%2==0){
					 %></div><!-- row end --><%
				}
			}%>
			</div><!-- container end -->
			<hr>
			<%
			sql = "select * from music_shop where m_genre = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,"jazz");
			rs = pstmt.executeQuery();
			cnt=0;
			%>
			<div class="container">
				<div>
					<a name="jazz"></a>
					<h2>Jazz</h2>
				</div>
			<%
			while(rs.next()){
				//가져온 값들을 저장해주고.
				if(cnt%2==0){
					 %><div class="row mb-2"><%
				}
				String mId = rs.getString("m_id");
				String mName  = rs.getString("m_name");
				String musicFile = rs.getString("m_filename");
				String mPrice = rs.getString("m_price");
				String mSinger = rs.getString("m_singer");
				String mDescription = rs.getString("m_description");

				cnt++;
				%>

    			<div class="col-md-6">
      				<div class="row">
        				<div class="col">
         				 	<p class="d-inline-block mb-2 text-primary">[<%=cnt %>]</p>
          					<h5 class="mb-0"><%=mName %></h5>
          					<br>
          					<div class="row">
          						<div class="col-md-4 mb-0 text-muted"><%=mSinger %></div>
          						<div class="col-md-4"><%=mPrice %>원</div>
          					</div>
          					<p class="mb-auto"><%=mDescription %></p>
          					<div class="row">
          							<div class="col-md-9 mb-0"><audio controls> <source src="./music/<%=musicFile %>" 	
  		    						type="audio/mp3"> </audio></div>
  		    						<div class="col">
  		    							<a class="btn btn-outline-secondary" href="./shop_addCart.jsp?musicId=<%=mId %>" >구매 &raquo;</a>
  		    						</div>  		    					
  		    				</div>
        				</div>
      				</div>
    			</div>

				<% 		
				if(cnt%2==0){
					 %></div><!-- row end --><%
				}
			}%>
			</div><!-- container end -->
			<hr>
			<%
			sql = "select * from music_shop where m_genre = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,"acoustic");
			rs = pstmt.executeQuery();
			cnt=0;
			%>
			<div class="container">
				<div>
					<a name="acou"></a>
					<h2>Acoustic</h2>
				</div>
			<%
			while(rs.next()){
				//가져온 값들을 저장해주고.
				if(cnt%2==0){
					 %><div class="row mb-2"><%
				}
				String mId = rs.getString("m_id");
				String mName  = rs.getString("m_name");
				String musicFile = rs.getString("m_filename");
				String mPrice = rs.getString("m_price");
				String mSinger = rs.getString("m_singer");
				String mDescription = rs.getString("m_description");

				cnt++;
				%>

    			<div class="col-md-6">
      				<div class="row">
        				<div class="col">
         				 	<p class="d-inline-block mb-2 text-primary">[<%=cnt %>]</p>
          					<h5 class="mb-0"><%=mName %></h5>
          					<br>
          					<div class="row">
          						<div class="col-md-4 mb-0 text-muted"><%=mSinger %></div>
          						<div class="col-md-4"><%=mPrice %>원</div>
          					</div>
          					<p class="mb-auto"><%=mDescription %></p>
          					<div class="row">
          							<div class="col-md-9 mb-0"><audio controls> <source src="./music/<%=musicFile %>" 	
  		    						type="audio/mp3"> </audio></div>
  		    						<div class="col">
  		    							<a class="btn btn-outline-secondary" href="./shop_addCart.jsp?musicId=<%=mId %>" >구매 &raquo;</a>
  		    						</div>  		    					
  		    				</div>
        				</div>
      				</div>
    			</div>

				<% 		
				if(cnt%2==0){
					 %></div><!-- row end --><%
				}
			}%>
			</div><!-- container end -->
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
		}
	%>

			
		</div><!-- container end -->
	</main> <!-- main end -->
				<jsp:include page="footer.jsp"/>
	
</body>
</html>