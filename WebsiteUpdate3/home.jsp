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
				<li><a href="home.jsp" class="selected">HOME</a></li>
				<li><a href="customers.jsp">CUSTOMERS</a></li>
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
		<div class="content_top">
		    <div class="content_box">
			<font color="green">ACTIVE</font> TRANSACTIONS
			</div>
			<%
			 try {
	                connection = DriverManager.getConnection(url, dbuser, dbpass);
	            } catch (SQLException e) {
	                out.println("Connection Failed! Check output console.<br>");
	                e.printStackTrace();
	                return;
	            }
			String query = "SELECT TRANSACTIONID,CUSTOMER.FIRST_NAME,CUSTOMER.LAST_NAME FROM TRANSACTION,CUSTOMER WHERE OPEN=1 and TRANSACTION.CUSTOMERID like CUSTOMER.CUSTOMERID";
			
			Statement statement = null;
			
			try {
	              statement = connection.createStatement();

	              ResultSet rs = statement.executeQuery(query);

				  while(rs.next()) {
                          int TRANSID = rs.getInt("TRANSACTIONID");
                          String customerf = rs.getString("FIRST_NAME");
                          String customerl = rs.getString("LAST_NAME");
 
                          %>
                                                <div onclick = "location.href= 'transactions.jsp?TRANSID=<%=customerl%>';" style = 'cursor:pointer' class="content_box" >
                                                <%=TRANSID %> : <%=customerf %> &nbsp <%= customerl %>
                                                </div>
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
		    <div onclick = "location.href= 'login.jsp';" style = 'cursor:pointer' class="content_box" >
			BACK
			</div>
		</div>
		<div class="content_left">
	
		</div>
		<div class="content_right">

		</div>
	</div>
</div>

</body>

</html>