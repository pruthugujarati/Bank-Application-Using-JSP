<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<form name="myform" action="depositservlet.jsp">

Enter Amount : <br>
<input type="number" name="value" > <br><br>

Select Transaction Option: <br>
<select  name="option">
    <option value="Deposit" >Deposit Money</option>
     <option value="Withdraw" >Withdraw Money</option>
     <option value="View">View Balance</option>
</select>
<input type="submit" value="Submit">


</form>


    		
    		
    		
    
   

</body>
</html>