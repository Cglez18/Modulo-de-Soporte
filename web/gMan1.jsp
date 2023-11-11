<%@ page import= "java.sql.*" %>
<%@ page import= "java.io.*" %>
<%@ page import= "java.util.*" %>
<%@ page import= "java.text.*" %>

<%
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    
    String idR3 = request.getParameter("idRe");
    String idAs2 = "GerenteMantenimiento";
    String idC2 = request.getParameter("idClien");
    
    String nomC2 = request.getParameter("nClien");
    String descR2 = request.getParameter("descripR");
    String status3 = "En Programacion";
    String sol2 = null;
    
    String ing2 = request.getParameter("inge");

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
        stmt.executeUpdate("update reporte set id_user='"+idAs2+"', id_cliente='"+idC2+"', cliente='"+nomC2+"', descR='"+descR2+"',fecha_creacion='"+fechaHoraActualStr+"', estado='"+status3+"', ingA='"+ing2+"', solucion='"+sol2+"' where id_reporte='"+idR3+"';");
        
   
        out.println("<script>alert('Cambios realizados con éxito.')</script>");
         response.sendRedirect("gManJunto.jsp");
    }catch(Exception error){
       out.print(error.toString());
    } finally {
        // Cierre de los objetos de conexión a la base de datos
        try {
            if (rs != null) {
                rs.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException sqle) {
            out.println("<p>Error al cerrar los objetos de conexión a la base de datos: " + sqle.getMessage() + "</p>");
        }
    }
%>
    </body>
</html>