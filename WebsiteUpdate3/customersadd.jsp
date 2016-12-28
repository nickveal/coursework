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
String customerid = request.getParameter("customer");
session.setAttribute("customerid", customerid);
String first = request.getParameter("first");
String last = request.getParameter("last");
%>

<div class="center">
	<div id="navbar">
		<img src="images/logo.png" />
		<div id="navbar_center">
			<ul>
				<li><a href="home.jsp">HOME</a></li>
				<li><a href="customers.jsp" class="selected">CUSTOMERS</a></li>
				<li><a href="transactions.jsp">TRANSACTIONS</a></li>
				<li><a href="cars.jsp">CARS</a></li>
				<li><a href="services.jsp">SERVICES</a></li>
			</ul>
		</div>
	</div>
	
	<br>
	<img src="images/home_main.png" class="home_main" />
	<br>
	<div class="content">
		<div class="login_text_box" style="width:500px; text-align:center; float:none; margin-left:auto; margin-right:auto">
			<font size="6">CUSTOMER</font><font size="6" style="font-weight:normal"> ADD</font>
		</div>
		<br>
		<form action="CustomerAdd" method="POST">
			<table style="float:left">
				<tr style="clear:both">
					<td>
						<div class="login_text_box" style="width:200px; text-align:center; margin-left:auto; margin-right:auto; float:none">
							First Name
						</div>
					</td>
					<td>
						<input name="first_name" style="top:0px; font-size:15px; width:400px;" class="login_input_box" value=""/>
					</td>
				</tr>
				<tr>
					<td>
						<div class="login_text_box" style="width:200px; text-align:center; margin-left:auto; margin-right:auto; float:none">
							Last Name
						</div>
					</td>
					<td>
						<input name="last_name" style="top:0px; font-size:15px; width:400px;" class="login_input_box" value=""/>
					</td>
				</tr>
				
				<tr>
					<td>
						<div class="login_text_box" style="width:200px; text-align:center; margin-left:auto; margin-right:auto; float:none">
							Email
						</div>
					</td>
					<td>
						<input name="email" style="top:0px; font-size:15px; width:400px;" class="login_input_box" value=""/>
					</td>
				</tr>			
				<tr>
					<td>
						<div class="login_text_box" style="width:200px; text-align:center; margin-left:auto; margin-right:auto; float:none">
							State
						</div>
					</td>
					<td>
						<input name="state" style="top:0px; font-size:15px; width:400px;" class="login_input_box" value=""/>
					</td>
				</tr>			
				<tr>
					<td>
						<div class="login_text_box" style="width:200px; text-align:center; margin-left:auto; margin-right:auto; float:none">
							ZIP
						</div>
					</td>
					<td>
						<input name="zip" style="top:0px; font-size:15px; width:400px;" class="login_input_box" value=""/>
					</td>
				</tr>
			</table><br><br><br>
			<button "type="submit" class="login_submit" style="width:120px; float:right; top:10px">
				SUBMIT
			</button><br><br><br>
		</form>
		<button "type="submit" class="login_submit" style="width:120px; float:right; top:10px">
			BACK
		</button>
	</div>
</div>

</body>

</html>