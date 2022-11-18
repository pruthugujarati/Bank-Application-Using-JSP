<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
response.setContentType("text/html");


String option1 = request.getParameter("option");

try {
	ServletContext ctx = getServletContext();
	Connection conn = (Connection) ctx.getAttribute("con");
	String actnumber = (String) ctx.getAttribute("actnumber");
	
	PreparedStatement psmt = conn.prepareStatement("select amount,Holder_name, act_type from BankJSP  where act_number=?");

	psmt.setString(1, actnumber);
	ResultSet rs = psmt.executeQuery();
	
	while (rs.next()) {
	if(option1.equals("View")){
		
	%>
		<%=	"<h3>Account Holder's Details : </h3>"%>
		<%="<h4><br> Account Number : " + actnumber + "<br><br>"%>
		<%=	 "Balance : " + rs.getDouble(1) + "$ <br><br>"%>
		<%= " Holder name : " + rs.getString(2) + "<br><br>"%>
		<%=	" Account type : " + rs.getString(3) + "</h4>"%>
	<%	
			}
	
	else if(option1.equals("Deposit"))
{     
	   String deposit2 = request.getParameter("value");
	   double deposit3 = Double.parseDouble(deposit2);
	
		double b1 = rs.getDouble(1) + deposit3;

		PreparedStatement psmt1 = conn.prepareStatement("Update BankJSP set amount=? where act_number=?");

		psmt1.setDouble(1, b1);
		psmt1.setString(2, actnumber);

		int count = psmt1.executeUpdate();
		System.out.println(count + "row updated");

		out.print("<h3>Now, Your new balance is : </h3>"+"<h2>" + b1 + "$ </h2>");
}
	
	
else if(option1.equals("Withdraw"))
   {
	String deposit2 = request.getParameter("value");
	double deposit3 = Double.parseDouble(deposit2);
			if(rs.getDouble(1)<deposit3)
			{
				
				out.print("<h3>You have insufficient balance, can't withdraw.</h3>");
				
				request.getRequestDispatcher("account.jsp").include(request, response);
				
			}
			else
			{
				double b2 = rs.getDouble(1)-deposit3;
				
		out.print("<h3>Your new balance is : </h3>"+"<h2>"+b2+"$</h2>");	
		PreparedStatement psmt1 = conn.prepareStatement("update BankJSP set amount=? where act_number=?");	
		psmt1.setDouble(1, b2);
		psmt1.setString(2, actnumber);
		
		int row =psmt1.executeUpdate();
		System.out.println(row +" row is updated");
		}
		}
	}
	}
  catch (SQLException e) {
	System.out.println(e);
}
%>
		<form action='account.jsp'>
		<input type='submit' value='Continue' class='btn_deposit' >
		</form>
		<br>

		<form action='index.jsp'>
		<input type='submit' value='Home Page' class='btn_home' >
		</form>
		
</body>
</html>