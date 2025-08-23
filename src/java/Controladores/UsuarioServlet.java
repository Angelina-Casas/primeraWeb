package Controladores;

import Modelos.Usuario;
import Modelos.UsuarioBD;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Angelina
 */
@WebServlet(name = "UsuarioServlet", urlPatterns = {"/UsuarioServlet"})
public class UsuarioServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String correo = request.getParameter("correo");
        String password = request.getParameter("password");

        UsuarioBD usuarioBD = new UsuarioBD();
        Usuario usuario = usuarioBD.validarUsuario(correo, password);

        if (usuario != null) {
            // Crear sesión
            HttpSession session = request.getSession();
            session.setAttribute("usuario", usuario);

            // Obtener rol
            String rol = usuario.getRol().getNombreRol().toLowerCase();

            switch (rol) {
                case "administrador" -> response.sendRedirect("admin.jsp");
                case "docente" -> response.sendRedirect("docente.jsp");
                case "estudiante" -> response.sendRedirect("estudiante.jsp");
                default -> response.sendRedirect("error.jsp");
            }

        } else {
            // Usuario inválido
            request.setAttribute("error", "Usuario o contraseña incorrectos");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("login.jsp");
    }
}
