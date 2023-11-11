<%@ page import= "java.sql.*" %>

<%! String idR2 = null; %>
<%! String idC = null; %>
<%! String idAs = null; %>
<%! String nomC = null; %>
<%! String descR = null; %>
<%! String sol = null; %>
<%! String ing = null; %>

<%! Connection conn; %>

<%! Statement stmt2; %>
<%! ResultSet rs2 = null;%>

<%! Statement stmt3; %>
<%! ResultSet rs3 = null;%>

<%! Statement stmt5; %>
<%! ResultSet rs5 = null;%>


<%! String status2 = "En mantenimiento"; %>
<%! String inge = "gMan"; %>
<%! String status3 = "En programacion"; %>

<%! String status5 = "En programacion finalizada"; %>



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
        }
    </style>
    
    
    
  </head>
  <body>
      <nav>
  <ul>
    <li><a href="gerSop.jsp">Perfil del Gerente de Soporte</a></li>
    <li><a href="iSop0.html">Perfil del Ingeniero de Soporte</a></li>
    <li><a href="gMan0.html">Perfil del Gerente de Mantenimiento</a></li>
    <li><a href="iMan0.html">Perfil del Ingeniero de Mantenimiento</a></li>
    <li><a href="gerSop.jsp" >Regresar</a></li>
  </ul>
</nav>
      <br><!-- < -->
      <br>
      <h1> Bienvenido Gerente de Mantenimiento1 </h1><!--  -->
      <%
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        conn = DriverManager.getConnection("jdbc:mysql://localhost/proy?user=root&password=n0m3l0");
        
        
        stmt2 = conn.createStatement();
        rs2 = stmt2.executeQuery("SELECT * FROM reporte WHERE estado='" + status2 + "' AND ingA='" + inge + "'");
        
        stmt3 = conn.createStatement();
        rs3 = stmt3.executeQuery("SELECT * FROM reporte WHERE estado='" + status3 + "'");
        
        
        stmt5 = conn.createStatement();
        rs5 = stmt5.executeQuery("SELECT * FROM reporte WHERE estado='" + status5 + "'");
        
        
        
        
        
        
        %>
      <%
        out.println("<h2>Reportes en mantenimiento</h2>");
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
                
            
            out.println("<td><select name='inge'><option value='iMan'>IngenieroMan1</option><option value='iMan2'>IngenieroMan2</option></select></td>");
            
            out.println("<td><input type='text' name='solu' value='" + sol + "' readonly=readonly></td>");
            
            out.println("<td><input type='submit' name='gMan1.jsp' value='ASIGNAR Ing'></td>");
                
            
            out.println("</tr>");
                
                out.println("</form>");
        }
        out.println("</table>");
        out.println("<h2>Reportes en programacion</h2>");
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
        while (rs3.next()) {
            String idR2 = rs3.getString("id_reporte");
            String idAs = rs3.getString("id_user");
            String idC = rs3.getString("id_cliente");
            String nomC = rs3.getString("cliente");
            String descR = rs3.getString("descR");
            String fecha = rs3.getString("fecha_creacion");
            String ing = rs3.getString("ingA");        
            String sol = rs3.getString("solucion");
            
            out.println("<form action='gMan1.jsp' method='post' name='subir2'>");
            out.println("<tr>");
            out.println("<td><input type='text' name='idRe' value='" + idR2 + "' readonly=readonly></td>");
            
            out.println("<td><input type='text' name='idAsis' value='" + idAs + "'readonly=readonly></td>");
                
            out.println("<td><input type='text' name='idClien' value='" + idC + "' readonly=readonly></td>");
                
            out.println("<td><input type='text' name='nClien' value='" + nomC + "' readonly=readonly></td>");
                
            out.println("<td><input type='text' name='descripR' value='" + descR + "' readonly=readonly></td>");
            
            out.println("<td><input type='text' name=' ' value='" + fecha + "' readonly=readonly></td>");
            
            out.println("<td><input type='text' name=' ' value='" + status3 + "' readonly=readonly></td>");
                
            
            out.println("<td><input type='text' name='inge' value='" + ing + "' readonly=readonly></td>");
            
            out.println("<td><input type='text' name='solu' value='" + sol + "' readonly=readonly></td>");
            
                
            
            out.println("</tr>");
                
                out.println("</form>");
        }
        out.println("</table>");
        out.println("<h2>Reportes en programacion Finalizada</h2>");
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
        
       while (rs5.next()) {
            String idR2 = rs5.getString("id_reporte");
            String idAs = rs5.getString("id_user");
            String idC = rs5.getString("id_cliente");
            String nomC = rs5.getString("cliente");
            String descR = rs5.getString("descR");
            String fecha = rs5.getString("fecha_creacion");
            String ing = rs5.getString("ingA"); 
            String sol = rs5.getString("solucion");
            
            out.println("<form action='programacionFinalizada2.jsp' method='post' name='subir2'>");
            out.println("<tr>");
            out.println("<td><input type='text' name='idRe' value='" + idR2 + "' readonly=readonly></td>");
            
            out.println("<td><input type='text' name='idAsis' value='" + idAs + "' readonly=readonly></td>");
                
            out.println("<td><input type='text' name='idClien' value='" + idC + "' readonly=readonly></td>");
                
            out.println("<td><input type='text' name='nClien' value='" + nomC + "' readonly=readonly></td>");
                
            out.println("<td><input type='text' name='descripR' value='" + descR + "' readonly=readonly></td>");
            
            out.println("<td><input type='text' name=' ' value='" + fecha + "' readonly=readonly></td>");
            
            out.println("<td><input type='text' name=' ' value='" + status5 + "' readonly=readonly></td>");
            out.println("<td><input type='text' name='inge' value='" + ing + "' readonly=readonly></td>");
                
            out.println("<td><input type='text' name='solu' value='" + sol + "' readonly=readonly></td>");
            
             out.println("<td><input type='submit' name='programacionFinalizada2.jsp' value='ENVIAR GerSop'></td>");
                
           
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
  
</html>