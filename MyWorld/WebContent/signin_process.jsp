<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import ="com.oreilly.servlet.*"%>
<%@ page import ="com.oreilly.servlet.multipart.*"%>
<%@ page import ="java.util.*" %>
<%@ page import ="java.io.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> Sign in Security </title>
</head>
<body>
	<%@ include file="dbconn.jsp" %>
	<!-- 로그인에 성공했습니다.
		하나의 객체로 해당하는 id 찾고 비밀번호까지 일치한지 확인해야 함!  -->
	<%
		String user_id = request.getParameter("id"); 	
		String user_pw = request.getParameter("passwd"); 
	
		ResultSet rs = null;
		Statement stmt = null;
		try{
			String sql = "select * from member where id = '" + user_id + "'";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs.next()){
				String id = rs.getString("id");
				String pw = rs.getString("passwd");
				
				if(user_id.equals(id) && user_pw.equals(pw)){
					// 세션 설정해주고 ,
					session.setAttribute("userID",id); // user01을 	userID에 setup
					session.setAttribute("userPW",pw); // 1234를 	userPW에 setup

					// 그 계정에 해당하는 페이지로 이동하기.
					response.sendRedirect("myWorld_"+id+".jsp");
				}else{
					//비밀번호 틀림 및 세션 설정 실패.
					//틀렸다 알림 띄워주고, 다시 로그인 시도하기로 가기.
					%>
					<!--  script>alert('비밀번호를 확인하시고 다시 시도하십시오.');</script-->
					<%
					//response.sendRedirect("signin.jsp");
					response.setContentType("text/html; charset=UTF-8"); 
					PrintWriter writer = response.getWriter(); 
					writer.println("<script>alert('비밀번호를 확인하시고 다시 시도하십시오.'); location.href='signin.jsp';</script>"); 
					writer.close();

				}
			
			}else{
				//일치 아이디가 없음 - 알림띄워주기
				%>
				<!-- script>alert('일치하는 아이디가 없습니다. 다시 시도하십시오.');</script-->
				<% 
				//response.sendRedirect("signin.jsp");
				response.setContentType("text/html; charset=UTF-8"); 
				PrintWriter writer = response.getWriter(); 
				writer.println("<script>alert('일치하는 아이디가 없습니다. 다시 시도하십시오.'); location.href='signin.jsp';</script>"); 
				writer.close();
			}
			
		}catch(SQLException ex){
			//out.println("Member 테이블 호출이 실패했습니다.<br>");
			out.println("SQLException : "+ex.getMessage());
		}finally{
			if(rs!=null)
				rs.close();
			if(stmt!=null)
				stmt.close();
			if(conn!=null)
				conn.close();
		}
	
	%>
	<%	
			/*
			//폼에서 가져오는 정보 
			String user_id = request.getParameter("id"); 	
			String user_pw = request.getParameter("passwd");
			
			//db에서 id 가져오고,같은id의 비밀번호를 가져와서 비교한다 .
			//그리고 세션 연결 설정하고, 자기만의 홈페이지로 넘어가면 됨! 
			if(user_id.equals("1") && user_pw.equals("1234")){
				session.setAttribute("userID",user_id); // 1을 	userID에 setup
				session.setAttribute("userPW",user_pw); // 1234를 	userPW에 setup
				out.println("세션 설정이 성공했습니다<br>");
				out.println(user_id+"님 환영합니다");
			}else{
				out.println("세션 설정이 실패했습니다");

			}
			*/
	%>
</body>
</html>
