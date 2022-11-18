<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  import="java.sql.*,java.time.LocalDate ,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Account</title>
</head>
<body>
<%  

response.setContentType("text/html");
 

String type= request.getParameter("choice");
String name= request.getParameter("name");
String bdate = request.getParameter("bdate");
String drnumber = request.getParameter("drnumber");
String pin = request.getParameter("pin");
String deposit= request.getParameter("deposit");
String q1 = request.getParameter("q1");
String ans1 = request.getParameter("ans1");
String q2 = request.getParameter("q2");
String ans2 = request.getParameter("ans2");
String q3 = request.getParameter("q3");
String ans3 = request.getParameter("ans3");
String q4 = request.getParameter("q4");
String ans4 = request.getParameter("ans4");


if( pin.length()==4)
{
	LocalDate d = LocalDate.parse(bdate);
	int m = d.getYear();
	System.out.println(m);
	System.out.println(name.charAt(0));
	
	String actnumber = String.valueOf(m)+String.valueOf(name.charAt(0))+drnumber.substring(2, 5);
	System.out.println(actnumber);
	
	%>
	
	<%="Account Holder's Details: <br>"%>
	
	<%="<br>Your Account Type : "+type %>
    <%="<br>Account Holder Name   : "+name %>
	<%="<br>Your Birth Date : </b>"+bdate %>
	<%="<br><br>Your Driving License Number : </b>"+drnumber %>
	<%="<br>Your Pin Number : "+pin %>
	
	<%="<br><br>Your Account Number : "+actnumber %>
	
	<%="<br>Your current balance : $"+deposit %>
	
	 <%
	try {
		ServletContext sc = getServletContext();
		sc.setAttribute("actnumber", actnumber);
		
		Connection conn = (Connection) sc.getAttribute("con");
		PreparedStatement psmt = conn.prepareStatement("insert into BankJSP values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
		
		//ctx.setAttribute("actnumber", actnumber);
		
		psmt.setString(1, null);
		psmt.setString(2, name);
		psmt.setString(3, type);
		psmt.setString(4, actnumber );
		psmt.setString(5, bdate);
		psmt.setString(6, drnumber);
		psmt.setString(7, pin);
		psmt.setString(8, deposit);
		psmt.setString(9, q1);
		psmt.setString(10, ans1);
		psmt.setString(11, q2);
		psmt.setString(12, ans2);
		psmt.setString(13, q3);
		psmt.setString(14, ans3);
		psmt.setString(15, q4);
		psmt.setString(16, ans4);
		
		int count = psmt.executeUpdate();
		if(count==1)
			System.out.println(count+"row inserted successfully");
		else
			System.out.println("no record inserted");
		
		
	%>	
	    
	    <form action='account.jsp'>
		<br><input type='submit' value='Login to Perform Operation' id='btn_open'>
		</form>
	<%
	}
	catch(SQLException e)
	{
	System.out.println(e);
	}
}
else
{
	
	out.print("<h4><br><br>Pin Number should be 4 digits.<br></h4>");
	
	request.getRequestDispatcher("OpenAccount.jsp").include(request, response);
}
 %>
</body>
</html>