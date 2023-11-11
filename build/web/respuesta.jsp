<%@ page import="java.sql.*"%>
<%! String perfil = null;%>
<%! String cont = null;%>

<%! Connection conn;%>
<%! Statement stmt;%>
<%! ResultSet rs=null;%>
<%!String query = "SELECT * FROM usuario"; %>
<html Lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style2.css">
        <%  
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection("jdbc:mysql://localhost/proy?user=root&password=n0m3l0");
            stmt = conn.createStatement();
            
            perfil = request.getParameter("perfil");
            cont = request.getParameter("contra");
            
            rs = stmt.executeQuery (query);
            rs = stmt.executeQuery("select * from usuario where perfil='"+perfil+"' and contra='"+cont+"';");
        %>
    </head>
    <body>
        <%  
        if (!rs.next()) {
            out.println("<script>alert('no existe la persona.')</script>");
        } else {
            
            if (cont.equals("asis02")) {
            %>
               
                <h1>Bienvenido Asistente</h1>
                <button onclick="location.href='consultas20.jsp'">Iniciar</button>
                
           <%  }

        else{
            if (cont.equals("gsop03")) {
            %>
                <h1>Bienvenido Gerente de Soporte</h1>
                <button onclick="location.href='gerSop.jsp'">Iniciar</button>
                
           <%  }
        }
          if (cont.equals("gman04")) {
            %>
                <h1>Bienvenido Gerente de Mantenimiento</h1>
                <button onclick="location.href='gManJunto.jsp'">Iniciar</button>
                
           <%  }
        
           else{
            if (cont.equals("isop05")) {
            %>
                <h1>Bienvenido Ingeniero de Soporte</h1>
                <button onclick="location.href='solucionarReportesSop.jsp'">Iniciar</button>
                
           <%  }
        }
            if (cont.equals("iman06")) {
            %>
                <h1>Bienvenido Ingeniero de Mantenimiento</h1>
                <button onclick="location.href='enProgramacion.jsp'">Iniciar</button>
                
           <%  }
           
           else{
            if (cont.equals("editor07")) {
            %>
                <h1>Bienvenido Editor</h1>
                <button onclick="location.href='reportesCe3.jsp'">Iniciar</button>
            
             <%  }
           
        }
            if (cont.equals("gman08")) {
            %>
               
                <h1>Bienvenido Gerente de Mantenimiento2</h1>
                <button onclick="location.href='gManJunto2.jsp'">Iniciar</button>
                
           <%  }

        else{
            if (cont.equals("isop09")) {
            %>
                <h1>Bienvenido Ingeniero de Soporte2</h1>
                <button onclick="location.href='solucionarReportesSop4.jsp'">Iniciar</button>
                
           <%  }
        }
          if (cont.equals("iman10")) {
            %>
                <h1>Bienvenido Ingeniero de Mantenimiento2</h1>
                <button onclick="location.href='enProgramacion3.jsp'">Iniciar</button>
                
           <%  }
       
            
}
        try {
            rs.close();
            stmt.close();
            conn.close();
            out.close();
        } catch (SQLException sqlEx) {

        };
        %>
    </body>
</html>
