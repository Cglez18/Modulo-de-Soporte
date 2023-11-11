<%@ page import= "java.sql.*" %>

<%! String idR2 = null; %>
<%! String idC = null; %>
<%! String idAs = null; %>
<%! String nomC = null; %>
<%! String descR = null; %>
<%! String sol = null; %>

<%! Connection conn; %>
<%! Statement stmt; %>
<%! ResultSet rs = null;%>
<%! String status = "En programacion"; %>
<%! String inge = "iMan2"; %>

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
    <%
        idR2 = request.getParameter("idRe");
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        conn = DriverManager.getConnection("jdbc:mysql://localhost/proy?user=root&password=n0m3l0");
        stmt = conn.createStatement();
        rs = stmt.executeQuery("SELECT * FROM reporte WHERE estado='" + status + "' AND ingA='" + inge + "'");
        %>
        </HEAD>
        <BODY>
                <nav>
  <ul>
    <li><a href="gerSop.jsp">Perfil del Gerente de Soporte</a></li>
    <li><a href="gMan0.html">Perfil del Gerente de Mantenimiento</a></li>
    <li><a href="iMan0.html">Perfil del Ingeniero de Mantenimiento</a></li>
    <li><a href="gerSop.jsp" >Regresar</a></li>
  </ul>
</nav> 
            <br>
            <br>
        <h1>Bienvenido Ingeniero de Mantenimiento 2</h1>
        
<%
        out.println("<table>");
        out.println("<tr>");
        out.println("<th>Id reporte</th>");
        out.println("<th>Id usuario</th>");
        out.println("<th>Id cliente</th>");
        out.println("<th>Nombre cliente</th>");
        out.println("<th>Descripción del reporte</th>");
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
            
            out.println("<form action='enProgramacion4.jsp' method='post' name='subir2'onsubmit='return validateForm()'>");
            out.println("<tr>");
            out.println("<td><input type='text' name='idRe' value='" + idR2 + "'  readonly=readonly></td>");
            
            out.println("<td><input type='text' name='idAsis' value='" + idAs + "'readonly=readonly></td>");
                
            out.println("<td><input type='text' name='idClien' value='" + idC + "' readonly=readonly></td>");
                
            out.println("<td><input type='text' name='nClien' value='" + nomC + "' readonly=readonly></td>");
                
            out.println("<td><input type='text' name='descripR' value='" + descR + "' readonly=readonly></td>");
            
            out.println("<td><input type='text' name=' ' value='" + fecha + "' readonly=readonly></td>");
            
            out.println("<td><input type='text' name=' ' value='" + status + "' readonly=readonly></td>");
                
                out.println("<td><input type='text' name='solu' value='" + sol + "' ></td>");
                out.println("<td><input type='submit' name='enProgramacion4.jsp' value='SUBIR'></td>");
            
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
<script>  
function validateForm() {
  var soluValue = document.getElementsByName("solu")[0].value;
  if (soluValue === "null" || soluValue === '' || soluValue === null) {
    alert("El campo solución no puede estar vacío.");
    return false;
  }
  return true;
}</script>
</BODY>
<footer><button class="salir" onclick="location.href='gManJunto.jsp'" >Regresar</button></footer>
</HTML>
