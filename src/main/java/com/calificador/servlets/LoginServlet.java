package com.calificador.servlets;

import com.calificador.models.Escuela;
import com.calificador.util.Autenticacion;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);


        Escuela e = new Escuela();

        //DATOS A LOS QUE ACCEDER
        e.nuevoProfesor("Pepe", "1234", "Matemáticas, Física");
        e.nuevoProfesor("Juan", "1234", "Informática");
        e.nuevoAlumno("Alicia", "2345");
        e.nuevoAlumno("Miguel", "2345");

        //creamos una sesion para mantener los datos mientras dure la sesion
        session.setAttribute("escuela", e);

        //recogemos login y contraseña
        String login = request.getParameter("login"); // Nombre de usuario
        String password = request.getParameter("password"); // Contraseña

        //autenticamos
        Autenticacion autenticacion = new Autenticacion(e);
        boolean isTeacher = autenticacion.autenticar(login, password);

        if (isTeacher) {
            request.setAttribute("nuevoFormulario","Adios profesor " + login);
            RequestDispatcher rd=request.getRequestDispatcher("/index.jsp");
            rd.include(request, response);
        } else {
            request.setAttribute("nuevoFormulario","Adiosdawd " + login);
            RequestDispatcher rd=request.getRequestDispatcher("/index.jsp");
            rd.include(request, response);
        }




        RequestDispatcher rd=request.getRequestDispatcher("/index.jsp");
        rd.include(request, response);
    }
}
