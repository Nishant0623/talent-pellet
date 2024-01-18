<%-- 
    Document   : image.jsp
    Created on : 16-Nov-2023, 5:59:20 pm
    Author     : HUDA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="http://localhost:8088/WebApplication2/imageServlet" method="post" enctype="multipart/form-data">
            <input type="text" name="t">
            <input type="file" name="file">
            <input type="submit" value="save" name="submit">
        </form>
    </body>
</html>
