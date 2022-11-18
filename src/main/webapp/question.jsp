<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
try {
	
	String ans1 = request.getParameter("ans1");
	ServletContext ctx = getServletContext();
    String ans = (String)ctx.getAttribute("ans");
		if(ans.equalsIgnoreCase(ans1))
		{
			out.print("<h3>Authetication, Successfully done!!</h3>");
			
			request.getRequestDispatcher("action.jsp").include(request, response);
		}
		else
		{
		  
		  out.print("<h3>Sorry ... Try again!!</h3>");
	      request.getRequestDispatcher("account.jsp").include(request, response);
	     
        }
}
catch(Exception e)
{
	System.out.println(e);
}
%>

</body>
</html>