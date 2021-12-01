<%@ page import="java.net.URLEncoder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import ="com.oreilly.servlet.*"%>
<%@ page import ="com.oreilly.servlet.multipart.*"%>
<%@ page import ="java.util.*" %>
<%@ page import ="java.io.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<%@ include file="dbconn.jsp" %>

<!-- 음악 선택된 내용 / 프로필 사진 선택 / 자기소개 새로 작성한 내용이날라오면  -->
<%
	String user_id = (String) session.getAttribute("userID");

	//String intro = request.getParameter("description");
	//String profile = request.getParameter("profile_image");
	//String musicFile = request.getParameter("musicFile");
	
	//userid - music에서 해당하는 music id의 부분에 1로 설정
	//아닌 애는 0으로 설정해주기 .
	
	request.setCharacterEncoding("utf-8");
		
		//상대경로 -> 절대경로로바꾼 후 파일 업로드 
 		String uploadPath = request.getSession().getServletContext().getRealPath("/uploadFile");
 		
		MultipartRequest multi = new MultipartRequest(request, uploadPath
			, 5*1024*1024, "utf-8", new DefaultFileRenamePolicy());	
		
		String intro = multi.getParameter("description");
		Enumeration files = multi.getFileNames();
		String profile = (String) files.nextElement();
		String filename = multi.getFilesystemName(profile); //저장파일이름 -중복시 1,2,3붙음 

		String musicFile = multi.getParameter("musicFile");

	ResultSet rs = null;
	PreparedStatement pstmt = null;
	try{
		if(!intro.isEmpty()){ //intro란이 비지 않은 경우.
			if(profile!=null ){ //프로필란도 비지 않은 경우. ->intro & 프로필변경  + 사진 업로드
			
				profile = filename;
				
				String sql = "update member set intro = ? where id= ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,intro);
				pstmt.setString(2,user_id);
				pstmt.executeUpdate();
				
				PreparedStatement pstmt2= null;
				try{
					String sql2 = "update member set profile = ? where id =?";
					pstmt2 = conn.prepareStatement(sql2);
					pstmt2.setString(1,profile);
					pstmt2.setString(2,user_id);
					pstmt2.executeUpdate();

				}catch(SQLException ex){
					out.println("SQLException : "+ex.getMessage());
				}finally{
					if(pstmt2!=null)
						pstmt2.close();
				}


			}else{//프로필은 비어있는 경우. ->intro만 변경.
				String sql = "update member set intro = ?  where id= ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,intro);
				pstmt.setString(2,user_id);
				pstmt.executeUpdate();
			}
		}else{ //intro란이 비어있는 경우.
			//if(profile!=null){ //프로필란은 안비어있는 경우 -> 프로필만 변경. + 사진 업로드
					//!profile.isEmpty(), !profile.equals(""), profile!=null
				profile = filename;
				
				String sql = "update member set profile = ?  where id= ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,profile);
				pstmt.setString(2,user_id);
				pstmt.executeUpdate();
				
			/*}else{ //프로필란도 비어있는 경우. -> 아무것도 안함 .
				
			}*/
		}
		//musicFile은 무조건 선택될예정임 .. 그 m_main_on 값을 1로 해주고, 나머지는 0으로해줌 
		String sql = "select m_id, m_main_on from music where m_owner = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,user_id);
		rs = pstmt.executeQuery();
		
		ResultSet rs2 = null;
		PreparedStatement pstmt2= null;
		while(rs.next()){
			String mId =rs.getString("m_id");
			int mMainOn = Integer.parseInt(rs.getString("m_main_on"));
			if(mMainOn==1){ //지금 뽑은게 1인데,
				
				try{
					String sql2 = "select m_filename from music_shop where m_id = ?";
					pstmt2 = conn.prepareStatement(sql2);
					pstmt2.setString(1,mId);
					rs2 = pstmt2.executeQuery();
					if(rs2.next()){
						String fname= rs2.getString("m_filename");
						if(fname.equals(musicFile)){//파일이 이름이 같다면 ? 내비둬 ..
						}else{ //같지 않다면?
							sql = "update music set m_main_on = '0' where m_owner = ? and m_id = ?" ;
							pstmt = conn.prepareStatement(sql);
							pstmt.setString(1,user_id);
							pstmt.setString(2,mId);
							pstmt.executeUpdate();
						}
					}
				}catch(SQLException ex){
					out.println("SQLException : "+ex.getMessage());
				}finally{
					if(rs2!=null)
						rs2.close();
					if(pstmt2!=null)
						pstmt2.close();
				}
			}else{ //뽑은게 0이면 
				try{
					String sql2 = "select m_filename from music_shop where m_id = ?";
					pstmt2 = conn.prepareStatement(sql2);
					pstmt2.setString(1,mId);
					rs2 = pstmt2.executeQuery();
					if(rs2.next()){
						String fname= rs2.getString("m_filename");
						if(fname.equals(musicFile)){//파일 이름이 같다면 ? 
							sql = "update music set m_main_on = '1' where m_owner = ? and m_id = ?" ;
							pstmt = conn.prepareStatement(sql);
							pstmt.setString(1,user_id);
							pstmt.setString(2,mId);
							pstmt.executeUpdate();
						}else{ //같지 않다면? 내비둬.. 
						}
					}
				}catch(SQLException ex){
					out.println("SQLException : "+ex.getMessage());
				}finally{
					if(rs2!=null)
						rs2.close();
					if(pstmt2!=null)
						pstmt2.close();
				}
			}
			
			
		}
		
		
		
	}catch(SQLException ex){
		out.println("SQLException : "+ex.getMessage());

	}finally{
		if(rs!=null)
			rs.close();
		if(pstmt!=null)
			pstmt.close();
		if(conn!=null)
			conn.close();
	}

	response.setContentType("text/html; charset=UTF-8"); 
	PrintWriter writer = response.getWriter(); 
	writer.println("<script>alert('프로필 수정에 성공했습니다.'); location.href='myWorld_"+user_id+".jsp';</script>"); 
	writer.close();
	
%>
</body>
</html>