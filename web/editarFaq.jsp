<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <style>
        body{
        background-color: #e6f7ea; /* tonalidad verde */
    }
    h1 {
			color: #005ce6; /* tonalidad azul */
		}
        h1 {
      font-size: 24px;
      margin-bottom: 20px;
    }

    /* Estilos para el formulario de edición de preguntas frecuentes */
    form {
      margin-bottom: 20px;
    }

    label {
      display: block;
      margin-bottom: 5px;
    }

    input[type="text"], textarea {
      width: 100%;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 3px;
      margin-bottom: 10px;
    }

    input[type="submit"] {
      background-color: #428bca;
      color: #fff;
      padding: 10px 20px;
      border: none;
      border-radius: 3px;
      cursor: pointer;
    }

    /* Estilos para el botón "Volver a FAQs" */
    a {
      color: #428bca;
    }
    </style>
	<title>Editar FAQ</title>
</head ><link rel="stylesheet" href="editarfaq.css">
<body>
	<h1>Editar FAQ</h1>

	<%
		if (request.getParameter("enviar") != null) {
			// Procesar los datos del formulario
			String pregunta = request.getParameter("pregunta");
			String respuesta = request.getParameter("respuesta");
			int id = Integer.parseInt(request.getParameter("id"));

			// Establecer la conexión con la base de datos
			String url = "jdbc:mysql://localhost:3306/proy";
			String usuario = "root";
			String contrasena = "n0m3l0";
			Connection conexion = DriverManager.getConnection(url, usuario, contrasena);

			// Actualizar la pregunta en la tabla
			PreparedStatement consulta = conexion.prepareStatement("UPDATE faqs SET question = ?, answer = ? WHERE id = ?");
			consulta.setString(1, pregunta);
			consulta.setString(2, respuesta);
			consulta.setInt(3, id);
			consulta.executeUpdate();

			// Cerrar la conexión con la base de datos
			conexion.close();

			// Redirigir a la página de FAQs
			response.sendRedirect("reportesCe3.jsp");
		} else {
			// Mostrar el formulario con los datos actuales
			int id = Integer.parseInt(request.getParameter("id"));

			// Establecer la conexión con la base de datos
			String url = "jdbc:mysql://localhost:3306/proy";
			String usuario = "root";
			String contrasena = "n0m3l0";
			Connection conexion = DriverManager.getConnection(url, usuario, contrasena);

			// Obtener los datos de la pregunta a editar
			PreparedStatement consulta = conexion.prepareStatement("SELECT question, answer FROM faqs WHERE id = ?");
			consulta.setInt(1, id);
			ResultSet resultado = consulta.executeQuery();
			resultado.next();
			String pregunta = resultado.getString("question");
			String respuesta = resultado.getString("answer");

			// Cerrar la conexión con la base de datos
			conexion.close();

			// Mostrar el formulario con los datos actuales
			%>
			<form method="post">
				<input type="hidden" name="id" value="<%=id%>">
				<label for="pregunta">Pregunta:</label>
				<input type="text" name="pregunta" value="<%=pregunta%>"><br>
				<label for="respuesta">Respuesta:</label>
				<textarea name="respuesta"><%=respuesta%></textarea><br>
				<input type="submit" name="enviar" value="Guardar">
			</form>
			<%
		}
	%>

	<br>
	<a href="reportesCe3.jsp">Volver a FAQs</a>
</body>
</html>