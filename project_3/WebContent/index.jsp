<%@ page language="java" contentType="text/html; charset=ISO-8859-1" session="false"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <style type="text/css">
          .spangreen { color: #007700;
		 	  font-weight: bold;}
	      .spanStrong {font-weight: bold;}
	    </style>
        
        <script language="javascript" type="text/javascript">
            function clearText(field){

                if (field.defaultValue == field.value) field.value = '';
                else if (field.value == '') field.value = field.defaultValue;

            }

        </script>
		<title>Login</title>
	</head>
	<body>
<div>
            <div >
                <img src="images/logo_small.png" alt="Smiley face">
                <hr/>
                <h3><span class = "spangreen">Sign In</span></h3>
                <form method=POST action=loginJsp.jsp>
                    <label><span class = "spanStrong">Username</span><br/>
                        <input type="text" class="inputtext" name="usrnm" value="Username"
                               onFocus="clearText(this)" onBlur="clearText(this)"/></label><br/>
                        <br/>
                        <label><span class = "spanStrong">Password</span><br/>
                        <input type="password" class="inputtext" name="pwd" value="Password"
                               onFocus="clearText(this)" onBlur="clearText(this)"/></label><br/>
                        <br/>
                    <input type="submit" value="Login"/>
                </form>
            </div><!--end of admin login div-->
            </br>
            <h3><span class = "spangreen">If you do not have an account</span></h3>
        <a href="registration.jsp"><button name="register">Register</button></a>
        </div>
	</body>
</html>