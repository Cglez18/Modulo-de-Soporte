
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import= "java.sql.*" %>

<%! String idR2 = null; %>
<%! String idC = null; %>
<%! String idAs = null; %>
<%! String nomC = null; %>
<%! String descR = null; %>
<%! String sol = null; %>

<%! Connection conn; %>
<%! Statement stmt; %>
<!DOCTYPE html>
<html>
<head>
	<title>Borrar FAQ</title>
</head>
	<style>
            body{
        background-color: #e6f7ea; /* tonalidad verde */
    }
    h1 {
			color: #005ce6; /* tonalidad azul */
		}
		body {
			font-family: Arial, sans-serif;
			margin: 0;
			padding: 0;
		}
		
		h1 {
			font-size: 2.5em;
			margin: 0.5em 0;
			text-align: center;
		}
		
		p {
			font-size: 1.2em;
			margin: 1em 0;
		}
		
		form {
			margin-top: 2em;
		}
		
		input[type="submit"] {
			background-color: #4CAF50;
			border: none;
			color: white;
			cursor: pointer;
			font-size: 1.2em;
			padding: 0.5em 1em;
		}
		
		input[type="submit"]:hover {
			background-color: #3E8E41;
		}
		
		a {
			display: block;
			margin-top: 2em;
			text-align: center;
		}
	</style>
<body>
	<h1>Borrar FAQ</h1>

	<%
                Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    
    String idR3 = request.getParameter("savi");
    String idAs2 = "iMan";
    String idC2 = request.getParameter("idClien");
    
    String nomC2 = request.getParameter("nClien");
    String descR2 = request.getParameter("descripR");
    String sol2 = request.getParameter("solu");
    String status3 = "Cerrado";
                
		if (request.getParameter("confirmar") != null) {
			// Procesar la eliminación de la pregunta
			int id = Integer.parseInt(request.getParameter("id"));

			// Establecer la conexión con la base de datos
			String url = "jdbc:mysql://localhost:3306/proy";
			String usuario = "root";
			String contrasena = "n0m3l0";
			Connection conexion = DriverManager.getConnection(url, usuario, contrasena);

			// Eliminar la pregunta de la tabla
			PreparedStatement consulta = conexion.prepareStatement("DELETE FROM faqs WHERE id = ?");
			consulta.setInt(1, id);
			consulta.executeUpdate();

			// Cerrar la conexión con la base de datos
			conexion.close();

			// Redirigir a la página de FAQs
			response.sendRedirect("reportesCe3.jsp");
		} else {
			// Mostrar la confirmación de eliminación
			int id = Integer.parseInt(request.getParameter("id"));

			// Establecer la conexión con la base de datos
			String url = "jdbc:mysql://localhost:3306/proy";
			String usuario = "root";
			String contrasena = "n0m3l0";
			Connection conexion = DriverManager.getConnection(url, usuario, contrasena);

			// Obtener la pregunta a eliminar
			PreparedStatement consulta = conexion.prepareStatement("SELECT question FROM faqs WHERE id = ?");
			consulta.setInt(1, id);
			ResultSet resultado = consulta.executeQuery();
			resultado.next();
			String pregunta = resultado.getString("question");
                        
                     
			// Cerrar la conexión con la base de datos
			conexion.close();

			// Mostrar la confirmación de eliminación
			%>
			<p>¿Está seguro que desea eliminar la siguiente pregunta?</p>
			<p><strong><%=pregunta%></strong></p>
			<form method="post">
				<input type="hidden" name="id" value="<%=id%>">
				<input type="submit" name="confirmar" value="Confirmar">
			</form>
			<%
		}
	%>

	<br>
	<a href="reportesCe3.jsp">Volver a FAQs</a>
</body>
</html>
