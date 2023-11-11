<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Agregar nueva FAQ</title>
</head><style> form {
  display: flex;
  flex-direction: column;
  align-items: center;
  margin: 20px;
}

label, input, textarea {
  margin: 10px 0;
}

input[type="text"], textarea {
  width: 100%;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
}

input[type="submit"] {
  background-color: #4CAF50;
  color: white;
  padding: 10px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type="submit"]:hover {
  background-color: #45a049;
}

/* Estilos para los mensajes de error */
.error {
  color: red;
  font-weight: bold;
  margin: 10px;
  text-align: center;
}

/* Estilos para el botón de volver */
a {
  display: block;
  margin: 20px;
  text-align: center;
  text-decoration: none;
  color: #4CAF50;
  font-weight: bold;
}

a:hover {
  text-decoration: underline;
} </style>
<body>
	<h1>Agregar nueva FAQ</h1>

	<%
		if (request.getParameter("enviar") != null) {
			// Procesar el formulario
			String pregunta = request.getParameter("pregunta");
			String respuesta = request.getParameter("respuesta");
                        String status = "FCerrado";

			// Validar los datos
			if (pregunta.isEmpty() || respuesta.isEmpty()) {
				out.print("Error: Todos los campos son obligatorios.");
			} else {
				// Establecer la conexión con la base de datos
				String url = "jdbc:mysql://localhost:3306/proy";
			String usuario = "root";
			String contrasena = "n0m3l0";
				Connection conexion = DriverManager.getConnection(url, usuario, contrasena);
                                
				// Insertar los datos en la tabla
				PreparedStatement consulta = conexion.prepareStatement("INSERT INTO faqs (question, answer, estado) VALUES ('" + pregunta + "', '" + respuesta + "', '" + status + "')");
				
				consulta.executeUpdate();

				// Cerrar la conexión con la base de datos
				conexion.close();

				// Redirigir a la página de FAQs
				response.sendRedirect("reportesCe3.jsp");
			}
		}
	%>

	<form method="post">
		<label for="pregunta">Pregunta:</label>
		<input type="text" name="pregunta"><br>
		<label for="respuesta">Respuesta:</label>
		<textarea name="respuesta"></textarea><br>
                
		<input type="submit" name="enviar" value="Agregar">
	</form>

	<br>
	<a href="reportesCe3.jsp">Volver a FAQs</a>
</body>
</html>