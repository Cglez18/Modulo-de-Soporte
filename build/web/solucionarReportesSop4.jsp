<%@ page import= "java.sql.*" %>

<%! String idR2 = null; %>
<%! String idC = null; %>
<%! String idAs = "iSop2"; %>
<%! String nomC = null; %>
<%! String descR = null; %>
<%! String sol = null; %>

<%! Connection conn; %>
<%! Statement stmt; %>
<%! ResultSet rs = null;%>

<%! Connection conn2; %>
<%! Statement stmt2; %>
<%! ResultSet rs2 = null;%>
<%! Connection conn3; %>
<%! Statement stmt3; %>
<%! ResultSet rs3 = null;%>

<%! String status = "En proceso"; %>
<%! String status2 = "Solucionado"; %>
<%! String inge = "iSop2"; %>



<HTML>
<HEAD>
    <link rel="stylesheet" href="style3.css">
    <TITLE>BUSQUEDA </TITLE>
    <style>
      nav {
  background-color: #58B0D6;
  height: 60px;
  position: fixed;
  top: 0;
  left: 0;
  width: 100vw;
}

ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  display: flex;
  justify-content: space-between;
}

li {
  flex-grow: 1;
}

li a {
  display: block;
  color: black;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  transition: all 0.2s ease-in-out;
}

li a:hover {
  background-color: #53EBEB;
  font-size: 20px;
  padding-top: 10px;
}

li a.active {
  font-size: 20px;
  padding-top: 10px;
}

main {
  margin-left: 60px;
  /* Este valor debe ser igual al valor de height de nav */
}
        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            text-align: left;
            padding: 8px;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        input[type=submit] {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 8px 16px;
            text-decoration: none;
            margin: 4px 2px;
            cursor: pointer;
        }
    </style>
</HEAD>
<BODY>
    <nav>
  <ul>
    <li><a href="gerSop.jsp">Perfil del Gerente de Soporte</a></li>
    <li><a href="gMan0.html">Perfil del Gerente de Mantenimiento</a></li>
    <li><a href="iSop0.html">Perfil del Ingeniero de Soporte</a></li>
    <li><a href="gerSop.jsp" >Regresar</a></li>
  </ul>
</nav> 
    <%
        idR2 = request.getParameter("idRe");
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        conn = DriverManager.getConnection("jdbc:mysql://localhost/proy?user=root&password=n0m3l0");
        stmt = conn.createStatement();
        
        conn2 = DriverManager.getConnection("jdbc:mysql://localhost/proy?user=root&password=n0m3l0");
        stmt2 = conn2.createStatement();
        
        conn3 = DriverManager.getConnection("jdbc:mysql://localhost/proy?user=root&password=n0m3l0");
        stmt3 = conn3.createStatement();
        
            rs = stmt.executeQuery("SELECT * FROM reporte WHERE estado='" + status + "' AND ingA='" + inge + "'AND solucion='null'");
            rs2 = stmt2.executeQuery("SELECT * FROM reporte WHERE estado='" + status2 + "' AND ingA='" + inge + "'");
             rs3 = stmt3.executeQuery("SELECT * FROM reporte WHERE estado='" + status + "' AND ingA='" + inge + "'AND solucion!='null'");
            out.println("<br>");
    out.println("<br>");
    out.println("<h1>Bienvenido Ingeniero de Soporte2</h1>");
            out.println("<h2>Reportes en Proceso</h2>");
            out.println("<table>");
        out.println("<tr>");
        out.println("<th>Id reporte</th>");
        out.println("<th>Id usuario</th>");
        out.println("<th>Id cliente</th>");
        out.println("<th>Nombre cliente</th>");
        out.println("<th>Descripción reporte</th>");
        out.println("<th>Fecha de Creación</th>");
        out.println("<th>Estado</th>");
        out.println("<th>Solución</th>");
        out.println("<th></th>");
        out.println("</tr>");

        while (rs.next()) {
            String idR2 = rs.getString("id_reporte");
            String idAs = rs.getString("id_user");
            String idC = rs.getString("id_cliente");
            String nomC = rs.getString("cliente");
            String descR = rs.getString("descR");
            String fecha = rs.getString("fecha_creacion");
            String sol = rs.getString("solucion");
            
            out.println("<form action='altaReporteiSop2.jsp' method='post' name='subir2' onsubmit='return validateForm()'>");
            out.println("<tr>");
            out.println("<td><input type='text' name='idRe' value='" + idR2 + "' readonly=readonly></td>");
            
            out.println("<td><input type='text' name='idAsis' value='" + idAs + "' readonly=readonly></td>");
                
            out.println("<td><input type='text' name='idClien' value='" + idC + "' readonly=readonly></td>");
                
            out.println("<td><input type='text' name='nClien' value='" + nomC + "' readonly=readonly></td>");
                
            out.println("<td><input type='text' name='descripR' value='" + descR + "' readonly=readonly></td>");
            
            out.println("<td><input type='text' name=' ' value='" + fecha + "' readonly=readonly></td>");
            
            out.println("<td><input type='text' name=' ' value='" + status + "' readonly=readonly></td>");
                
                out.println("<td><input type='text' name='solu' value='" + sol + "' required></td>");
                out.println("<td><input type='submit' name='altaReporteiSop2.jsp' value='SUBIR'></td>");
  
                
            out.println("</tr>");
                
                out.println("</form>");
        }%>
        <script>  
function validateForm() {
  var soluValue = document.getElementsByName("solu")[0].value;
  if (soluValue === "null" || soluValue === '' || soluValue === null) {
    alert("El campo solución no puede estar vacío.");
    return false;
  }
  return true;
}</script>
<%
        while (rs3.next()) {
            String idR2 = rs3.getString("id_reporte");
            String idAs = rs3.getString("id_user");
            String idC = rs3.getString("id_cliente");
            String nomC = rs3.getString("cliente");
            String descR = rs3.getString("descR");
            String fecha = rs3.getString("fecha_creacion");
            String sol = rs3.getString("solucion");
            
            out.println("<form action='altaReporteiSop2.jsp' method='post' name='subir2'>");
            out.println("<tr>");
            out.println("<td><input type='text' name='idRe' value='" + idR2 + "' readonly=readonly></td>");
            
            out.println("<td><input type='text' name='idAsis' value='" + idAs + "' readonly=readonly></td>");
                
            out.println("<td><input type='text' name='idClien' value='" + idC + "' readonly=readonly></td>");
                
            out.println("<td><input type='text' name='nClien' value='" + nomC + "' readonly=readonly></td>");
                
            out.println("<td><input type='text' name='descripR' value='" + descR + "' readonly=readonly></td>");
            
            out.println("<td><input type='text' name=' ' value='" + fecha + "' readonly=readonly></td>");
            
            out.println("<td><input type='text' name=' ' value='" + status + "' readonly=readonly></td>");
                
            out.println("<td><input type='text' name='solu' value='" + sol + "' readonly=readonly></td>");
                
            out.println("<td><input type='submit' name='altaReporteiSop2.jsp' value='SUBIR'></td>");
            out.println("</tr>");
                
                out.println("</form>");
        }
        
        out.println("</table>");
        out.println("<h2>Reportes Solucionados</h2>");
            out.println("<table>");
        out.println("<tr>");
        out.println("<th>Id reporte</th>");
        out.println("<th>Id usuario</th>");
        out.println("<th>Id cliente</th>");
        out.println("<th>Nombre cliente</th>");
        out.println("<th>Descripción reporte</th>");
        out.println("<th>Fecha de Creación</th>");
        out.println("<th>Estado</th>");
        out.println("<th>Solución</th>");
        out.println("<th></th>");
        out.println("</tr>");

        while (rs2.next()) {
            String idR2 = rs2.getString("id_reporte");
            String idAs = rs2.getString("id_user");
            String idC = rs2.getString("id_cliente");
            String nomC = rs2.getString("cliente");
            String descR = rs2.getString("descR");
            String fecha = rs2.getString("fecha_creacion");
            String sol = rs2.getString("solucion");
            
            out.println("<form action='reportesCerradosiSop2.jsp' method='post' name='subir2'>");
            out.println("<tr>");
            out.println("<td><input type='text' name='idRe' value='" + idR2 + "' readonly=readonly></td>");
            
            out.println("<td><input type='text' name='idAsis' value='" + idAs + "' readonly=readonly></td>");
                
            out.println("<td><input type='text' name='idClien' value='" + idC + "' readonly=readonly></td>");
                
            out.println("<td><input type='text' name='nClien' value='" + nomC + "' readonly=readonly></td>");
                
            out.println("<td><input type='text' name='descripR' value='" + descR + "' readonly=readonly></td>");
            
            out.println("<td><input type='text' name=' ' value='" + fecha + "' readonly=readonly></td>");
            
            out.println("<td><input type='text' name=' ' value='" + status2 + "' readonly=readonly></td>");
                
            out.println("<td><input type='text' name='solu' value='" + sol + "' readonly=readonly></td>");
                
            out.println("<td><input type='submit' name='reportesCerradosiSop2.jsp' value='ENVIAR'></td>");
            out.println("</tr>");
                
                out.println("</form>");
        }
        out.println("</table>");
       
        

        //cerrar  la conexión
        try {
            conn.close();
            conn2.close();
        } catch (SQLException sqlEx) {
        };
    %>
    <br>
<button class="salir" onclick="location.href='gerSop.jsp'" >Regresar</button>
</BODY>

</HTML>