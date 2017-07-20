<%-- 
    Document   : create_user
    Created on : May 3, 2017, 3:59:06 PM
    Author     : RDRL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up</title>
    </head>
    <body>
        <%
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        String email=request.getParameter("email");
        if(username.length()<2||username.length()>15 || password.length()<6||password.length()>15 || email.length()<5||email.length()>30){
            out.print("Username must be between 2 to 15 characters long, Password must be between 6 to 15 characters long, E-mail must be between 5 to 30 characters long");
            return;
        }
        Connection myCon=null;
        PreparedStatement statement=null;
        ResultSet rs=null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            myCon=DriverManager.getConnection("jdbc:mysql://localhost:3306/cloud_storage","root","");
            statement=myCon.prepareStatement("INSERT INTO users(username,password,email_id,cur_size) VALUES (?,?,?,0);");
            
            statement.setString(1,username);
            statement.setString(2,password);
            statement.setString(3,email);
            
            statement.execute();
            myCon.close();
            File dir=new File("D:/cloud/"+username);
            boolean success=dir.mkdir();
            if(!success)throw new Exception();
            out.print("Signed up successfully");
            response.sendRedirect("welcome.jsp");
        }catch(Exception e){
            out.print("Some error occurred, try again :(");
            out.print(e);
        }
        
        %>
        
    </body>
</html>
