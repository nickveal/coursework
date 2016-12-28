<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page session="true"
	import="java.util.*,java.sql.*,java.io.*"
%>

<html>
<head>
<title>AutoRepair - Point of Sale</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>

<body>

<%!
String host = "localhost";
String database = "autorepair";
String url = "jdbc:mysql://" + host + "/" + database;

String dbuser = "default";
String dbpass = "autorepair";
Connection connection = null;

%>

<%
String vin = request.getParameter("VIN");
session.setAttribute("VIN", vin);
%>

<div class="center">
	<div id="navbar">
		<img src="images/logo.png" />
		<div id="navbar_center">
			<ul>
				<li><a href="home.jsp">HOME</a></li>
				<li><a href="customers.jsp" >CUSTOMERS</a></li>
				<li><a href="transactions.jsp">TRANSACTIONS</a></li>
				<li><a href="cars.jsp" class="selected">CARS</a></li>
				<li><a href="services.jsp">SERVICES</a></li>
			</ul>
		</div>
	</div>
	
	<br>
	<img src="images/home_main.png" class="home_main" />
	<br>
	<div class="content">
		<div class="login_text_box" style="width:500px; text-align:center; float:none; margin-left:auto; margin-right:auto">
			<font size="6">CAR</font><font size="6" style="font-weight:normal"> DELETE</font>
		</div><br><br>
		<div class="login_text_box" style="width:300px; text-align:center; float:none; margin-left:auto; margin-right:auto">
			<font size="3">Are you sure you want to delete this entry?</font><br>
			CAR VIN#<%=request.getParameter("VIN")%>
		</div>
		<br>
		<form action="CarRemove" style="top:10px; margin-left:auto; margin-right:auto; float:none; text-align:center" method="post">
			<button "type="submit" class="login_submit" style="top:10px; margin-left:auto; margin-right:auto; float:none; text-align:center">
			<font color="red">YES</font>
			</button><br><br>
		</form>
		<form action="cars.jsp" style="top:10px; margin-left:auto; margin-right:auto; float:none; text-align:center">
			<button "type="submit" class="login_submit" style="top:10px; margin-left:auto; margin-right:auto; float:none; text-align:center">
			NO
			</button><br><br><br>
		</form>
	</div>
</div>

</body>

</html>