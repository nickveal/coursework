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
String serviceid = request.getParameter("serviceid");
String vin = request.getParameter("VIN");
String servicename = request.getParameter("servicename");
String price = request.getParameter("price");
session.setAttribute("serviceid", serviceid);
%>

<div class="center">
	<div id="navbar">
		<img src="images/logo.png" />
		<div id="navbar_center">
			<ul>
				<li><a href="home.jsp">HOME</a></li>
				<li><a href="customers.jsp">CUSTOMERS</a></li>
				<li><a href="transactions.jsp">TRANSACTIONS</a></li>
				<li><a href="cars.jsp">CARS</a></li>
				<li><a href="services.jsp" class="selected">SERVICES</a></li>
			</ul>
		</div>
	</div>
	
	<br>
	<img src="images/home_main.png" class="home_main" />
	<br>
	<div class="content">
		<div class="login_text_box" style="width:500px; text-align:center; float:none; margin-left:auto; margin-right:auto">
			<font size="6">SERVICE</font><font size="6" style="font-weight:normal"> EDIT</font>
		</div>
		<div class="login_text_box" style="width:auto; text-align:center; float:none; margin-left:auto; margin-right:auto">
			<font size="3" style="font-weight:normal">Service ID: </font>
			<font size="3"><%=request.getParameter("serviceid")%></font>
		</div>
		<br>
		<form action="ServiceEdit" method="POST">
			<table style="float:left">
				<tr style="clear:both">
					<td>
						<div class="login_text_box" style="width:200px; text-align:center; margin-left:auto; margin-right:auto; float:none">
							Service Name
						</div>
					</td>
					<td>
						<input name="servicename" style="top:0px; font-size:15px; width:400px;" class="login_input_box" value="<%=servicename%>"/>
					</td>
				</tr>
				<tr>
					<td>
						<div class="login_text_box" style="width:200px; text-align:center; margin-left:auto; margin-right:auto; float:none">
							Price
						</div>
					</td>
					<td>
						<input name="price" style="top:0px; font-size:15px; width:400px;" class="login_input_box" value="<%=price%>"/>
					</td>
				</tr>
				
				<tr>
					<td>
						<div class="login_text_box" style="width:200px; text-align:center; margin-left:auto; margin-right:auto; float:none">
							Completed
						</div>
					</td>
					<td>
						<select name="completed" style="top:0px; font-size:15px; width:410px" class="login_input_box" >
							<option value="1">YES</option>
							<option value="0">NO</option>
						</select>
					</td>
				</tr>						
				<tr>
					<td>
						<div class="login_text_box" style="width:200px; text-align:center; margin-left:auto; margin-right:auto; float:none">
							VIN
						</div>
					</td>
					<td>
						<input name="VIN" style="top:0px; font-size:15px; width:400px;" class="login_input_box" value="<%=vin%>"/>
					</td>
				</tr>
			</table><br><br><br><br><br>
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