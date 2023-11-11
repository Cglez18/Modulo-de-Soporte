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

<%! String status = "En proceso"; %>
<%! String inge = "iSop2"; %>


<HTML>
<HEAD>
    <link rel="stylesheet" href="style3.css">
    <TITLE>BUSQUEDA </TITLE>
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
</HEAD>
<BODY>
    <%
        idR2 = request.getParameter("idRe");
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        conn = DriverManager.getConnection("jdbc:mysql://localhost/proy?user=root&password=n0m3l0");
        stmt = conn.createStatement();
        
        conn2 = DriverManager.getConnection("jdbc:mysql://localhost/proy?user=root&password=n0m3l0");
        stmt2 = conn2.createStatement();
        
        if (inge.equals("iSop")) {
            rs = stmt.executeQuery("SELECT * FROM reporte WHERE estado='" + status + "' AND ingA='" + inge + "'");
            out.println("<table>");
        out.println("<tr>");
        out.println("<th>Id reporte</th>");
        out.println("<th>Id usuario</th>");
        out.println("<th>Id cliente</th>");
        out.println("<th>Nombre cliente</th>");
        out.println("<th>Descripción reporte</th>");
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
            String sol = rs.getString("solucion");
            
            out.println("<form action='altaReporteiSop.jsp' method='post' name='subir2'>");
            out.println("<tr>");
            out.println("<td><input type='text' name='idRe' value='" + idR2 + "' readonly=readonly></td>");
            
            out.println("<td><input type='text' name='idAsis' value='" + idAs + "' readonly=readonly></td>");
                
            out.println("<td><input type='text' name='idClien' value='" + idC + "' readonly=readonly></td>");
                
            out.println("<td><input type='text' name='nClien' value='" + nomC + "' readonly=readonly></td>");
                
            out.println("<td><input type='text' name='descripR' value='" + descR + "' readonly=readonly></td>");
            
            out.println("<td><input type='text' name=' ' value='" + status + "' readonly=readonly></td>");
                
            out.println("<td><input type='text' name='solu' value='" + sol + "' ></td>");
                
            out.println("<td><input type='submit' name='altaReporteiSop.jsp' value='SUBIR'></td>");
            out.println("</tr>");
                
                out.println("</form>");
        }
        out.println("</table>");
        } else {
            rs2 = stmt2.executeQuery("SELECT * FROM reporte WHERE estado='" + status + "' AND ingA='" + inge + "'");
            
            out.println("<table>");
        out.println("<tr>");
        out.println("<th>Id reporte</th>");
        out.println("<th>Id asistente</th>");
        out.println("<th>Id cliente</th>");
        out.println("<th>Nombre cliente</th>");
        out.println("<th>Descripción reporte</th>");
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
            String sol = rs2.getString("solucion");
            
            out.println("<form action='altaReporteiSop2.jsp' method='post' name='subir2'>");
            out.println("<tr>");
            out.println("<td><input type='text' name='idRe' value='" + idR2 + "' readonly=readonly></td>");
            
            out.println("<td><input type='text' name='idAsis' value='" + idAs + "' readonly=readonly></td>");
                
            out.println("<td><input type='text' name='idClien' value='" + idC + "' readonly=readonly></td>");
                
            out.println("<td><input type='text' name='nClien' value='" + nomC + "' readonly=readonly></td>");
                
            out.println("<td><input type='text' name='descripR' value='" + descR + "' readonly=readonly></td>");
            
            out.println("<td><input type='text' name=' ' value='" + status + "' readonly=readonly></td>");
                
            out.println("<td><input type='text' name='solu' value='" + sol + "' ></td>");
                
            out.println("<td><input type='submit' name='altaReporteiSop2.jsp' value='SUBIR'></td>");
            out.println("</tr>");
                
                out.println("</form>");
                
        }
        }
       
        

        //cerrar  la conexión
        try {
            conn.close();
            conn2.close();
        } catch (SQLException sqlEx) {
        };
    %>

</BODY>
<footer><button class="salir" onclick="location.href='iSop2.html'" >Regresar</button></footer>
</HTML>
