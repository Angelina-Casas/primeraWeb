<%@ page import="Modelos.AulaBD" %>
<%@ page import="Modelos.Aula" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    AulaBD aulaBD = new AulaBD();
    java.util.List<Aula> aulas = aulaBD.listarAulas();
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Gestión de Aulas</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<h1>Gestión de Aulas</h1>

<table border="1">
    <tr>
        <th>ID</th><th>Grado</th><th>Sección</th><th>Acciones</th>
    </tr>
    <%
        for (Aula aula : aulas) {
    %>
        <tr>
            <td><%= aula.getIdAula() %></td>
            <td><%= aula.getGrado() %></td>
            <td><%= aula.getSeccion() %></td>
            <td>
                <form action="editar_aula.jsp" method="post" style="display:inline;">
                    <input type="hidden" name="id" value="<%= aula.getIdAula() %>">
                    <input type="submit" value="Editar">
                </form>
                <form action="eliminar_aula.jsp" method="post" style="display:inline;">
                    <input type="hidden" name="id" value="<%= aula.getIdAula() %>">
                    <input type="submit" value="Eliminar">
                </form>
            </td>
        </tr>
    <%
        }
    %>
</table>

<h2>Agregar Nueva Aula</h2>
<form action="agregar_aula.jsp" method="post">
    Grado: <input type="text" name="grado" required>
    Sección: <input type="text" name="seccion" required>
    <input type="submit" value="Agregar">
</form>
</body>
</html>
