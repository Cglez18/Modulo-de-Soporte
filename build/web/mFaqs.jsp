<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="style3.css">
    <style>
    body {
  font-family: Arial, sans-serif;
  background-color: #f2f2f2;
}

h1 {
  text-align: center;
}

table {
  width: 100%;
  border-collapse: collapse;
  margin: 20px 0;
}

th, td {
  padding: 10px;
  text-align: left;
  border: 1px solid #ddd;
}

th {
  background-color: #4CAF50;
  color: white;
}

tr:nth-child(even) {
  background-color: #f2f2f2;
}

a {
  text-decoration: none;
  color: #007bff;
}

a:hover {
  text-decoration: underline;
}
</style>
	<title>FAQs</title>
</head><link rel="stylesheet" href="mFaq.css">
<body>
	<h1>FAQs</h1>

	<%
		// Establecer la conexión con la base de datos
		String url = "jdbc:mysql://localhost:3306/proy";
		String usuario = "root";
		String contrasena = "n0m3l0";
		Connection conexion = DriverManager.getConnection(url, usuario, contrasena);

		// Mostrar la tabla de FAQs
		Statement consulta = conexion.createStatement();
		ResultSet resultados = consulta.executeQuery("SELECT * FROM faqs");

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
        <button class="ver-reportes" onclick="location.href='reportesCe3.jsp'" >Regresar</button>
</body>
</html>