<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%! String perfil = null;%>
<%! String cont = null;%>
<html>
<head>
     <style>
    table {
      font-family: Arial, sans-serif;
      border-collapse: collapse;
      width: 100%;
      margin-bottom: 20px;
    }

    th, td {
      text-align: left;
      padding: 8px;
      border-bottom: 1px solid #ddd;
    }

    th {
      background-color: #4CAF50;
      color: white;
    }

    tr:nth-child(even) {
      background-color: #f2f2f2;
    }
  </style>
  <title>Reportes Abiertos</title>
</head>
<body>
  <h1>Bienvenido a tus reportes asignados</h1>
  
  <table>
    <thead>
      <tr>
        <th>Id_Reporte</th>
        <th>Id_Cliente</th>
        <th>Descripción</th>
        <th>Fecha</th>
        <th>Hora</th>
        <th>Estado</th>
        <th>Solucion</th>
        <th>Id_Usuario</th>
        <th>Acciones</th>
      </tr>
    </thead>
    <tbody>
      <%
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        
        try {
        
          conn = DriverManager.getConnection("jdbc:mysql://localhost/proy?user=root&password=n0m3l0");
          
          stmt = conn.createStatement();
          rs = stmt.executeQuery ("SELECT * FROM reporte");
          
          // Iteración sobre los registros obtenidos
          while (rs.next()) {
					int id = rs.getInt("id_reporte");
					String cli = rs.getString("id_cliente");
					String des = rs.getString("descR");
					String fec = rs.getString("fechaR");
                                        String hor = rs.getString("horaR");
					String est = rs.getString("estado");
					String sol = rs.getString("solucion");
                                        String usu = rs.getString("id_usuario");
		%>
					<tr>
                                            <form method="post" action="gMan.jsp">
						<td><%=id%></td>
						<td><%=cli%></td>
						<td><%=des%></td>
						<td><%=fec%></td>
                                                <td><%=hor%></td>
						<td><%=est%></td>
						<td><%=sol%></td>
						<td><%=usu%></td>
                                                <td>
                                                    <input type="submit" value="Seleccionar">
                                                </td>
                                            </form>
					</tr>
		<%
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				// Cerrar los recursos
				try { rs.close(); } catch (Exception e) { /* Ignorar */ }
				try { stmt.close(); } catch (Exception e) { /* Ignorar */ }
				try { conn.close(); } catch (Exception e) { /* Ignorar */ }
			}
		%>
	</table>
    </tbody>
  </table>
</body>
</html>
