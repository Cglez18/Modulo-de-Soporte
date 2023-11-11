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
    String idR3 = request.getParameter("idRe");
    String idAs2 = request.getParameter("idAsis");
    String idC2 = request.getParameter("idClien");
    String nomC2 = request.getParameter("nClien");
    String descR2 = request.getParameter("descripR");
    String status2 = "Cerrado";
    String ing2 = "iSop";
    String sol2 = request.getParameter("solu");
    
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
    SimpleDateFormat formatoFechaHora = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        java.util.Date fechaHoraActual = new java.util.Date();
        String fechaHoraActualStr = formatoFechaHora.format(fechaHoraActual);
    try{
       stmt.executeUpdate("update reporte set id_user='"+idAs2+"', id_cliente='"+idC2+"', cliente='"+nomC2+"', descR='"+descR2+"',fecha_creacion='"+fechaHoraActualStr+"', estado='"+status2+"', ingA='"+ing2+"', solucion='"+sol2+"' where id_reporte='"+idR3+"';");
   
   
        out.println("<script>alert('Cambios realizados con éxito.')</script>");
        response.sendRedirect("solucionarReportesSop.jsp");
    }catch(Exception error){
       out.print(error.toString());
    }
%>
    </body>
</html>


