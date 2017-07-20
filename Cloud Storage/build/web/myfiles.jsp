<%-- 
    Document   : myfiles
    Created on : May 11, 2017, 10:24:14 AM
    Author     : RDRL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.io.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My files</title>
    </head>
    <body>
        <h2>My files</h2>
        <%
            String path="D:/cloud/"+session.getAttribute("username");
            File file=new File(path);
            String[] listOfFiles=file.list();
            if(listOfFiles.length==0){
                out.print("You have no uploaded files");
                return;
            }
            out.print("<table>");
            out.print("<th width=\"400\" align=\"left\">Filename</th>");
            out.print("<th width=\"400\" align=\"left\">Download Link</th>");
            for(int i=0;i<listOfFiles.length;i++){
                out.print("<tr>");
                out.print("<td width=\"400\">"+listOfFiles[i]+"</td>");
                out.print("<td width=\"400\">"+"<form method=\"GET\" action=\"download.jsp\"><input type=\"hidden\" name=\"file\" value=\""+listOfFiles[i]+"\">"
                       +"<button type=\"submit\">download</button>"
                        + "</form>"+"</td>");
                out.print("</tr>");
            }
            out.print("</table>");
        %>
    </body>
</html>
