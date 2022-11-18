<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.Random, java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Account</title>
</head>
<body>
<%
response.setContentType("text/html");


String actnumber = request.getParameter("actnumber");
String pin = request.getParameter("pin");


try {
ServletContext ctx = getServletContext();
Connection conn = (Connection) ctx.getAttribute("con");
ctx.setAttribute("actnumber", actnumber);

PreparedStatement psmt = conn.prepareStatement("select pin,q1,ans1,q2,ans2,q3,ans3,q4,ans4 from BankJSP where act_number=?");

psmt.setString(1, actnumber);

ResultSet rs = psmt.executeQuery();

while(rs.next())
{
	if(pin.equals(rs.getString(1)))
	{
		String q1 = rs.getString(2);
		String q2 = rs.getString(4);
		String q3 = rs.getString(6);
		String q4 = rs.getString(8);
		
		Random random = new Random();
		int x = random.nextInt(4);
		
		List<String> list = new ArrayList<>();
		list.add(q1);
		list.add(q2);
		list.add(q3);
		list.add(q4);
		
		String que = list.get(x);
		//System.out.print(list);
		System.out.print(que);
	%>
		
		<h1>Successfully Logged into your Account </h1>
		<h1>Answer this Security Question : </h1> 
		
		
	<% 
	out.print(que);
	
	List<String> list1 = new ArrayList<>();
		list1.add(rs.getString(3));
		list1.add(rs.getString(5));
		list1.add(rs.getString(7));
		list1.add(rs.getString(9));
		
		String ans = list1.get(x);
		System.out.print(ans);
		
		ctx.setAttribute("ans", ans);
	%>
	  
	 <form action='question.jsp' >
	   <input type='text' name='ans1'> <br><br>
	   <input type='submit' value='Submit'id='btn_que' >
	   </form>
	  
<%
	}
	else
	{
		out.print("<br><br><h3>Please enter correct PIN number...</h3>");
		request.getRequestDispatcher("account.jsp").include(request, response);
	}
}
} 
catch (SQLException e) 
{
	System.out.print(e);
}

%>
</body>
</html>