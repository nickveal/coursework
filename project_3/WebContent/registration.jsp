<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration Page</title>

<style type="text/css">
body {
  text-align: center;
  font-family: Arial,Helvetica,sans-serif;
  background-color: white;
  color: black;
}

.spangreen { color: #007700;
			  font-weight: bold;}

.spanStrong {font-weight: bold;}

</style>

<script>
function validateNewUser(register) {
      var user = document.register.username.value;
      var pass1 = document.register.password1.value;
	  var pass2 = document.register.password2.value;
	  var fname = document.register.fname.value;
	  var lname = document.register.lname.value;
	  var email = document.register.email.value;
	  var address = document.register.address.value;
	  var city = document.register.city.value;
	  var state = document.register.state.value;
      var zip = document.register.zip.value;

      var missingString = "";

      
    if (user === "" || user === null) {
         missingString += "Missing username, ";}
    
    if (pass1 === "" || pass1 === null) {
         missingString += "Missing password, ";}
    
	if (pass2 === "" || pass2 === null) {
         missingString += "Missing re-entered Password, ";}
	
	if (!(pass1 === pass2)) {
         missingString += "Passwords do not match, ";}
	
	
	if (fname === "" || fname === null) {
         missingString += "Missing first Name, ";}
	
	if (lname === "" || lname === null) {
         missingString += "Missing last Name, ";}
	
	if (email === "" || email === null) {
         missingString += "Missing email, ";}
	
	if (address === "" || address === null) {
        missingString += "Missing Address, ";}
	
	if (city === "" || city === null) {
        missingString += "Missing City, ";}
	
	if (state === "" || state === null) {
        missingString += "Missing state, ";}
	
	if (zip === "" || zip === null) {
        missingString += "Missing Zip Code, ";}
	
	if (!(validateEmail(email))){
      missingString += "Invalid email format, ";}
	
	if (!(validateState(state))){
	      missingString += "Invalid state format, ";}
	
	if (!(validateZip(zip))){
	      missingString += "Invalid Zip Code format, ";}
	
    if (missingString === "" || missingString === null){
         return true;} 
    else {
        alert("Errors: " + missingString);
	    return false;}
        
    //end alert
}//end validateNewUser

function validateEmail(email) {
    var re = /\S+@\S+\.\S+/;
    return re.test(email);}
    
function validateState(state) {
    var re = /^[A-Za-z]{2}$/;
    return re.test(state);}
    
function validateZip(zip) {
    var re =/^[0-9]{5}$/;
    return re.test(zip);}
    //end validate email, credit to StackOverflow

</script>


</head>
<body>

<table width="500" border="0" align="center" cellpadding="0" cellspacing="0">
<tr><td align = "left"><img src="images/logo_small.png" alt="logo"></td><td>&nbsp;</td><td>&nbsp;</td></tr>
</table>

<table width="500" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
<tr><form name="register" action="registerUser" onsubmit="return validateNewUser(register)" method="POST">
<td><table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF">
<tr><td colspan="3"><font size="4" color="red"><?php echo "$registrationError"; ?></font></td></tr>
<tr><td colspan="3"><span class = "spangreen">New User Registration</span></td></tr>
<tr><td width="500"><span class = "spanStrong">Username</span></td><td width="6">:</td><td width="600"><input name="username" type="text" id="username" size="40"></td></tr>
<tr><td width="500"><span class = "spanStrong">Enter Password</span></td><td>:</td><td><input name="password1" type="password" id="password1"size="40"></td></tr>
<tr><td width="500"><span class = "spanStrong">Re-enter Password</span></td><td>:</td><td><input name="password2" type="password" id="password2"size="40"></td></tr>
<tr><td width="500"><span class = "spanStrong">First Name</span></td><td width="6">:</td><td width="600"><input name="fname" type="text" id="fname"size="40"></td></tr>
<tr><td width="500"><span class = "spanStrong">Last Name</span></td><td width="6">:</td><td width="600"><input name="lname" type="text" id="lname"size="40"></td></tr>
<tr><td width="500"><span class = "spanStrong">Email Address</span></td><td width="6">:</td><td width="600"><input name="email" type="text" id="email"size="40"></td></tr>
<tr><td colspan="3"><span class = "spangreen">Address Details</span></td></tr>
<tr><td width="500"><span class = "spanStrong">Home Address</span></td><td width="6">:</td><td width="600"><input name="address" type="text" id="address"size="40"></td></tr>
<tr><td width="500"><span class = "spanStrong">City</span></td><td width="6">:</td><td width="600"><input name="city" type="text" id="city"size="40"></td></tr>
<tr><td width="500"><span class = "spanStrong">State Example-GA</span></td><td width="6">:</td><td width="600"><input name="state" type="text" id="state"size="40"></td></tr>
<tr><td width="500"><span class = "spanStrong">Zip Code Example-30022</span></td><td width="6">:</td><td width="600"><input name="zip" type="text" id="zip"size="40"></td></tr>
<tr><td>&nbsp;</td><td>&nbsp;</td><td><input type="submit" name="Submit" value="Register"></td></tr>
</table></td></form></tr></table>
<center><br/><a href = "index.jsp"><button name="Home">Back To Main</button></a></center><br/>

</body>
</html>