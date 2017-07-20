<%-- 
    Document   : index
    Created on : May 3, 2017, 3:10:29 PM
    Author     : RDRL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign up</title>
    </head>
    <body>
        <h2>Fill the form to sign up: (or <a href="sign_in.jsp">Sign in</a>) </h2>
        <form method="POST" action="create_user.jsp">
            <b>Username: </b><input type="text" name="username"><br/>
            <b>Password: </b><input type="password" name="password"><br/>
            <b>E-mail address: </b><input type="text" name="email"><br/>
            <button type="submit">submit</button>
        </form>
    </body>
</html>
