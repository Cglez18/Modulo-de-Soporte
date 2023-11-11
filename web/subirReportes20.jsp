<%@ page import= "java.sql.*" %>
<%@ page import= "java.io.*" %>
<%@ page import= "java.util.*" %>
<%@ page import= "java.text.*" %>

<%!Statement stmt = null;%>
<%!ResultSet rs = null; %>
<%!Connection conn = null; %>
<%!String query = "SELECT reporte.*, cliente.nom_cliente FROM reporte JOIN cliente ON reporte.id_cliente = cliente.id_cliente"; %>
<%
String idUsuario = request.getParameter("id");
%>
<html>
    <head>
        <title>Subir Reportes</title>
        <link rel="stylesheet" href="style3.css">
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f2f2f2;
            }
            h1 {
                text-align: center;
                margin-top: 50px;
                margin-bottom: 30px;
            }
            form {
                width: 500px;
                margin: 0 auto;
                background-color: #fff;
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0px 2px 5px rgba(0,0,0,0.3);
            }
            label {
                display: block;
                font-weight: bold;
                margin-bottom: 10px;
            }
            input[type="text"], textarea {
                width: 100%;
                padding: 10px;
                border: none;
                border-radius: 3px;
                margin-bottom: 20px;
                box-sizing: border-box;
                font-size: 16px;
                color: #666;
                background-color: #f2f2f2;
            }
            textarea {
                height: 150px;
            }
            button[type="submit"] {
                background-color: #4CAF50;
                color: #fff;
                padding: 10px 20px;
                border: none;
                border-radius: 3px;
                font-size: 16px;
                cursor: pointer;
            }
            button[type="submit"]:hover {
                background-color: #3e8e41;
            }
        </style>
    </head>
    <body>
        <h1>Crear nuevo reporte</h1>
        <form action="subirReportes2.jsp" method="post">
            
            <label for="nomC">Nombre del cliente:</label>
            <select name='nomC'><option value='iSop'>IngenieroSop1</option><option value='iSop2'>IngenieroSop2</option></select>
           
            
            <label for="desR">Descripción de reporte:</label>
            <textarea name="desR" required></textarea>
            
            
            <button type="submit">Crear reporte</button>
        </form>
            <footer><button class="salir" onclick="location.href='consultas20.jsp'" >Regresar</button></footer>
    </body>


</html>
<%@ page import= "java.sql.*" %>
<%@ page import= "java.io.*" %>
<%@ page import= "java.util.*" %>
<%@ page import= "java.text.*" %>


<html>
    <head>
        <title>Subir Reportes</title>
        <link rel="stylesheet" href="style3.css">
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f2f2f2;
            }
            h1 {
                text-align: center;
                margin-top: 50px;
                margin-bottom: 30px;
            }
            form {
                width: 500px;
                margin: 0 auto;
                background-color: #fff;
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0px 2px 5px rgba(0,0,0,0.3);
            }
            label {
                display: block;
                font-weight: bold;
                margin-bottom: 10px;
            }
            input[type="text"], textarea {
                width: 100%;
                padding: 10px;
                border: none;
                border-radius: 3px;
                margin-bottom: 20px;
                box-sizing: border-box;
                font-size: 16px;
                color: #666;
                background-color: #f2f2f2;
            }
            textarea {
                height: 150px;
            }
            button[type="submit"] {
                background-color: #4CAF50;
                color: #fff;
                padding: 10px 20px;
                border: none;
                border-radius: 3px;
                font-size: 16px;
                cursor: pointer;
            }
            button[type="submit"]:hover {
                background-color: #3e8e41;
            }
        </style>
    </head>
    <body>
        <h1>Crear nuevo reporte</h1>
        <form action="subirReportes2.jsp" method="post">
            
            <label for="id_cliente">ID de cliente:</label>
            <input type="text" name="id_cliente" value="<%= idUsuario %>" readonly>

            
            <label for="desR">Descripción de reporte:</label>
            <textarea name="desR" required></textarea>
            
            
            <button type="submit">Crear reporte</button>
        </form>
            <footer><button class="salir" onclick="location.href='consultas20.jsp'" >Regresar</button></footer>
    </body>


</html>