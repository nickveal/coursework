<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page session="true"
	import="java.util.*,beans.Candy, beans.loginBean"%>
<%
//proof of concept for session passing from adminServlet into the rest of the jsp pages 
String username = (String)session.getAttribute("username"); 
String account_id = (String)session.getAttribute("account_id"); 
if(username != null && account_id != null)
	System.out.println("Got the username and account id on Cart page - ID: "+account_id+" User Name: "+username);


//gets buylist session and checks for not null or size greater than 0
Vector buylist = (Vector) session.getValue("shoppingcart");
if (buylist != null && (buylist.size() > 0)) {
%>
<html>
<head>
<style type="text/css">

table {  background-color: #808080;}

.headercell { background-color: #b5b5b5;
              color: #007700;
              font-weight: bold;}

.borderless {border-width:0px;
              background-color: #e0e0e0;}

#Header {
	    padding:17px 0px 0px 20px;
	    background-color:#eee;}

</style>
<title>OMG Candy!</title>

</head>
<body>
	<div id = "Header"><img src="images/logo_small.png" alt="Candy Emporium Logo"></div>
<center>
  <a href="CandyShop.jsp">Continue shopping!</a>
  <table border="1" cellpadding="2">
		<tr>
			<td class = "headercell">Name</td>
			<td class = "headercell">Description</td>
			<td class = "headercell">Price</td>
			<td class = "headercell">Quantity</td>
			<td class = "headercell">Delete?</td>
		</tr>
		<%
if( session.getValue("shoppingcart") != null){
 	for (int index=0; index < buylist.size();index++) {
    	Candy anOrder = (Candy) buylist.elementAt(index);
 %>
		<tr>
			<td class = "borderless"><b><%= anOrder.getName() %></b></td>
			<td class = "borderless"><b><%= anOrder.getDescription()%></b></td>
			<td class = "borderless"><b><%= anOrder.getPrice() %></b></td>
			<td class = "borderless"><b><%= anOrder.getQuantity() %></b></td>
			<td>
				<form name="deleteForm" action="ShoppingServlet" method="POST">
					<input type="submit" value="Delete"> <input type="hidden"
						name="delindex" value='<%= index %>'> <input type="hidden"
						name="action" value="DELETE">
				</form>
			</td>
		</tr>
		<% } %>
	</table>
	<p>
	<form name="checkoutForm" action="ShoppingServlet" method="POST">
		<input type="hidden" name="action" value="CHECKOUT"> <input
			type="submit" name="Checkout" value="Checkout">
	</form>
</center>
<% } 
}
%>