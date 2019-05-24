<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>


<html>

<body>
<style> 

body {
	margin: 0;
	background: linear-gradient(45deg, #49a09d, #5f2c82);
	font-family: sans-serif;
	font-weight: 100;
	color:white;
	
}

form {

	margin:30px;
	padding:30px;
	
}
</style>

</body>
</html>

<%
String first_name=request.getParameter("first_name");
String last_name=request.getParameter("last_name");
String city_name=request.getParameter("city_name");
String email=request.getParameter("email");
String blood=request.getParameter("blood");
String bloodcheck=request.getParameter("bloodcheck");

try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/main", "root", "");
Statement st=conn.createStatement();

int i=st.executeUpdate("insert into entry_info(first_name,last_name,city_name,email,blood,bloodcheck)values('"+first_name+"','"+last_name+"','"+city_name+"','"+email+"' ,'"+blood+"','"+bloodcheck+"')");

out.print("\t"+"Data is successfully inserted!");

}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}


%>

<br> <br>

<head>
<style>
a:link, a:visited {
  background-color: white;
  color: black;
  border: 2px solid green;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  margin:20px;
}

a:hover, a:active {
  background-color: green;
  color: white;
  
}


</style>
</head>
<body>

<a href="operator.jsp" target="_blank"> Add another Entry</a>
<a href="logout.jsp" target="_blank"> Logout</a> 

</body>

