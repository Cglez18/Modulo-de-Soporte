<%@ page import= "java.sql.*" %>

<%! String ing = null; %>


<html>
  <head>
    <meta charset="UTF-8">
    <title>Asignar</title>
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
  </style>
  </head>
  <body>
      <nav>
      <ul>
    <li><a href="gerSop.jsp" >Regresar</a></li>
  </ul>
  </nav>
      <h1> Bienvenido Gerente de Soporte </h1><!--  -->
      <h2>¿Que quieres hacer hoy?</h2>
      

    <div class="botones" select name='inge'>
        <form action="altaReporteEnProcesoMan.jsp" method="post">
           
      <input type='submit' name='altaReporteEnProcesoMan.jsp' value='Asignar gMant1'> Asignar al gerente de mantenimiento 1 </button>

      <input type='submit' name='altaReporteEnProcesoMan.jsp' value='Asignar gMant2'> Asignar al gerente de mantenimiento 2</button>
        </form><form action="altaReporteEnProceso.jsp" method="post">
      <input type='submit' name='altaReporteEnProceso.jsp' value='Asignar ingSop1'> Asignar al ingeniero de soporte 1</button>
      <input type='submit' name='altaReporteEnProceso.jsp' value='Asignar ingSop2'>Asignar al ingeniero de soporte 2</button>
    </form></div>

  </body>
</html>