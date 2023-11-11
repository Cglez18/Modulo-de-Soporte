<%@ page import= "java.sql.*" %>
<%@ page import= "java.io.*" %>

<%! String id = null; %>
<%! String nombre = null; %>

<%!Statement stmt_consul = null;%>
<%!ResultSet rs = null;%>
<%!Connection con = null;%>

<%! String idR2 = null; %>
<%! String idC = null; %>
<%! String idAs = "Asistente"; %>
<%! String nomC = null; %>
<%! String descR = null; %>
<%! String sol = null; %>
<%! String ing = null; %>

<%! Connection conn2; %>
<%! Statement stmt2; %>
<%! ResultSet rs2 = null;%>
<%! String status = "Abierto"; %>


<%
//conexion a la base de datos MIO
                                            
    // Cargar el controlador	
    Class.forName("com.mysql.jdbc.Driver").newInstance();

    // Establecer conexión al origen de datos
    con = DriverManager.getConnection("jdbc:mysql://localhost/proy?user=root&password=n0m3l0");

    // El método  createStatment :
    //provee la infraestructura para ejecutar sentencias SQL sobre una conexión con una base de dato
    stmt_consul = con.createStatement();

    // El obj. statment retorna una hoja de esultados
    rs = stmt_consul.executeQuery("SELECT * FROM cliente");

%>

<HTML>

    <HEAD> <title> Usuarios </title>        
        <link rel="stylesheet" href="style3.css">
    <style>
        .botoncito {
  display: inline-block;
  padding: 4px 8px;
  font-size: 12px;
  font-weight: 400;
  line-height: 1.42857143;
  text-align: center;
  white-space: nowrap;
  vertical-align: middle;
  cursor: pointer;
  background-image: none;
  border: 1px solid #ccc;
  border-radius: 4px;
  color: white;
  background-color:  #4CAF50;
  text-decoration: none;
}

.botoncito:hover{
   background-color: #3e8e41;
}
.botoncito:focus,
.botoncito:active {
  color: #333;
  background-color: #e6e6e6;
  border-color: #adadad;
  text-decoration: none;
}
           nav {
  background-color: #58B0D6 ;
  height: 60px;
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
  font-size: 20px; /* Tamaño mayor para el botón activo */
  padding-top: 10px; /* Ajuste de la altura del botón */
}
 .tabla {
            border-collapse: collapse;
            width: 100%;
        }

        .fila, .fila2 {
            text-align: left;
            padding: 8px;
        }

        .fila {
            background-color: #4CAF50;
            color: white;
        }

        .encabezado:nth-child(even) {
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
    <li><a href="iSop0.html">Perfil del Ingeniero de Soporte</a></li>
    <li><a href="gMan0.html">Perfil del Gerente de Mantenimiento</a></li>
    <li><a href="reportesCe3.jsp">Perfil del Editor de FAQ's</a></li>
    <li><a href="gerSop.jsp" >Regresar</a></li>
  </ul>
</nav> 

        <%  
            
            out.println("<br>");
            out.println("<div align=center><strong>Usuarios Registrados </strong></div>");
            out.println("<form action='subirReportes.jsp' method='post'>");
            out.println("<P><TABLE width=464 height=52 border=1 align=center>");
            out.println("<TR align=center bgcolor=#FFFFCC>");
            out.println("<TD >" + "Id del cliente" + "</TD>");
            out.println("<TD >" + "Nombre" + "</TD>");
            out.println("<TD >" + "Acciones" + "</TD>");
            out.println("</TR>");

            while (rs.next()) {
                out.println("<TR>");
                
                id = rs.getString("id_cliente");
                out.println("<TD>" + id + "</TD>");
                
                nombre = rs.getString("nom_cliente");
                out.println("<TD>" + nombre + "</TD>");
                out.println("<td><a href='subirReportes.jsp?id=" + id + "'class='botoncito'>Subir reporte"+ "</a></td>");
                 /*out.println("<TD><input type='submit' value='Subir Reporte' /></TD>");*/

                out.println("</TR>");

            }
            out.println("</form>");
            out.println("</TABLE>");

            //cerrar  la conexión
            try {
                con.close();
            } catch (SQLException sqlEx) {
            };
        %>
      <%
        idR2 = request.getParameter("idRe");
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        conn2 = DriverManager.getConnection("jdbc:mysql://localhost/proy?user=root&password=n0m3l0");
        stmt2 = conn2.createStatement();
        rs2 = stmt2.executeQuery("SELECT * FROM reporte");
        %>
        <br>
        <h2>Mis reportes creados</h2>
<%
        out.println("<table class='tabla'>");
        out.println("<tr class='encabezado'>");
        out.println("<th class='fila'>Id reporte</th>");
        out.println("<th class='fila'>Id usuario</th>");
        out.println("<th class='fila'>Id cliente</th>");
        out.println("<th class='fila'>Nombre cliente</th>");
        out.println("<th class='fila'>Descripción reporte</th>");

        out.println("<th class='fila'>Fecha de Creación</th>");
        out.println("</tr>");

        while (rs2.next()) {
            String idR2 = rs2.getString("id_reporte");
            String idC = rs2.getString("id_cliente");
            String nomC = rs2.getString("cliente");
            String descR = rs2.getString("descR");
            String fecha = rs2.getString("fecha_creacion");
            
            out.println("<form action='altaReporteEnProceso.jsp' method='post' name='subir2'>");
            out.println("<tr class='encabezado'>");
            out.println("<td class='fila2'><input type='text' name='idRe' value='" + idR2 + "' readonly=readonly></td>");
            
            out.println("<td class='fila2'><input type='text' name='idAsis' value='" + idAs + "' readonly=readonly></td>");
                
            out.println("<td class='fila2'><input type='text' name='idClien' value='" + idC + "' readonly=readonly></td>");
                
            out.println("<td class='fila2'><input type='text' name='nClien' value='" + nomC + "' readonly=readonly></td>");
                
            out.println("<td class='fila2'><input type='text' name='descripR' value='" + descR + "' readonly=readonly></td>");
            
            out.println("<td class='fila2'><input type='text' name=' ' value='" + fecha + "' readonly=readonly></td>");
            
            
                
            
         
                
            
            out.println("</tr>");
                
                out.println("</form>");
        }
        

        out.println("</table>");

        //cerrar  la conexión
        try {
            conn2.close();
        } catch (SQLException sqlEx) {
        };
    %>

    </BODY>

    
</HTML>

