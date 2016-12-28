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
	try {
		connection = DriverManager.getConnection(url, dbuser, dbpass);
	} catch (SQLException e) {
		out.println("Connection Failed! Check output console.<br>");
		e.printStackTrace();
		return;
	}
%>

<div class="center">
	<div id="navbar">
		<img src="images/logo.png" />
		<div id="navbar_center">
			<ul>
				<li><a href="home.jsp">HOME</a></li>
				<li><a href="customers.jsp">CUSTOMERS</a></li>
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
		<div class="login_text_box" style="width:500px; text-align:center">
			<font size="6">CAR </font><font size="6" style="font-weight:normal">INFORMATION</font>
		</div>
		<br><br><br><br>
		<div class="login_text_box" style="width:auto; text-align:center; float:left">
			<font size="6">SEARCH </font><font size="6" style="font-weight:normal">by Last Name</font>
		</div>
		<form action="carssearch.jsp">
			<input name="lastname" style="top:5px;" class="login_input_box" value="<%if(request.getParameter("customer") != null) { out.println(request.getParameter("customer"));}%>"/>
			<button "type="submit" class="login_submit" style="width:auto; float:right; top:10px">
			SEARCH
			</button><br><br><br>
		</form>

		<table style="float:left">
			<tr style="clear:both">
				<td>
					<div class="login_text_box" style="width:auto; text-align:center; margin-left:auto; margin-right:auto; float:none">
						Last Name
					</div>
				</td>
				<td>
					<div class="login_text_box" style="width:auto; text-align:center; margin-left:auto; margin-right:auto; float:none">
						Make
					</div>
				</td>
				<td>
					<div class="login_text_box" style="width:auto; text-align:center; margin-left:auto; margin-right:auto; float:none">
						Model
					</div>
				</td>
				<td>
					<div class="login_text_box" style="width:auto; text-align:center; margin-left:auto; margin-right:auto; float:none">
						Year
					</div>
				</td>
				<td>
					<div class="login_text_box" style="width:auto; text-align:center; margin-left:auto; margin-right:auto; float:none">
						Color
					</div>
				</td>
				<td>
					<div class="login_text_box" style="width:auto; text-align:center; margin-left:auto; margin-right:auto; float:none">
						License
					</div>
				</td>
				<td>
					<div class="login_text_box" style="width:auto; text-align:center; margin-left:auto; margin-right:auto; float:none">
						State
					</div>
				</td>
				<td>
					<div class="login_text_box" style="width:auto; text-align:center; margin-left:auto; margin-right:auto; float:none">
						VIN
					</div>
				</td>
			</tr>
			<%
			Statement statement = null;

			try {
				  String query = "SELECT CUSTOMER.LAST_NAME,CAR.MAKE,CAR.MODEL,CAR.YEAR,CAR.COLOR,CAR.LICENSE,CAR.STATE,CAR.VIN FROM CUSTOMER,CAR WHERE CAR.CUSTOMERID like CUSTOMER.CUSTOMERID";
				  statement = connection.createStatement();
				  ResultSet rs = statement.executeQuery(query);
				  while(rs.next()) {
						  String last = rs.getString("LAST_NAME");
						  String make = rs.getString("MAKE");
						  String model = rs.getString("MODEL");
						  String year = rs.getString("YEAR");
						  String color = rs.getString("COLOR");
						  String license = rs.getString("LICENSE");
						  String state = rs.getString("STATE");
						  String vin = rs.getString("VIN");
						  %>
							<tr id="customer_table">
								<td class="customer_table_td">
									<%=last%>
								</td>
								<td class="customer_table_td">
									<%=make%>
								</td>
								<td class="customer_table_td">
									<%=model%>
								</td>
								<td class="customer_table_td">
									<%=year%>
								</td>
								<td class="customer_table_td">
									<%=color%>
								</td>
								<td class="customer_table_td">
									<%=license%>
								</td>
								<td class="customer_table_td">
									<%=state%>
								</td>
								<td class="customer_table_td">
									<%=vin%>
								</td>
								<td>
									<button type="button" class="login_submit" style="font-size:12px; width:auto;">
									<a href="carsselect.jsp?VIN=<%=vin%>">SELECT</a>
									</button>
								</td>
								<td>
									<button type="button" class="login_submit" style="font-size:12px; width:auto;">
									<a href="carsedit.jsp?VIN=<%=vin%>">EDIT</a>
									</button>
								</td>
								<td>
									<button type="button" class="login_submit" style="font-size:12px; width:auto;">
									<a href="carsremove.jsp?VIN=<%=vin%>">REMOVE</a>
									</button>
								</td>
							</tr>
						  <%
					}
			} catch (SQLException e) {
				System.out.println("Error with MySQL statement, ");
				System.out.println(e.getMessage() + "<br>");
			} finally {
				try {
					if(statement != null) {
						statement.close();
					}
				} catch (SQLException e) {
					System.out.println("Error closing statement.");
				}

				try {
					if(connection != null) {
						connection.close();
					}
				} catch (SQLException e) {
					System.out.println("Error closing statement.");
				}
			}
			%>
		</table>
	</div>
</div>

</body>

</html>