<%-- 
    Document   : sign_in
    Created on : May 4, 2017, 3:01:58 AM
    Author     : RDRL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign in</title>
    </head>
    <body>
        <h2>Sign in</h2>
        <form method="GET" action="authenticate.jsp">
            <b>Username: </b><input type="text" name="username"><br/>
            <b>Password: </b><input type="password" name="password"></br>
            <button type="submit">Sign in</button>
        </form>
    </body>
</html>
