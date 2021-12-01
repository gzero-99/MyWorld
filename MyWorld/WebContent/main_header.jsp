<%@ page import="java.net.URLEncoder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
</head>
<body>
<header class="blog-header py-3">
    <div class="row flex-nowrap justify-content-between align-items-center">
      <div class="col-4 pt-1">
        <!--  a class="text-muted" href="#">Subscribe</a-->
        <!-- 되면 초기페이지로 돌아가는 거 ? 근데 main 화면에 있는 logout버튼 이랑 같은 효과니까  필요없을듯 ! -->
        <a class="navbar-brand" href="initial.jsp"><i class="fa fa-home" style="color:black" aria-hidden="true"></i></a>
      </div>
      <div class="col-4 text-center">
    <%
	//현재 세션 정보 가져오기 .( sign in 한  유저. )
	String user_id = (String) session.getAttribute("userID");
	%>
        <a class="blog-header-logo text-dark" href="./myWorld_<%=user_id %>.jsp"
        	style="font-weight: bold; font-family:cursive;
        	font-size:2.0rem;"><%=user_id%>'s World</a>
      </div>
      <div class="col-4 d-flex justify-content-end align-items-center">
        <!-- 로그인한 상태로 찾아왔으면 logout , 세션 연결 안되어 있으면 sign in -->
        <a class="btn btn-sm btn-outline-secondary" href="./logout.jsp">Logout</a>
      </div>
    </div>
  </header>

  <div class="nav-scroller py-1 mb-2">
    <nav class="nav d-flex justify-content-between">
      <a class="p-2 text-muted" href="./main_edit.jsp" style="font-size:1.2rem; font-family:cursive;">Edit</a>
      <a class="p-2 text-muted" href="./myWorld_<%=user_id %>.jsp" style="font-size:1.2rem; font-family:cursive;">Home</a>
      <a class="p-2 text-muted" href="./forum_board.jsp" style="font-size:1.2rem; font-family:cursive;">Forum</a>
      <a class="p-2 text-muted" href="./photo_board.jsp" style="font-size:1.2rem; font-family:cursive;">Photo</a>
      <!--  a class="p-2 text-muted" href="./guest_book.jsp" style="font-size:1.2rem; font-family:cursive;">Guest</a-->
      <a class="p-2 text-muted" href="./shop.jsp" style="font-size:1.2rem; font-family:cursive;">Shop</a>
    </nav>
  </div>

 		
 </body>
</html>