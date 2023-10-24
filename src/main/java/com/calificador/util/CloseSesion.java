package com.calificador.util;

import com.calificador.models.Alumno;
import com.calificador.models.Calificacion;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "CloseSesion", value = "/CloseSesion")
public class CloseSesion extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        // Elimina solo la sesión llamada "usuario"
        session.removeAttribute("usuario");
        session.removeAttribute("alumno");

        // Redirige al usuario a index.jsp
        response.sendRedirect("index.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}