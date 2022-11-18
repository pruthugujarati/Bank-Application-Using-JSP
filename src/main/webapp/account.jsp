<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>
<h2>Account Page </h2>

<div class="box1">
<h1>Please,Login to Access your Account</h1>


<% 
ServletContext sc = getServletContext();

String actnumber =(String)sc.getAttribute("actnumber");

out.print("Your account number : "+actnumber);
%>
<form action="accountservlet.jsp"  id="act_id">

<p><b>Enter Account Number :</b><br>
  <input type="text" name="actnumber" required></p>
<p><b> Enter Pin Number : </b> <br>
  <input type="text" name="pin" required></p>
  <br>
   

<input type="submit" value="Submit" id="submit_btn">
</form>
</div>
</body>
</html>