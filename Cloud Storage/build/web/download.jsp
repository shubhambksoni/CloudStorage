<%-- 
    Document   : download
    Created on : May 11, 2017, 11:44:40 AM
    Author     : RDRL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.io.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Download</title>
    </head>
    <body>
        <p>downloading</p>
        <%
            String path="D:/cloud/"+session.getAttribute("username").toString()+"/"+request.getParameter("file").toString();
            
            response.setContentType("APPLICATION/OCTET-STREAM");
            response.setHeader("Content-Disposition","attachment;filename="+request.getParameter("file").toString());
            FileInputStream in=new FileInputStream(path);
            
            int i;
            while((i=in.read())!=-1){
            out.write(i);
            }
            in.close();
            response.sendRedirect("myfiles.jsp");
        %>
    </body>
</html>
