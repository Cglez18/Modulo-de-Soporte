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

<HTML>
<HEAD>
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
    <%
        idR2 = request.getParameter("idRe");
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        conn = DriverManager.getConnection("jdbc:mysql://localhost/proy?user=root&password=n0m3l0");
        stmt = conn.createStatement();
        rs = stmt.executeQuery("SELECT * FROM reporte WHERE estado='" + status + "'");
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
            
            out.println("<form action='gMan1.jsp' method='post' name='subir2'>");
            out.println("<tr>");
            out.println("<td><input type='text' name='idRe' value='" + idR2 + "' ></td>");
            
            out.println("<td><input type='text' name='idAsis' value='" + idAs + "'></td>");
                
            out.println("<td><input type='text' name='idClien' value='" + idC + "' readonly=readonly></td>");
                
            out.println("<td><input type='text' name='nClien' value='" + nomC + "' readonly=readonly></td>");
                
            out.println("<td><input type='text' name='descripR' value='" + descR + "' readonly=readonly></td>");
            
            out.println("<td><input type='text' name=' ' value='" + status + "' readonly=readonly></td>");
                
            out.println("<td><input type='text' name='solu' value='" + sol + "' readonly=readonly></td>");
                
            out.println("<td><input type='submit' name='gMan1.jsp' value='SUBIR'></td>");
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

</BODY>
</HTML>

