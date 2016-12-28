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
<title>OMG Candy!</title>
</head>
<body>
    <table width="33%" border="0" cellpadding="3" cellspacing="1" bgcolor="gray">
	<tr><td><strong>Account Details </strong></td></tr>
	<tr><td><strong><%=rs.getString("first_name")%> &nbsp; <%=rs.getString("last_name")%> </strong></td></tr>
	<tr><td><%=rs.getString("address")%> &#44;</td></tr>
	<tr><td><%=rs.getString("city")%> &#44; &nbsp; <%=rs.getString("state")%> &nbsp; <%=rs.getString("zip")%></td></tr>
	</table>
	
	<h4>Candy!</h4>
	<hr>
	<p>
	<center>
		<table border="2" cellpadding="0" width="100%" bgcolor="#FFFFFF">
			<tr>
				<td><b>Order ID</b></td>
				<td><b>NAME</b></td>
				<td><b>DESCRIPTION</b></td>
				<td><b>PRICE</b></td>
				<td><b>QUANTITY</b></td>
				<td></td>
			</tr>
			<!-- 
				 gets the session shoppingcart and passes the vector to buylist
				 the rest is printed out.
				 -->
			<%
				System.out.println("test1");
				rs = st.executeQuery("SELECT o.order_id, o.order_list, o.order_date FROM tbl_orders o WHERE o.account_id = "+account_id+" ORDER BY o.order_date DESC");
	 			while(rs.next()){
	 			StringTokenizer list = new StringTokenizer(rs.getString("order_list"), "|");
	 			System.out.println(list.countTokens());
	 			int count = 0;
	 			int tokenCount = list.countTokens()-1;
	 				
		 			while(count < tokenCount){
			 			StringTokenizer item = new StringTokenizer(list.nextToken(), ",");
			 			System.out.println(item.countTokens());
			 			String product_id=item.nextToken();//get rid of first token product id
			%>
			<tr>
				<td><b><%=rs.getString("order_id")%></b></td> <!-- id -->
				<td><b><%=item.nextToken()%></b></td> <!-- name -->
				<td><b><%=item.nextToken()%></b></td> <!-- desc -->
				<td><b><%=item.nextToken()%></b></td> <!-- price -->
				<td><b><%=item.nextToken()%></b></td> <!-- quantity -->
			</tr>
			<%
					count++;
					}
		 	%>  <tr><td>Order date: <%=rs.getString("order_date")%></td></tr><tr><td colspan="5">&nbsp;</td></tr>  <% 		
	 			}
				System.out.println("test2");
			%>
		</table>
		<p>
			<a href="CandyShop.jsp">Continue shopping!</a>
	</center>
	<% 
		st.close();
	%>
</body>
</html>