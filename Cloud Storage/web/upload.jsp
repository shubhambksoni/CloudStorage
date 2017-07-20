<%-- 
    Document   : upload
    Created on : May 5, 2017, 1:52:40 AM
    Author     : RDRL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Upload Files</title>
    </head>
    <body>
        <h2>Select file</h2>
        <form name="uploadForm" method="POST" action="upload_handler.jsp" enctype="multipart/form-data">
            <input type="file" name="file" value="" width="100"/>
            <br/><br/>
            <button type="submit" value="Submit" name="submit">Upload</button>
        </form>
    </body>
</html>
