<%-- 
    Document   : reportesCe4
    Created on : 8 abr. 2023, 02:05:22
    Author     : Cesar15
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        rs = stmt.executeQuery("SELECT * FROM reporte WHERE estado='" + status + "' OR estado='" + status2 + "'");
    </body>
</html>
