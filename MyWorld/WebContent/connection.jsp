<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import ="java.sql.*" %>
<html>
<head>
<title>Database SQL</title>
</head>
<body>
<%
	Connection conn =null;
	try{
		String url = "jdbc:mysql://localhost:3306/myworlddb";
		String user = "root";
		String password = "12341234";
			
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, user, password);
		out.println("database 연결이 성공했습니다. ");
		
	}catch(SQLException ex){
		out.println("database 연결이 실패했습니다. <br>");
		out.println("SQLEXception : "+ ex.getMessage());
	}finally{
		
		if(conn!=null)
			conn.close();
	}
	

%>
</body>
</html>
