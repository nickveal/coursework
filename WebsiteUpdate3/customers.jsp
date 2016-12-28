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
		<div class="login_text_box" style="width:500px; text-align:center">
			<font size="6">CUSTOMER </font><font size="6" style="font-weight:normal">INFORMATION</font>
		</div>
		<div class="login_text_box" style="width:100px; text-align:center; float:right">
			<font size="6"><a href="customersadd.jsp" style="color:white;text-decoration:none">ADD</a></font>
		</div>
		<br><br><br><br>
		<div class="login_text_box" style="width:auto; text-align:center; float:left">
			<font size="6">SEARCH </font><font size="6" style="font-weight:normal">by Last Name</font>
		</div>
		<form action="customerselect.jsp">
			<input name="customer" style="top:5px;" class="login_input_box" value="<%if(request.getParameter("customer") != null) { out.println(request.getParameter("customer"));}%>"/>
			<button "type="submit" class="login_submit" style="width:auto; float:right; top:10px">
			SELECT
			</button><br><br><br>
		</form>

		<table style="float:left">
			<tr style="clear:both">
				<td>
					<div class="login_text_box" style="width:100px; text-align:center; margin-left:auto; margin-right:auto; float:none">
						First Name
					</div>
				</td>
				<td>
					<div class="login_text_box" style="width:100px; text-align:center; margin-left:auto; margin-right:auto; float:none">
						Last Name
					</div>
				</td>
				<td>
					<div class="login_text_box" style="width:100px; text-align:center; margin-left:auto; margin-right:auto; float:none">
						Email
					</div>
				</td>
				<td>
					<div class="login_text_box" style="width:100px; text-align:center; margin-left:auto; margin-right:auto; float:none">
						State
					</div>
				</td>
				<td>
					<div class="login_text_box" style="width:100px; text-align:center; margin-left:auto; margin-right:auto; float:none">
						ZIP
					</div>
				</td>
			</tr>
			<%
			try {
				connection = DriverManager.getConnection(url, dbuser, dbpass);
			} catch (SQLException e) {
				out.println("Connection Failed! Check output console.<br>");
				e.printStackTrace();
				return;
			}
			
			String query = "SELECT * FROM CUSTOMER";
			Statement statement = null;
			
			try {
	              statement = connection.createStatement();

	              ResultSet rs = statement.executeQuery(query);

				  while(rs.next()) {
						  String customerid = rs.getString("CUSTOMERID");
                          String first = rs.getString("FIRST_NAME");
                          String last = rs.getString("LAST_NAME");
						  String email = rs.getString("EMAIL");
						  String state = rs.getString("STATE");
						  String zip = rs.getString("ZIP_CODE");
 
                          %>
							<tr id="customer_table">
								<td class="customer_table_td">
									<%=first%>
								</td>
								<td class="customer_table_td">
									<%=last%>
								</td>
								<td class="customer_table_td">
									<%=email%>
								</td class="customer_table_td">
								<td class="customer_table_td">
									<%=state%>
								</td>
								<td class="customer_table_td">
									<%=zip%>
								</td>
								<td>
									<button type="button" class="login_submit" style="font-size:12px; width:auto;">
									<a href="customerselect.jsp?customer=<%=last%>">SELECT</a>
									</button>
								</td>
								<td>
									<button type="button" class="login_submit" style="font-size:12px; width:auto;">
									<a href="customeredit.jsp?customer=<%=customerid%>&first=<%=first%>&last=<%=last%>">EDIT</a>
									</button>
								</td>
								<td>
									<button type="button" class="login_submit" style="font-size:12px; width:auto;">
									<a href="customerremove.jsp?customer=<%=customerid%>">REMOVE</a>
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
		
		<!-- SELECT ADD EDIT buttons 
		<br><br><br><br><br>
		<div class="login_text_box" style="width:100px; text-align:center; float:right">
			SELECT
		</div><br><br>
		
		<div class="login_text_box" style="width:100px; text-align:center; float:right">
			EDIT
		</div><br><br>
		
		<div class="login_text_box" style="width:100px; text-align:center; float:right">
			REMOVE
		</div><br>
		
		-->
		
	</div>
</div>

</body>

</html>