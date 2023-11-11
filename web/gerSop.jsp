<%@ page import= "java.sql.*" %>

<%! String idR2 = null; %>
<%! String idC = null; %>
<%! String idAs = null; %>
<%! String nomC = null; %>
<%! String descR = null; %>
<%! String sol = null; %>
<%! String ing = null; %>

<%! Connection conn; %>
<%! Statement stmt; %>
<%! ResultSet rs = null;%>
<%! Statement stmt2; %>
<%! ResultSet rs2 = null;%>
<%! Statement stmt3; %>
<%! ResultSet rs3 = null;%>
<%! Statement stmt4; %>
<%! ResultSet rs4 = null;%>
<%! Statement stmt5; %>
<%! ResultSet rs5 = null;%>
<%! Statement stmt6; %>
<%! ResultSet rs6 = null;%>
<%! Statement stmt7; %>
<%! ResultSet rs7 = null;%>
<%! Statement stmt8; %>
<%! ResultSet rs8 = null;%>

<%! Statement stmt9; %>
<%! ResultSet rs9 = null;%>



<%! String status = "Abierto"; %>
<%! String status2 = "En mantenimiento"; %>
<%! String inge = "gMan"; %>

<%! String status3 = "En programacion"; %>
<%! String inge3 = "iMan"; %>

<%! String status4 = "En programacion finalizada"; %>

<%! String status5 = "En Mantenimiento finalizado"; %>

<%! String status6 = "En proceso"; %>
<%! String inge6 = "iSop"; %>

<%! String status7 = "Solucionado"; %>
<%! String inge7 = "iSop"; %>

<%! String status8 = "Cerrado"; %>
<%! String status9 = "FCerrado"; %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Reportes</title>
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

        .botones {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
}


button {
  padding: 10px 20px;
  font-size: 16px;
  font-weight: bold;
  color: #fff;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  transition: background-color 0.2s ease-in-out;
}

.ver-reportes {
  background-color: #007bff;
  margin-right: 10px;
}

.subir-reportes {
  background-color: #28a745;
  margin-right: 10px;
}

button:hover {
  background-color: #0056b3;
}

.ver-reportes:hover {
  background-color: #0056b3;
}

.subir-reportes:hover {
  background-color: #218838;
}

.salir{
    background-color: #c51350;
  margin-right: 10px;
}

.salir:hover {
  background-color: #8a1253;
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
            table {
  border-collapse: collapse; /* Junta las celdas que no tienen bordes */
  width: 100%; /* Ajusta la tabla al ancho del contenedor */
}

td {
  padding: 10px; /* Añade un poco de espacio entre el contenido y los bordes */
}
            .inge{
  width: 100%; /* Ajusta el ancho del input y del select al 100% del espacio disponible */
  padding: 8px; /* Añade un poco de espacio entre el contenido y los bordes del input y del select */
  border: 1px solid #ccc; /* Agrega un borde de 1px de grosor y de color gris claro */
  border-radius: 4px; /* Añade un borde redondeado al input y al select */
  box-sizing: border-box; /* Define la caja del input y del select para incluir el borde y el relleno */
}
        }
    </style>
    
    <%
        idR2 = request.getParameter("idRe");
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        conn = DriverManager.getConnection("jdbc:mysql://localhost/proy?user=root&password=n0m3l0");
        stmt = conn.createStatement();
        rs = stmt.executeQuery("SELECT * FROM reporte WHERE estado='" + status + "'");
        
        stmt2 = conn.createStatement();
        rs2 = stmt2.executeQuery("SELECT * FROM reporte WHERE estado='" + status2 + "'");
        
        stmt3 = conn.createStatement();
        rs3 = stmt3.executeQuery("SELECT * FROM reporte WHERE estado='" + status3 + "'");
        
        stmt4 = conn.createStatement();
        rs4 = stmt4.executeQuery("SELECT * FROM reporte WHERE estado='" + status4 + "'");
        
        stmt5 = conn.createStatement();
        rs5 = stmt5.executeQuery("SELECT * FROM reporte WHERE estado='" + status5 + "'");
        
        stmt6 = conn.createStatement();
        rs6 = stmt6.executeQuery("SELECT * FROM reporte WHERE estado='" + status6 + "'");
        
        stmt7 = conn.createStatement();
        rs7 = stmt7.executeQuery("SELECT * FROM reporte WHERE estado='" + status7 + "'");
        
        stmt8 = conn.createStatement();
        rs8 = stmt8.executeQuery("SELECT * FROM reporte WHERE estado='" + status8 + "'");
        
        stmt9 = conn.createStatement();
        rs9 = stmt9.executeQuery("SELECT * FROM reporte WHERE estado='" + status9 + "'");
        
        
        %>
    
  </head>
  <body>
      <nav>
  <ul>
    <li><a href="consultas20.jsp">Perfil del Asistente</a></li>
    <li><a href="iSop0.html">Perfil del Ingeniero de Soporte</a></li>
    <li><a href="gMan0.html">Perfil del Gerente de Mantenimiento</a></li>
    <li><a href="reportesCe3.jsp">Perfil del Editor de FAQ's</a></li>
    <li><a href="index.html" >Salir</a></li>
  </ul>
</nav>

      <h1> Bienvenido Gerente de Soporte </h1><!--  -->
      <%
        out.println("<h2>Reportes Abiertos y En Mantenimiento Finalizado</h2>");
        out.println("<table>");
        out.println("<tr>");
        out.println("<th>Id reporte</th>");
        out.println("<th>Id usuario</th>");
        out.println("<th>Id cliente</th>");
        out.println("<th>Nombre cliente</th>");
        out.println("<th>Descripción del reporte</th>");
        out.println("<th>Fecha de Creación</th>");
        out.println("<th>Estado</th>");
        out.println("<th>Trabajador asignado</th>");
        out.println("<th>Solucion</th>");
        out.println("<th>Acciones</th>");
        out.println("</tr>");

        while (rs.next()) {
            String idR2 = rs.getString("id_reporte");
            String idAs = rs.getString("id_user");
            String idC = rs.getString("id_cliente");
            String nomC = rs.getString("cliente");
            String descR = rs.getString("descR");
            String fecha = rs.getString("fecha_creacion");
            String ing = rs.getString("ingA");       
            String sol = rs.getString("solucion");
            
            out.println("<form action='altaReporteEnProceso.jsp' method='post' name='subir2'>");
            out.println("<tr>");
            out.println("<td><input type='text' name='idRe' value='" + idR2 + "' readonly=readonly></td>");
            
            out.println("<td><input type='text' name='idAsis' value='" + idAs + "' readonly=readonly></td>");
                
            out.println("<td><input type='text' name='idClien' value='" + idC + "' readonly=readonly></td>");
                
            out.println("<td><input type='text' name='nClien' value='" + nomC + "' readonly=readonly></td>");
                
            out.println("<td><input type='text' name='descripR' value='" + descR + "' readonly=readonly></td>");
            
            out.println("<td><input type='text' name=' ' value='" + fecha + "' readonly=readonly></td>");
            
            out.println("<td><input type='text' name=' ' value='" + status + "' readonly=readonly></td>");
                
            out.println("<td><select name='inge'onchange='changeAction(this.form)'><option value='iSop'>IngenieroSop1</option><option value='iSop2'>IngenieroSop2</option><option value='gMan'>GerenteMantenimiento1</option><option value='gMan2'>GerenteMantenimiento2</option></select></td>");
             %>
            <script>
function changeAction(form) {
  var opcionSeleccionada = form.inge.options[form.inge.selectedIndex].value;
  if (opcionSeleccionada === 'gMan' || opcionSeleccionada === 'gMan2') {
    form.action = 'altaReporteEnProcesoMan.jsp';
  } else {
    form.action = 'altaReporteEnProceso.jsp';
  }
}
</script>
            <%
            
            out.println("<td><input type='text' name='solu' value='" + sol + "' readonly=readonly></td>");
                
            out.println("<td><input type='submit' name='altaReporteEnProceso.jsp' value='Asignar '></td>");
            
            out.println("</tr>");
                
                out.println("</form>");
        }
        while (rs5.next()) {
            String idR2 = rs5.getString("id_reporte");
            String idAs = rs5.getString("id_user");
            String idC = rs5.getString("id_cliente");
            String nomC = rs5.getString("cliente");
            String descR = rs5.getString("descR");
            String fecha = rs5.getString("fecha_creacion");
            String ing = rs5.getString("ingA");
            String sol = rs5.getString("solucion");
            
            out.println("<form action='altaReporteEnProceso.jsp' method='post' name='subir2'>");
            out.println("<tr>");
            out.println("<td><input type='text' name='idRe' value='" + idR2 + "' readonly=readonly></td>");
            
            out.println("<td><input type='text' name='idAsis' value='" + idAs + "' readonly=readonly></td>");
                
            out.println("<td><input type='text' name='idClien' value='" + idC + "' readonly=readonly></td>");
                
            out.println("<td><input type='text' name='nClien' value='" + nomC + "' readonly=readonly></td>");
                
            out.println("<td><input type='text' name='descripR' value='" + descR + "' readonly=readonly></td>");
            
            out.println("<td><input type='text' name=' ' value='" + fecha + "' readonly=readonly></td>");
            
            out.println("<td><input type='text' name=' ' value='" + status5 + "' readonly=readonly></td>");
                
            out.println("<td><select name='inge' onchange='changeAction(this.form)'><option value='iSop'>IngenieroSop1</option><option value='iSop2'>IngenieroSop2</option></select></td>");
            %>
            <script>
function changeAction(form) {
  var selectedOption = form.inge.options[form.inge.selectedIndex].value;
  if(selectedOption === 'iSop2') {
    form.action = 'altaReporteEnProceso.jsp';
  } else {
    form.action = 'altaReporteEnProceso.jsp';
  }
}
</script>
            <%
            out.println("<td><input type='text' name='solu' value='" + sol + "' readonly=readonly></td>");
                
            out.println("<td><input type='submit' name='altaReporteEnProceso.jsp' value='SUBIR Ing'></td>");
            
            out.println("</tr>");
                
                out.println("</form>");
        }
        
       
        out.println("</table>");%>
         
        <%
        out.println("<h2>Reportes En proceso, En mantenimiento y En programación</h2>");
        out.println("<table>");
        out.println("<tr>");
        out.println("<th>Id reporte</th>");
        out.println("<th>Id usuario</th>");
        out.println("<th>Id cliente</th>");
        out.println("<th>Nombre cliente</th>");
        out.println("<th>Descripción del reporte</th>");
        out.println("<th>Fecha de Creación</th>");
        out.println("<th>Estado</th>");
        out.println("<th>Ingeniero asignado</th>");
        out.println("<th>Solucion</th>");
        out.println("<th></th>");
        out.println("</tr>");
        while (rs6.next()) {
            String idR2 = rs6.getString("id_reporte");
            String idAs = rs6.getString("id_user");
            String idC = rs6.getString("id_cliente");
            String nomC = rs6.getString("cliente");
            String descR = rs6.getString("descR");
            String fecha = rs6.getString("fecha_creacion");
            String ing = rs6.getString("ingA");  
            String sol = rs6.getString("solucion");
            
            out.println("<form action='altaReporteiSop.jsp' method='post' name='subir2'>");
            out.println("<tr>");
            out.println("<td><input type='text' name='idRe' value='" + idR2 + "' readonly=readonly></td>");
            
            out.println("<td><input type='text' name='idAsis' value='" + idAs + "' readonly=readonly></td>");
                
            out.println("<td><input type='text' name='idClien' value='" + idC + "' readonly=readonly></td>");
                
            out.println("<td><input type='text' name='nClien' value='" + nomC + "' readonly=readonly></td>");
                
            out.println("<td><input type='text' name='descripR' value='" + descR + "' readonly=readonly></td>");
            
            out.println("<td><input type='text' name=' ' value='" + fecha + "' readonly=readonly></td>");
            
            out.println("<td><input type='text' name=' ' value='" + status6 + "' readonly=readonly></td>");
            
            out.println("<td><input type='text' name=' ' value='" + ing + "' readonly=readonly></td>");
                
            out.println("<td><input type='text' name='solu' value='" + sol + "' readonly=readonly ></td>");
                
            
            out.println("</tr>");
                
                out.println("</form>");
        }
       
        while (rs2.next()) {
            String idR2 = rs2.getString("id_reporte");
            String idAs = rs2.getString("id_user");
            String idC = rs2.getString("id_cliente");
            String nomC = rs2.getString("cliente");
            String descR = rs2.getString("descR");
            String fecha = rs2.getString("fecha_creacion");
            String ing = rs2.getString("ingA");        
            String sol = rs2.getString("solucion");
            
            out.println("<form action='gMan1.jsp' method='post' name='subir2'>");
            out.println("<tr>");
            out.println("<td><input type='text' name='idRe' value='" + idR2 + "' readonly=readonly></td>");
            
            out.println("<td><input type='text' name='idAsis' value='" + idAs + "'readonly=readonly></td>");
                
            out.println("<td><input type='text' name='idClien' value='" + idC + "' readonly=readonly></td>");
                
            out.println("<td><input type='text' name='nClien' value='" + nomC + "' readonly=readonly></td>");
                
            out.println("<td><input type='text' name='descripR' value='" + descR + "' readonly=readonly></td>");
            
            out.println("<td><input type='text' name=' ' value='" + fecha + "' readonly=readonly></td>");
            
            out.println("<td><input type='text' name=' ' value='" + status2 + "' readonly=readonly></td>");
                
            
            out.println("<td><input type='text' name=' ' value='" + ing + "' readonly=readonly></td>");
            
            out.println("<td><input type='text' name='solu' value='" + sol + "' readonly=readonly></td>");
                
            
            out.println("</tr>");
                
                out.println("</form>");
        }
        
        while (rs3.next()) {
            String idR2 = rs3.getString("id_reporte");
            String idAs = rs3.getString("id_user");
            String idC = rs3.getString("id_cliente");
            String nomC = rs3.getString("cliente");
            String descR = rs3.getString("descR");
            String fecha = rs3.getString("fecha_creacion");
            String ing = rs3.getString("ingA");        
            String sol = rs3.getString("solucion");
            
            
                
            out.println("<form action='enProgramacion2.jsp' method='post' name='subir2'>");
            out.println("<tr>");
            out.println("<td><input type='text' name='idRe' value='" + idR2 + "'  readonly=readonly></td>");
            
            out.println("<td><input type='text' name='idAsis' value='" + idAs + "'readonly=readonly></td>");
                
            out.println("<td><input type='text' name='idClien' value='" + idC + "' readonly=readonly></td>");
                
            out.println("<td><input type='text' name='nClien' value='" + nomC + "' readonly=readonly></td>");
                
            out.println("<td><input type='text' name='descripR' value='" + descR + "' readonly=readonly></td>");
            
            out.println("<td><input type='text' name=' ' value='" + fecha + "' readonly=readonly></td>");
            
            out.println("<td><input type='text' name=' ' value='" + status3 + "' readonly=readonly></td>");
            
            out.println("<td><input type='text' name=' ' value='" + ing + "' readonly=readonly></td>");
                
            out.println("<td><input type='text' name='solu' value='" + sol + "' ></td>");
                
            
            out.println("</tr>");
                
                out.println("</form>");
            
        }
        out.println("</table>");
        out.println("<h2>Reportes En programación finalizada y Solucionados</h2>");
        out.println("<table>");
        out.println("<tr>");
        out.println("<th>Id reporte</th>");
        out.println("<th>Id usuario</th>");
        out.println("<th>Id cliente</th>");
        out.println("<th>Nombre cliente</th>");
        out.println("<th>Descripción del reporte</th>");
        out.println("<th>Fecha de Creación</th>");
        out.println("<th>Estado</th>");
        out.println("<th>Ingeniero asignado</th>");
        out.println("<th>Solucion</th>");
        out.println("<th></th>");
        out.println("</tr>");
        
        while (rs4.next()) {
            String idR2 = rs4.getString("id_reporte");
            String idAs = rs4.getString("id_user");
            String idC = rs4.getString("id_cliente");
            String nomC = rs4.getString("cliente");
            String descR = rs4.getString("descR");
            String fecha = rs4.getString("fecha_creacion");
            String ing = rs4.getString("ingA");  
            String sol = rs4.getString("solucion");
            
            out.println("<form action='programacionFinalizada2.jsp' method='post' name='subir2'>");
            out.println("<tr>");
            out.println("<td><input type='text' name='idRe' value='" + idR2 + "' readonly=readonly></td>");
            
            out.println("<td><input type='text' name='idAsis' value='" + idAs + "' readonly=readonly></td>");
                
            out.println("<td><input type='text' name='idClien' value='" + idC + "' readonly=readonly></td>");
                
            out.println("<td><input type='text' name='nClien' value='" + nomC + "' readonly=readonly></td>");
                
            out.println("<td><input type='text' name='descripR' value='" + descR + "' readonly=readonly></td>");
            
            out.println("<td><input type='text' name=' ' value='" + fecha + "' readonly=readonly></td>");
            
            out.println("<td><input type='text' name=' ' value='" + status4 + "' readonly=readonly></td>");
            
            out.println("<td><input type='text' name=' ' value='" + ing + "' readonly=readonly></td>");
                
            out.println("<td><input type='text' name='solu' value='" + sol + "' readonly=readonly></td>");
                
           
            out.println("</tr>");
                
                out.println("</form>");
        }
        
        
       
        
         while (rs7.next()) {
            String idR2 = rs7.getString("id_reporte");
            String idAs = rs7.getString("id_user");
            String idC = rs7.getString("id_cliente");
            String nomC = rs7.getString("cliente");
            String descR = rs7.getString("descR");
            String fecha = rs7.getString("fecha_creacion");
            String ing = rs7.getString("ingA");  
            String sol = rs7.getString("solucion");
            
            out.println("<form action='reportesCerradosiSop.jsp' method='post' name='subir2'>");
            out.println("<tr>");
            out.println("<td><input type='text' name='idRe' value='" + idR2 + "' readonly=readonly></td>");
            
            out.println("<td><input type='text' name='idAsis' value='" + idAs + "' readonly=readonly></td>");
                
            out.println("<td><input type='text' name='idClien' value='" + idC + "' readonly=readonly></td>");
                
            out.println("<td><input type='text' name='nClien' value='" + nomC + "' readonly=readonly></td>");
                
            out.println("<td><input type='text' name='descripR' value='" + descR + "' readonly=readonly></td>");
            
            out.println("<td><input type='text' name=' ' value='" + fecha + "' readonly=readonly></td>");
            
            out.println("<td><input type='text' name=' ' value='" + status7 + "' readonly=readonly></td>");
            
            out.println("<td><input type='text' name=' ' value='" + ing + "' readonly=readonly></td>");
                
            out.println("<td><input type='text' name='solu' value='" + sol + "' readonly=readonly></td>");
                
            
            out.println("</tr>");
                
                out.println("</form>");
        }
        out.println("</table>");
        out.println("<h2>Reportes Cerrados</h2>");
        out.println("<table>");
        out.println("<tr>");
        out.println("<th>Id reporte</th>");
        out.println("<th>Id usuario</th>");
        out.println("<th>Id cliente</th>");
        out.println("<th>Nombre cliente</th>");
        out.println("<th>Descripción del reporte</th>");
        out.println("<th>Fecha de Creación</th>");
        out.println("<th>Estado</th>");
        out.println("<th>Ingeniero asignado</th>");
        out.println("<th>Solucion</th>");
        out.println("<th></th>");
        out.println("</tr>");
        while (rs8.next()) {
            String idR2 = rs8.getString("id_reporte");
            String idAs = rs8.getString("id_user");
            String idC = rs8.getString("id_cliente");
            String nomC = rs8.getString("cliente");
            String descR = rs8.getString("descR");
            String fecha = rs8.getString("fecha_creacion");
            String ing = rs8.getString("ingA");  
            String sol = rs8.getString("solucion");
            
            out.println("<form action='' method='post' name='subir2'>");
            out.println("<tr>");
            out.println("<td><input type='text' name='idRe' value='" + idR2 + "' readonly=readonly></td>");
            
            out.println("<td><input type='text' name='idAsis' value='" + idAs + "'readonly=readonly></td>");
                
            out.println("<td><input type='text' name='idClien' value='" + idC + "' readonly=readonly></td>");
                
            out.println("<td><input type='text' name='nClien' value='" + nomC + "' readonly=readonly></td>");
                
            out.println("<td><input type='text' name='descripR' value='" + descR + "' readonly=readonly></td>");
            
            out.println("<td><input type='text' name='' value='" + fecha + "' readonly=readonly></td>");
            
            out.println("<td><input type='text' name=' ' value='" + status8 + "' readonly=readonly></td>");
            
            out.println("<td><input type='text' name=' ' value='" + ing + "' readonly=readonly></td>");
                
            out.println("<td><input type='text' name='solu' value='" + sol + "' readonly=readonly></td>");
                
            out.println("</tr>");
                
                out.println("</form>");
        }
        while (rs9.next()) {
            String idR2 = rs9.getString("id_reporte");
            String idAs = rs9.getString("id_user");
            String idC = rs9.getString("id_cliente");
            String nomC = rs9.getString("cliente");
            String descR = rs9.getString("descR");
            String fecha = rs9.getString("fecha_creacion");
            String ing = rs9.getString("ingA");  
            String sol = rs9.getString("solucion");
            
            out.println("<form action='' method='post' name='subir2'>");
            out.println("<tr>");
            out.println("<td><input type='text' name='idRe' value='" + idR2 + "' readonly=readonly></td>");
            
            out.println("<td><input type='text' name='idAsis' value='" + idAs + "'readonly=readonly></td>");
                
            out.println("<td><input type='text' name='idClien' value='" + idC + "' readonly=readonly></td>");
                
            out.println("<td><input type='text' name='nClien' value='" + nomC + "' readonly=readonly></td>");
                
            out.println("<td><input type='text' name='descripR' value='" + descR + "' readonly=readonly></td>");
            
            out.println("<td><input type='text' name='' value='" + fecha + "' readonly=readonly></td>");
            
            out.println("<td><input type='text' name=' ' value='" + status8 + "' readonly=readonly></td>");
            
            out.println("<td><input type='text' name=' ' value='" + ing + "' readonly=readonly></td>");
                
            out.println("<td><input type='text' name='solu' value='" + sol + "' readonly=readonly></td>");
                
            out.println("</tr>");
                
                out.println("</form>");
        }
        
        
        
        out.println("</table>");

        //cerrar  la conexión
        try {
            conn.close();
        } catch (SQLException sqlEx) {
        };
    %>
           

  </body>
  <footer></footer>
  <br>
  <footer><button class="subir-reportes" onclick="location.href='FaqsCerrados.jsp'" >Ver FAQS Cerrados</button></footer>
  <br>
  <!--<footer><button class="salir" onclick="location.href='gerSop.jsp'" >Regresar</button></footer>-->
  
</html>