<%@ page import="Modelos.Usuario" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache"); 
    response.setDateHeader("Expires", 0);   

    Usuario usuario = (Usuario) session.getAttribute("usuario");

    if (usuario == null || !usuario.getRol().getNombreRol().equalsIgnoreCase("administrador")) {
        response.sendRedirect("login.jsp");
        return;
    }
%>