<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page session="true"
	import="beans.loginBean"
%>
<html>
<head>

  <style type="text/css">
  #Header {
	    padding:17px 0px 0px 20px;
	    background-color:#eee;}
  </style>
  
<title>OMG Candy! </title>

</head>
<body>
    <% 
	String username = (String)session.getAttribute("username"); 
	String account_id = (String)session.getAttribute("account_id"); 
	if(username != null && account_id != null)
		System.out.println("Got the username and account id on CandyShop page - ID: "+account_id+" User Name: "+username);
	%>
	<div id = "Header"><img src="images/logo_small.png" alt="Candy Emporium Logo">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class = "spanStrong">Logged as</span> <span class = "spangreen"><%= username%></span>&nbsp;&nbsp; <a href="Profile.jsp"><button name="Profile">Profile</button></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="Logout.jsp"><button name="Logout">Logout</button></a></div>

	<!-- Gets the catalog.jsp page and puts it into CandyShop -->
	<jsp:include page="Catalog.jsp" flush="true" />

	<!-- old code -->
	<!--  <center>
		<form name="shoppingForm" action="ShoppingServlet" method="POST">
			<b>Candy:</b> <select name=candy>
				<option>Jelly Beans | Mixed Flavor (32) | 14.00</option>
				<option>Jelly Beans | Mixed Flavor (52) | 24.00</option> 
				<option>Jelly Beans | Mixed Flavor (82) | 34.00</option>
				<option>Jelly Beans | Mixed Flavor (102) | 44.00</option>
				<option>Jelly Beans | Mixed Flavor (122) | 54.00</option>  
			</select> <b>Quantity: </b><input type="text" name="qty" SIZE="3" /> <input
				type="hidden" name="action" value="ADD"> <input
				type="submit" name="Submit" value="Add to Cart">
		</form>
	</center> -->

		<!-- Gets the Cart.jsp page and puts it into CandyShop -->
		
</body>
</html>