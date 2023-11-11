<%@ page import= "java.sql.*" %>
<%@ page import= "java.io.*" %>
<%@ page import= "java.util.*" %>
<%@ page import= "java.text.*" %>

<%!Statement stmt = null;%>
<%!ResultSet rs = null; %>
<%!Connection conn = null; %>
<%!String query = "SELECT reporte.*, cliente.nom_cliente FROM reporte JOIN cliente ON reporte.id_cliente = cliente.id_cliente"; %>
<%
    

    try {
        // Conexión a la base de datos
        Class.forName("com.mysql.jdbc.Driver").newInstance();
    conn = DriverManager.getConnection("jdbc:mysql://localhost/proy?user=root&password=n0m3l0");
    stmt = conn.createStatement();
    
    String iUs = "Asistente";
    int idC = Integer.parseInt(request.getParameter("id_cliente"));
    
    String nombreC = request.getParameter("nomC");
    String descR = request.getParameter("desR");
    
    // Obtención de la fecha y hora actual
        SimpleDateFormat formatoFechaHora = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        java.util.Date fechaHoraActual = new java.util.Date();
        String fechaHoraActualStr = formatoFechaHora.format(fechaHoraActual);
        //Estado y Solución
        String status = "Abierto";
        String sol = null;
   
    String nomcliente = null;
    ResultSet rs2 = stmt.executeQuery("SELECT nom_cliente FROM cliente WHERE id_cliente = " + idC);
    if (idC > 8) {
        out.println("<script>alert('Error: No existe cliente con ese id.')</script>");
        
    } 
    if (rs2.next()) {
        nomcliente = rs2.getString("nom_cliente");
    }
    
      
    stmt.executeUpdate("INSERT INTO reporte( id_user, id_cliente, cliente, descR, fecha_creacion, estado, solucion) VALUES ('" + iUs + "', '" + idC + "', '" + nomcliente + "', '" + descR + "', '" + fechaHoraActualStr + "', '" + status + "', '" + sol + "')");
    
    
    rs = stmt.executeQuery (query);
    
    out.println("<script>alert('Te has registrado correctamente.')</script>");
         response.sendRedirect("consultas20.jsp");
         
        
       
        
    } catch (Exception e) {
        out.println("<p>Error al crear el registro: " + e.getMessage() + "</p>");
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
