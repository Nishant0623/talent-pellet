<%-- 
    Document   : ask
    Created on : 23-Oct-2023, 7:28:14 pm
    Author     : HUDA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!String m="";%>
<%
    if(request.getParameter("submit")!=null)
    {
    m="Hello huda";
    
}
else
{
m="sad";
}
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%=m%>

                   <input type="submit" name="submit" value="submit" id="submit"> 
        

        
    </body>
</html>
