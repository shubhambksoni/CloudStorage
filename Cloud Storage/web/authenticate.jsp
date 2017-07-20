<%-- 
    Document   : authenticate.jsp
    Created on : May 4, 2017, 3:34:30 AM
    Author     : RDRL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign in</title>
    </head>
    <body>
        <%
            String username=request.getParameter("username");
            String password=request.getParameter("password");
            if(username.length()<2 || username.length()>15 || password.length()<6 || password.length()>15){
                out.print("Please fill correct username and password");
                return;
            }
            Connection myCon=null;
            PreparedStatement statement=null;
            ResultSet rs=null;
            
            try{
            Class.forName("com.mysql.jdbc.Driver");
            myCon=DriverManager.getConnection("jdbc:mysql://localhost:3306/cloud_storage","root","");
            statement=myCon.prepareStatement("SELECT username, password FROM users WHERE username=? AND password=?");
            statement.setString(1, username);
            statement.setString(2, password);
            rs=statement.executeQuery();
            if(!rs.isBeforeFirst()){
                out.print("Incorrect Username or Password");
                return;
            }else{
                session.setAttribute("LOGIN_USER", "user");
                session.setAttribute("username",username);
                response.sendRedirect("welcome.jsp");
            }
            }catch(Exception e){
               out.print("Some error occurred, try again :(");
               out.print(e);
            }
        %>
    </body>
</html>
