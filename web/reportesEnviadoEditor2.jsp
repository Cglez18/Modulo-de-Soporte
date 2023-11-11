<%@ page import= "java.sql.*" %>
<%@ page import= "java.io.*" %>
<%@ page import= "java.util.*" %>
<%@ page import= "java.text.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html Lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="regresarAdmin.js"></script>
    </head>
    <body>
    
    <%
    String id2 = request.getParameter("idRe");

    String preg2 = request.getParameter("descripR");
    String resp2 = request.getParameter("solu");
    String status2 = "FCerrado";
    
    
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    try{
         Class.forName("com.mysql.jdbc.Driver").newInstance();
                conn = DriverManager.getConnection("jdbc:mysql://localhost/proy?user=root&password=n0m3l0");
                stmt = conn.createStatement();
    }catch(SQLException error){
       out.print(error.toString());
    }
    
    try {
    String query = "INSERT INTO faqs(question, answer, estado) VALUES ('" + preg2 + "', '" + resp2 + "', '" + status2 + "')";
    PreparedStatement pstmt = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
    pstmt.executeUpdate();

   
    /*ResultSet generatedKeys = pstmt.getGeneratedKeys();
    int id = 0;
    if (generatedKeys.next()) {
        id = generatedKeys.getInt(1);
    }*/

    if (preg2 != null && resp2 != null) {
        stmt.executeUpdate("UPDATE reporte SET estado='"+status2+"' WHERE id_reporte='"+id2+"'");
    }

    out.println("<script>alert('Cambios realizados con éxito.')</script>");
    response.sendRedirect("reportesCe3.jsp");
} catch(Exception error) {
    out.print(error.toString());
}
%>
    </body>
</html>