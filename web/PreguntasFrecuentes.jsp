<%@ page import="java.sql.*" %>
<html>
</head><link rel="stylesheet" href="mFaq.css">
<style>
    nav {
  background-color: #58B0D6 ;
  height: 60px;
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
  font-size: 20px; /* Tamaño mayor para el botón activo */
  padding-top: 10px; /* Ajuste de la altura del botón */
}
    body {
  font-family: Arial, sans-serif;
  background-color: #f5f5f5;
}

.botones {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
}


button {
  padding: 10px 20px;
  font-size: 16px;
  font-weight: bold;
  color: #fff;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  transition: background-color 0.2s ease-in-out;
}

.ver-reportes {
  background-color: #007bff;
  margin-right: 10px;
}

.subir-reportes {
  background-color: #28a745;
  margin-right: 10px;
}

button:hover {
  background-color: #0056b3;
}

.ver-reportes:hover {
  background-color: #0056b3;
}

.subir-reportes:hover {
  background-color: #218838;
}

.salir{
    background-color: #c51350;
  margin-right: 10px;
}

.salir:hover {
  background-color: #8a1253;
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
    
    form {
        display: contents;
    }
    
    input[type=text] {
        border: none;
        background-color: transparent;
        width: 100%;
    }
    
    input[type=submit]:hover {
        background-color: #3e8e41;
    }
</style>
</head><!-- comment -->
<body>
   
    <br>
        <br>

<%
    // Conexión a la base de datos
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost/proy?user=root&password=n0m3l0");
        stmt = conn.createStatement();

        // Consulta SQL para obtener todos los datos de la tabla "faqs"
        String query = "SELECT * FROM faqs";
        rs = stmt.executeQuery(query);
        
        // Mostrar los datos en una tabla HTML
        out.print("<table>");
        out.print("<tr><th>ID</th><th>Pregunta</th><th>Respuesta</th></tr>");
        while (rs.next()) {
            String idF = rs.getString("id");
            String preg = rs.getString("question");
            String resp = rs.getString("answer");

            out.println("<form action='reportesEnviadoEditor2.jsp' method='post' name='subir2'>");
            out.print("<tr>");
            out.println("<td><input type='text' name='idFa' value='" + idF + "' readonly=readonly></td>");
            out.println("<td><input type='text' name='preguntas' value='" + preg + "' readonly=readonly></td>");
            out.println("<td><input type='text' name='respuestas' value='" + resp + "' readonly=readonly></td>");
            
            out.print("</tr>");
            out.println("</form>");
        }
        out.print("</table>");
       
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        // Cerrar la conexión con la base de datos
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
<br>
<footer><button class="salir" onclick="location.href='http://localhost:3000/PsicoGeneral.php'" >Regresar</button></footer>
<br>

</body><!-- <!doctype html> -->
</html>