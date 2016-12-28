<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page session="true"
	import="java.util.*,java.sql.*,beans.Candy, beans.loginBean"%>
		<% 
	String username = (String)session.getAttribute("username"); 
	String account_id = (String)session.getAttribute("account_id"); 
	System.out.println("testing username account_id "+username+" "+account_id);
	String order_id;
	Connection con = null;
	String url = "jdbc:mysql://localhost:3306/";
	String dbName = "project_3";
	String dbDriver = "com.mysql.jdbc.Driver";
	String dbUser = "Nick";
	String dbPass = "ne9346915";
	Statement st = null;
	ResultSet rs = null;
	String product_list="";
	int quantity;
	 con = DriverManager.getConnection(url+dbName, dbUser, dbPass);
     st = con.createStatement();
     rs = st.executeQuery("SELECT i.first_name,i.last_name,p.address,p.city,p.state,p.zip FROM tbl_addresses p,tbl_users i where i.account_id = '"+ account_id + "' AND p.user_id = i.user_id");
	 rs.next();
	%>
	
	
<html>

<head>
  <style type="text/css">
    .grayback {
    background-color:grey;
    color: #007700;}
    .redcolor { color:red;}
  </style>
  
<title>Candy Emporium Checkout Page</title>
</head>
<body>
    <table width="33%" border="0" cellpadding="3" cellspacing="1">
	<tr><td class = "grayback"><strong>Account Details </strong></td></tr>
	<tr><td><strong><%=rs.getString("first_name")%>&nbsp;<%=rs.getString("last_name")%> </strong></td></tr>
	<tr><td><%=rs.getString("address")%></td></tr>
	<tr><td><%=rs.getString("city")%>&#44; <%=rs.getString("state")%> <%=rs.getString("zip")%></td></tr>
	</table>
	
	<img src="images/logo_small.png" alt="logo">
	<hr>
	<p>
	<center>
		<table border="0" cellpadding="0" width="100%" bgcolor="#FFFFFF">
			<tr>
				<td class = "grayback"><b>NAME</b></td>
				<td class = "grayback"><b>DESCRIPTION</b></td>
				<td class = "grayback"><b>PRICE</b></td>
				<td class = "grayback"><b>QUANTITY</b></td>
				<td></td>
			</tr>
			<!-- 
				 gets the session shoppingcart and passes the vector to buylist
				 the rest is printed out.
				 -->
			<%
				System.out.println("test1");
				Vector buylist = (Vector) session.getValue("shoppingcart");
				String amount = (String) request.getAttribute("amount");
				for (int i = 0; i < buylist.size(); i++) {
					Candy anOrder = (Candy) buylist.elementAt(i);
			%>
			<tr>
				<td><%=anOrder.getName()%></td>
				<td><%=anOrder.getDescription()%></td>
				<td><%=anOrder.getPrice()%></td>
				<td><%=anOrder.getQuantity()%></td>
			</tr>
			<%
					rs = st.executeQuery("SELECT i.quantity FROM tbl_inventory i where i.product_id = "+ anOrder.getProductID());
			 		rs.next();
			 		quantity=rs.getInt("quantity");
					product_list+=(anOrder.getProductID()+", "+anOrder.getName()+", "+anOrder.getDescription()+", "+anOrder.getPrice()+", "+anOrder.getQuantity()+" | ");
					st.executeUpdate("UPDATE project_3.tbl_inventory i SET i.quantity = "+(quantity-anOrder.getQuantity())+" WHERE i.product_id = "+anOrder.getProductID());
				}
				System.out.println("test2");
				session.removeAttribute("shoppingcart");
			%>
			<tr>
				<td></td>
				<td></td>
				<td>TOTAL:</td>
				<td class = "redcolor"><b>$<%=amount%></b></td>
				<td></td>
			</tr>
		</table>
		<p>
			<a href="CandyShop.jsp">Continue shopping!</a>
	</center>
	<% 
	System.out.println("test3");
		st.executeUpdate("INSERT INTO project_3.tbl_orders(order_id,account_id,order_date,total_cost,order_list) VALUES(NULL, '"+account_id+"', DEFAULT, '"+amount+"','"+product_list+"')");
		st.close();
	%>
</body>
</html>