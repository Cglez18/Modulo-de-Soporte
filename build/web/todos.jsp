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
<%! String status = null; %>

<HTML>
<HEAD>
    <TITLE>BUSQUEDA </TITLE>
    <link rel="stylesheet" href="style3.css">
    <style>
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
        rs = stmt.executeQuery("SELECT * FROM reporte");
        %>
        </HEAD>
        <BODY>
        
<%
        out.println("<table>");
        out.println("<tr>");
        out.println("<th>Id reporte</th>");
        out.println("<th>Id usuario</th>");
        out.println("<th>Id cliente</th>");
        out.println("<th>Nombre cliente</th>");
        out.println("<th>Descripci�n reporte</th>");
        out.println("<th>Fecha de Creaci�n</th>");
        out.println("<th>Estado</th>");
        out.println("<th>Trabajador asignado</th>");
        out.println("<th>Solucion</th>");
        out.println("<th></th>");
        out.println("</tr>");

        while (rs.next()) {
            String idR2 = rs.getString("id_reporte");
            String idAs = rs.getString("id_user");
            String idC = rs.getString("id_cliente");
            String nomC = rs.getString("cliente");
            String descR = rs.getString("descR");
            String fecha = rs.getString("fecha_creacion");
            String status2 = rs.getString("estado");
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
            
            out.println("<td><input type='text' name=' ' value='" + status2 + "' readonly=readonly></td>");
     
             out.println("<td><input type='text' name='inge' value='" + ing + "' readonly=readonly></td>");
            
            out.println("<td><input type='text' name='solu' value='" + sol + "' readonly=readonly></td>");
                
            
            out.println("</tr>");
                
                out.println("</form>");
        }
        

        out.println("</table>");

        //cerrar  la conexi�n
        try {
            conn.close();
        } catch (SQLException sqlEx) {
        };
    %>
            
</BODY>
</<footer><button class="salir" onclick="location.href='gerSop.html'" >Regresar</button></footer>
</HTML>