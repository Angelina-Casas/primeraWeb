<%@ page import="Modelos.UsuarioBD" %>
<%@ page import="Modelos.Usuario" %>
<%@ page session="true" %>

<%
    String correo = request.getParameter("correo");
    String password = request.getParameter("password");

    UsuarioBD usuarioBD = new UsuarioBD();
    Usuario usuario = usuarioBD.validarUsuario(correo, password);

    if (usuario != null) {
        session.setAttribute("usuario", usuario);
        String rol = usuario.getRol().getNombreRol().toLowerCase();

        switch (rol) {
            case "administrador":
                response.sendRedirect("admin.html");
                break;
            case "docente":
                response.sendRedirect("docente.html");
                break;
            case "estudiante":
                response.sendRedirect("estudiante.html");
                break;
            default:
                out.println("<p>Rol no reconocido</p>");
        }
    } else {
        out.println("<p>Usuario o contraseña incorrectos</p>");
    }
%>