<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import="java.net.URLEncoder" %>
<html>
<head>
<link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" >
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MyWorld Cart</title>
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
	    <jsp:include page="main_header.jsp"/>
 		<hr>
 	</div>
	<%
		//현재 세션 정보 가져오기 .( sign in 한  유저. )
		String user_id = (String) session.getAttribute("userID");
	%>
	<%@ include file="dbconn.jsp" %>
	<!-- 장바구니 목록 출력하기  -->
	<main role="main" class="container">
	 	<div style="text-align:center;"class="container">
 			<h2>장바구니</h2>
 		</div>
		<div class="container">
		<div class="row">
			<table>
				<tr>
					<td align="left"><a href="./shop_deleteCart.jsp" 
						class="btn btn-danger">삭제하기</a></td>
					<td align="right"><a href="./paymentInfo.jsp" 
						class="btn btn-success">결제하기</a></td>
					<!--  td align="right"><a href="./shop_purchaseCart.jsp" 
						class="btn btn-success">결제하기</a></td-->
				</tr>
			</table>
		</div>
	<%
		int cnt= 0;
		int sum =0;
		
		ResultSet rs = null;
		PreparedStatement pstmt = null;		
		//cart table 호출 
		try{
			String sql = "select * from cart where owner = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,user_id);
			rs = pstmt.executeQuery();
			%>
			<div style="padding-top:50px">
				<table class="table table-hover">
					<tr>
						<th>음악 ID</th>
						<th>제목</th>
						<th>가격&nbsp;&nbsp;(원)</th>
						<th>비고</th>
					</tr>
			<%
			while(rs.next()){

				//장바구니 주인으로부터 가져온 음악 id로 -> music_shop table 호출 
				String musicId = rs.getString("music_id");
					//음악 id, 제목, 가격 가져와서 출력하기 .
					ResultSet rs2 = null;
					Statement stmt = null;	
					try{
						String sql2 = "select * from music_shop where m_id='"
								+ musicId + "'";
						stmt = conn.createStatement();
						rs2 = stmt.executeQuery(sql2);
						
						if(rs2.next()){
							String name = rs2.getString("m_name");
							String price = rs2.getString("m_price");
							sum += Integer.parseInt(price); //총합 가격 구해주기 .
							%>
							<tr>
								<td><%=musicId %></td>
								<td><%= name%></td>
								<td><%=price%></td>
								<!-- 장바구니에서 음악1개 삭제하기  -->
								<td><a href="./shop_removeCart.jsp?musicId=<%=musicId%>"
									class="badge badge-danger">삭제</a></td>
							</tr>
							<%
						}
					}catch(SQLException ex){
						
					}finally{
						if(rs2!=null)
							rs2.close();
						if(stmt!=null)
							stmt.close();

					}	
				}	
		}catch(SQLException ex){//cart table 호출 실패 
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
			<tr>
				<th></th>
				<th>총액</th>
				<th><%=sum %> &nbsp;&nbsp;(원)</th>
				<th></th>
			</tr>
		</table>
		<a href="./shop.jsp" class="btn btn-secondary"> &laquo; 쇼핑 계속하기</a>
		
		</div>
		</div> <!-- container end -->
	</main><!-- container end -->
				<jsp:include page="footer.jsp"/>
	
</body>
</html>