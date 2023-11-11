<%@ page import= "java.sql.*" %>

<%! String idR2 = null; %>
<%! String idC = null; %>
<%! String idAs = null; %>
<%! String nomC = null; %>
<%! String descR = null; %>
<%! String sol = null; %>


<%! Connection conn; %>
<%! Connection conn2; %>
<%! Statement stmt; %>
<%! ResultSet rs = null;%>
<%! String status = "Cerrado"; %>

<%! Statement stmt2; %>
<%! ResultSet rs2 = null;%>



<HTML>
<HEAD>
    <TITLE>BUSQUEDA </TITLE>
    <link rel="stylesheet" href="style3.css">
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
    <%
        idR2 = request.getParameter("idRe");
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        conn = DriverManager.getConnection("jdbc:mysql://localhost/proy?user=root&password=n0m3l0");
        stmt = conn.createStatement();
        rs = stmt.executeQuery("SELECT * FROM reporte WHERE estado='" + status + "'");

        %>
       
        </HEAD>
        <BODY>
            <nav>
  <ul>
    <li><a href="consultas20.jsp">Perfil del Asistente</a></li>
    <li><a href="gerSop.jsp">Perfil del Gerente de Soporte</a>
    </li><li><a href="iSop0.html">Perfil del Ingeniero de Soporte</a></li>
    <li><a href="gMan0.html">Perfil del Gerente de Mantenimiento</a></li>
    
    <li><a href="gerSop.jsp" >Regresar</a></li>
  </ul>
</nav> 
            <br><!-- < -->
            <br>
            <h1>Bienvenido Editor de FAQS</h1>
            <h2>Crear FAQS desde ID de reporte</h2>
<%
        out.println("<table>");
        out.println("<tr>");
        out.println("<th>Id reporte</th>");
        out.println("<th>Id usuario</th>");
        out.println("<th>Id cliente</th>");
        out.println("<th>Nombre cliente</th>");
        out.println("<th>Descripción reporte</th>");
        out.println("<th>Estado</th>");
        out.println("<th>Solución</th>");
        out.println("<th>Acciones</th>");
        out.println("<th></th>");
        out.println("</tr>");

        while (rs.next()) {
            String idR2 = rs.getString("id_reporte");
            String idAs = rs.getString("id_user");
            String idC = rs.getString("id_cliente");
            String nomC = rs.getString("cliente");
            String descR = rs.getString("descR");
            String sol = rs.getString("solucion");
            
            out.println("<form id='miFormulario' action='reportesEnviadoEditor2.jsp' method='post' name='subir2'>");
            out.println("<tr>");
            out.println("<td><input type='text' id='savi' name='idRe' value='" + idR2 + "' readonly=readonly></td>");
            
            out.println("<td><input type='text' name='idAsis' value='" + idAs + "'readonly=readonly></td>");
                
            out.println("<td><input type='text' name='idClien' value='" + idC + "' readonly=readonly></td>");
                
            out.println("<td><input type='text' name='nClien' value='" + nomC + "' readonly=readonly></td>");
                
            out.println("<td><input type='text' name='descripR' value='" + descR + "' readonly=readonly></td>");
            
            out.println("<td><input type='text' name=' ' value='" + status + "' readonly=readonly></td>");
                
            out.println("<td><input type='text' name='solu' value='" + sol + "' readonly=readonly></td>");
            
            out.println("<td><input type='submit' name='reportesEnviadoEditor2.jsp' value='SUBIR'></td>");
            
                
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

    
    <%
		// Establecer la conexión con la base de datos
		String url = "jdbc:mysql://localhost:3306/proy";
		String usuario = "root";
		String contrasena = "n0m3l0";
		Connection conexion = DriverManager.getConnection(url, usuario, contrasena);

		// Mostrar la tabla de FAQs
		Statement consulta = conexion.createStatement();
		ResultSet resultados = consulta.executeQuery("SELECT * FROM faqs");
                out.print("<br>");
        out.print("<br>");
        out.print("<br>");
        out.print("<h2>Crear FAQS desde 0</h2>");
		// Mostrar los datos en una tabla HTML
		out.print("<table>");
		out.print("<tr><th>ID</th><th>Pregunta</th><th>Respuesta</th><th>Acciones</th></tr>");
		while (resultados.next()) {
			out.print("<tr>");
			out.print("<td>" + resultados.getInt("id") + "</td>");
			out.print("<td>" + resultados.getString("question") + "</td>");
			out.print("<td>" + resultados.getString("answer") + "</td>");
			out.print("<td><a href=\"editarFaq.jsp?id=" + resultados.getInt("id") + "\">Editar</a> <a href=\"borrarFaq.jsp?id=" + resultados.getInt("id") + "\">Borrar</a></td>");
			out.print("</tr>");
		}
		out.print("</table>");

		// Cerrar la conexión con la base de datos
		conexion.close();
	%>

	<br>
	<a href="agregarFaq.jsp">Agregar nueva FAQ</a>

        <br>
        <br><!-- comment -->
        <br>
      <button class="subir-reportes" onclick="location.href='FaqsCerrados.jsp'" >FAQS Subidos</button>
      <button class="subir-reportes" onclick="location.href='reportesCe.jsp'" >Reportes Cerrados</button>
      <button class="salir" onclick="location.href='gerSop.jsp'" >Regresar</button>

</BODY>
</HTML>

