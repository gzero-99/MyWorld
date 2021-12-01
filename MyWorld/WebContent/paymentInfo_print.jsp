<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URLDecoder"%>
<%@ page import ="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//결제 정보 출력 페이지
	request.setCharacterEncoding("UTF-8");
	String user_id = (String) session.getAttribute("userID");
	
	String payment_id = "";
	String payment_name = "";
	String payment_company = "";
	String payment_card = "";
	String payment_month = "";
	String payment_year = "";
	String payment_pw = "";
	Cookie[] cookies = request.getCookies();
	
	//null 값이 아니라면, 쿠키에 해당하는 정보를 가지고 온다.
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				Cookie thisCookie = cookies[i];
				String n = thisCookie.getName();
				
				if (n.equals("Payment_id")){
					payment_id =
						URLDecoder.decode((thisCookie.getValue()),"utf-8");
				}
				if (n.equals("Payment_name")){
					payment_name =
						URLDecoder.decode((thisCookie.getValue()),"utf-8");
				}
				if (n.equals("Payment_company")){
					payment_company =
						URLDecoder.decode((thisCookie.getValue()), "utf-8");
				}
				if (n.equals("Payment_card")){
					payment_card =
						URLDecoder.decode((thisCookie.getValue()),"utf-8");
				}
				if (n.equals("Payment_month")){
					payment_month =
						URLDecoder.decode((thisCookie.getValue()),"utf-8");
				}
				if (n.equals("Payment_year")){
					payment_year =
						URLDecoder.decode((thisCookie. getValue()), "utf-8");
				}
				if (n.equals("Payment_pw")){
					payment_pw =
						URLDecoder.decode((thisCookie. getValue()), "utf-8");
				}
			}
		}

%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" >
<link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MyWorld Payment Info</title>
</head>
<body>
	<%@ include file="dbconn.jsp" %>

	 <div class="container">
	    <jsp:include page="main_header.jsp"/>
 		<hr>
 	</div>
 	<main role="main" class="container">
 		<div style="text-align:center;"class="container">
 			<h2>결제 정보</h2>
 		</div>
 		<div class="row justify-content-between">
 			<div class="col-4" align="left">
 				<strong>카드 결제</strong>
				<br> 성명 :
					<%out.println(payment_name);%>
				<br> 카드회사 :
					<%out.println(payment_company);%>
				<br> <p>카드번호 :
					 <em> <%out.println(payment_card);%></em><br>
 			</div>
 			<div class="col-4" align="right">
				<br> 유효기간 :<%out.println(payment_month); %>,<%out.println(payment_year); %>
				<br> 비밀번호 : ** <br>
 			</div>
 		</div>
 		<div	style="padding-top:30px">
 			<table class="table table-hover">
 				<tr>
 					<th class="text-center">제목 </th>
 					<th class="text-center">가격&nbsp;&nbsp;(원)</th>
 				</tr>
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
								<td class="text-center"><%= name%></td>
								<td class="text-center"><%=price%></td>
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
 					<td class="text-right"><strong>총액 : </strong></td>
 					<td class="text-center text-danger"><strong><%=sum %></strong></td>
 				</tr>
 			</table>
 			<a href="./paymentInfo.jsp"
					class="btn btn-secondary" role="button"> 이전 </a>
			<a href="./shop_purchaseCart.jsp" class="btn btn-success" role="button"> 결제완료 </a> 
 		</div>
 	</main>
 	<jsp:include page="footer.jsp"/>
</body>
</html>