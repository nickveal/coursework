<%@ page language="java" contentType="text/html; charset=ISO-8859-1" session="true"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Insert title here</title>

        <title>Login stuff</title>
    </head>
    <body>
        <jsp:useBean id="login" scope="request" class="beans.loginBean" >
            <jsp:setProperty name="login" property="username" value = '<%=request.getParameter(\"username\")%>'/>
            <jsp:setProperty name="login" property="password" value = '<%=request.getParameter(\"password\")%>' />
        </jsp:useBean>
        <jsp:forward page="/userCheck">
            <jsp:param name="username" value="<%=login.getUsername()%>" />
            <jsp:param name="password" value="<%=login.getPassword()%>" />
        </jsp:forward>
        <%--<h1>Hello, <jsp:getProperty name="login" property="usrnm" />!</h1>--%>
    </body>
</html>