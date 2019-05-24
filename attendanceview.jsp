<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("userid");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "main";
String userid = "root";
String password = "";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<body>
<style> 

a:link, a:visited {
  background-color: white;
  color: black;
  border: 2px solid green;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  margin:50px;
  margin-left:20px;
}

a:hover, a:active {
  background-color: green;
  color: white;
}




body {
	margin: 0;
	background: linear-gradient(45deg, #49a09d, #5f2c82);
	font-family: sans-serif;
	font-weight: 100;
	color:white;
}

</style>

<h1> See Employee Information </h1>

<table id="customer" border="1">
<tbody id="myTable">
<tr>
<th>Id</th>
<th>first name</th>
<th>Day </th>
<th>Attendance </th>


</tr>

<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from attendance_info";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("id") %></td>
<td><%=resultSet.getString("first_name") %></td>
<td><%=resultSet.getString("day") %></td>
<td><%=resultSet.getString("attendance") %></td>
<%


}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>

</tr>

<p>Type something in the input field to search the table for your desired field</p>  
<input id="myInput" type="text" placeholder="Search..">
<br><br>

<tbody id="myTable">
</table>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>

<a href="logout.jsp" target="_blank"> Logout</a>


</body>
</html>