<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page session="true"
	import="java.util.*,java.sql.*,java.io.*,beans.Candy"
%>

<style type="text/css">

.spangreen { color: #007700;
			  font-weight: bold;}

.spanStrong {font-weight: bold;}

</style>


<script type="text/javascript">
function validateQuantity(id, oldQuantity) {
    var quantity = document.forms["shoppingForm"+id]["qty"].value;
    var inventory_quantity = document.forms["shoppingForm"+id]["inventory_quantity"].value;
    var missingString = "";   
    
  if (quantity === "" || quantity === null) {
       missingString += "Empty quantity amount! ";}
  else if (!validatePositive(quantity)) {
      missingString += "Incorrect input! ";}
  
if(parseInt(quantity) > parseInt(inventory_quantity)) {
	      missingString += "Quantity exceeds supply! ";
  }
  
if((parseInt(quantity)+parseInt(oldQuantity)) > parseInt(inventory_quantity)) {
    missingString += "Quantity exceeds supply! ";
}  
  
  if (missingString === "" || missingString === null){
       return true;} 
  else {
      alert("Errors: " + missingString);
	    return false;}
  //end alert
}//end validateNewUser

function validateNumber(num) {
    var re = /\d+/;
    return re.test(num);
    }
    //end validate email, credit to StackOverflow

function validatePositive(test) {
   	if(validateNumber(test)){
   		if(parseInt(test) > -1)
    		return true;
   		}
   	return false;
    }
</script>


<%!
Connection con = null;
String url = "jdbc:mysql://localhost:3306/";
String dbName = "project_3";
String dbDriver = "com.mysql.jdbc.Driver";
String dbUser = "Nick";
String dbPass = "ne9346915";
String username = "";
String userpass = "";
String strQuery = "";
String value_return;
String photo_directory;
int product_id;
String name;
String description;
double price;
int quantity;
Statement st = null;
ResultSet rs = null;
int count=0;
int formID=0;
int oldQuantity=0;
String inventory_id;
%>

	<table cellpadding="2">
		
		<%
		//builds sql connect, and prints out products as long as inventory id matches.
		try {
			System.out.println("Trying to connect to db.");
            con = DriverManager.getConnection(url+dbName, dbUser, dbPass);
            st = con.createStatement();
            rs = st.executeQuery("SELECT p.product_id, p.name, p.description, p.price, p.photo_directory, p.inventory_id, i.quantity FROM tbl_products p, tbl_inventory i WHERE p.product_id = i.product_id");
			
            //prints out each row of data obtained
            while (rs.next()) {
            	//checks quantity isn't zero
            	quantity=rs.getInt("quantity");
            	if(quantity > 0){
            		
            		//builds table rows and columns
	  				if(count == 0)
	  					out.write("<tr><td style='padding:15px'>");
	  				else 
	  					out.write("<td style='padding:15px'>");
	  				
	            	System.out.println("Trying to print sql statement.");
	            	photo_directory=rs.getString("photo_directory");
	            	product_id=rs.getInt("product_id");
	            	name=rs.getString("name");
	            	description=rs.getString("description");
	            	price=rs.getDouble("price");
	            	inventory_id=rs.getString("inventory_id");
	            	value_return=product_id+" | "+name+" | "+description+" | "+price+" | "+quantity+" | "+inventory_id; 		
	            	
	            	//Gets old quantity value if it exists
	            	if( session.getValue("shoppingcart") != null){
	            		Vector buylist = (Vector) session.getValue("shoppingcart");
						for (int i = 0; i < buylist.size(); i++) {
							Candy anOrder = (Candy) buylist.elementAt(i);
							if(anOrder.getProductID() != null && anOrder.getProductID() == product_id){
								if(anOrder.getQuantity() != 0 ){
									oldQuantity=anOrder.getQuantity();
									break;	
								} else 
									break;
							}
						}
	            	}
	                %>
                               	
					<span class = "spangreen"><%= product_id%>: <%=name%></span><br />
						<img src = "images/<%=photo_directory%>"/><br /><br />
						Description: <%=description%><br />
						Price: $<span class = "spanStrong"><%=rs.getString("price")%></span>&nbsp;&nbsp;&nbsp;&nbsp;Quantity in stock <%= quantity%><br />
					<form name="shoppingForm<%=formID %>" action="ShoppingServlet" method="post" onsubmit="return validateQuantity(<%=formID%>, <%=oldQuantity%>)">
						<input type="hidden" name="candy" value="<%=value_return %>" />
						<input type="hidden" name="inventory_quantity" value=<%=quantity %> />
						<b>Quantity: </b><input type="text" name="qty" SIZE="3" /> <input type="hidden" name="action" value="ADD" /> 
						<input type="submit" name="Submit" value="Add to Cart" />

					</form>
					<hr />
					
					
                    <%
                    //Logic counters, and resets oldQuantity for next form
                    formID++;
	                count++;
	                oldQuantity=0;
	              	//ends table rows and columns
	                if(count == 3){
	  					out.write("</td></tr>");
	                	count=0;
	                } else
	                	out.write("</td>");
                	
            	}//end of if statement 
            }

        } catch (SQLException ex) {
            System.out.println(ex);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (st != null) {
                    st.close();
                }
                if (con != null) {
                    con.close();
                }

            } catch (SQLException ex) {
                System.out.println(ex);
            }
        }	
		System.out.println("Done.");
		//resets counters 
		if(count < 3)
			out.write("</tr>");
		count=0;
		formID=0;
 %>
	</table>
	<br />
