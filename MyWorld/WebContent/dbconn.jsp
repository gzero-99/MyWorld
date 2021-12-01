<%@ page import ="java.sql.*"%>
<%
	Connection conn =null;

	String url="jdbc:mysql://localhost:3306/myworlddb?characterEncoding=euckr";
	String user="root";
	String password="12341234";
	
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(url,user,password);


%>