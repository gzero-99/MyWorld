<%@ page import="java.net.URLEncoder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" >
<link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MyWorld</title>
</head>
<body>
<!-- 로그아웃 버튼 만들어서 거기에는 세션 삭제 + initial 로 가기 ..등 추가  -->
<!-- 다른 이용자의 id 작성하는 버튼 해서, 자기 디비에 친구를 등록해주고, 
	그 id가 저장되면 자기 블로그에서 친구 블로그 링크가 뜨도록 
	디비 불러와서 출력하기 (우측아래) -->
	 <div class="container">
	    <jsp:include page="main_header.jsp"/>
 		<jsp:include page="main_profile.jsp"/>
 	</div>
 	
 	<main role="main" class="container">
 		<jsp:include page="main_photo.jsp"/>
	<!--  1. 게시글 : 글 작성, 글 출력  -->
	<!-- 2. 사진 :  사진 업로드 글 작성 , 사진 출력  -->
	<!-- 3.방명록 : 방문한 자의 id 와 이 페이지 주인의 id 를 가져온다 . -->
	<!-- 어쩔수없지만 계정 3개정도만 만들어두자 . -->
	<!--  세션기준으로 설정했기 때문에 방명록 부분은 그냥 빼야할듯. .. -->
	
	<!--  4. 쇼핑기능 :  등록된 음악들을 장르별로 출력해주고, 하나씩 눌러서 들어보고
		내 음악 디비(musicshop말고 music db따로 )에 추가가능 
		추가될때 소유자의 id 도같이넣어주기 ! 
		
		그리고 블로그 위쪽에 노래 출ㄹ력되는데, 
		옆에 select form 으로 해당id의 노래들선택해서 노래 바꿔주기 가능하도록 .. -->
		
		<jsp:include page="footer.jsp"/>
	</main><!-- /.container -->	
</body>
</html>