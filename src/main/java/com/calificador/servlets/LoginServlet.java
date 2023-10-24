package com.calificador.servlets;

import com.calificador.models.Alumno;
import com.calificador.models.Escuela;
import com.calificador.models.Profesor;
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
        e.nuevoProfesor("Luisa", "1234", "Historia");
        e.nuevoProfesor("Juan", "1234", "Informática");
        e.nuevoProfesor("Ana", "1234", "Biología");
        e.nuevoProfesor("Carlos", "1234", "Química");
        e.nuevoProfesor("Elena", "1234", "Lengua");
        e.nuevoProfesor("Sofía", "1234", "Arte");
        e.nuevoProfesor("Pedro", "1234", "Música");
        e.nuevoProfesor("María", "1234", "Educación Física");
        e.nuevoProfesor("Javier", "1234", "Geografía");
        e.nuevoAlumno("Alicia", "2345");
        e.nuevoAlumno("Miguel", "2345");
        e.nuevoAlumno("Juan", "2345");
        e.nuevoAlumno("Ana", "2345");
        e.nuevoAlumno("Pedro", "2345");
        e.nuevoAlumno("Luis", "2345");
        e.nuevoAlumno("Elena", "2345");
        e.nuevoAlumno("Sofía", "2345");
        e.nuevoAlumno("Carlos", "2345");
        e.nuevoAlumno("Laura", "2345");



        //creamos una sesion para mantener los datos mientras dure la sesion
        session.setAttribute("escuela", e);

        //recogemos login y contraseña
        String login = request.getParameter("login"); // Nombre de usuario
        String password = request.getParameter("password"); // Contraseña

        //autenticamos
        Autenticacion autenticacion = new Autenticacion(e);
        String authUser = autenticacion.autenticar(login, password);

        if (authUser.equals("Profesor")) {
            Profesor profesor = (Profesor) e.getUsuarios().get(login);

            // Guarda la instancia de Profesor en la sesión
            session.setAttribute("usuario", "profesor");
            session.setAttribute("login", login);
            session.setAttribute("profesorLogueado", profesor);
            RequestDispatcher rd=request.getRequestDispatcher("/profesor.jsp");
            rd.include(request, response);
        } else if (authUser.equals("Alumno")){
            Alumno alumno = (Alumno) e.getUsuarios().get(login);

            // Guarda la instancia de Alumno en la sesión
            session.setAttribute("usuario", "alumno");
            session.setAttribute("login", login);
            session.setAttribute("alumnoLogueado", alumno);
            RequestDispatcher rd=request.getRequestDispatcher("/alumno.jsp");
            rd.include(request, response);
        }else{
            request.setAttribute("respuesta", "<a href=\"\" class=\"enlace\"><h3 style='color:red;'>No existe</h3></a>");
            RequestDispatcher rd=request.getRequestDispatcher("/login.jsp");
            rd.include(request, response);
        }



    }
}
