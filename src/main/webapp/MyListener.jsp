<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
String url = "jdbc:mysql://localhost:3306/BANKDBJSP";
		String user = "root";
		String pass = "Pgujarati108@@";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection(url, user, pass);

			ServletContext ctx = getServletContext();
			ctx.setAttribute("con", conn);
		} catch (Exception e) {
			System.out.println(e);
		}
%>
</body>
</html>