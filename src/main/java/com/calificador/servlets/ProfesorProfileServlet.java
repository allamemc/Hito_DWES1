package com.calificador.servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

import com.calificador.models.*;
import com.calificador.util.*;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class ProfesorProfileServlet
 */
@WebServlet(name = "ProfesorProfileServlet", value = "/profesor")
public class ProfesorProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfesorProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		String nombreAlumno = request.getParameter("alumno");

// Obtenemos la instancia de Escuela desde la sesión
		Escuela e = (Escuela) session.getAttribute("escuela");

// Buscamos el alumno por su nombre
		Alumno alumnoEncontrado = null;
		for (Usuario usuario : e.getUsuarios().values()) {
			if (usuario instanceof Alumno && usuario.getLogin().equals(nombreAlumno)) {
				alumnoEncontrado = (Alumno) usuario;
				break;
			}
		}

		session.setAttribute("alumno", alumnoEncontrado);

		RequestDispatcher rd = request.getRequestDispatcher("/profesor.jsp");
		rd.forward(request, response); // Usamos forward para redirigir

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		String asig = request.getParameter("asig");
		int nota = Integer.parseInt(request.getParameter("nota"));

// Obtén el alumno y el profesor logueado de la sesión
		Alumno alumno = (Alumno) session.getAttribute("alumno");
		Profesor profesorLogueado = (Profesor) session.getAttribute("profesorLogueado");

// Comprueba si ya existe una lista de calificaciones en la sesión para este alumno
		String attributeName = "calificaciones_" + alumno.getLogin();
		ArrayList<Calificacion> calificaciones = (ArrayList<Calificacion>) session.getAttribute(attributeName);

// Si no existe, crea una nueva lista de calificaciones
		if (calificaciones == null) {
			calificaciones = new ArrayList<Calificacion>();
		}

// Crea una nueva calificación
		Calificacion nuevaCalificacion = new Calificacion(profesorLogueado, asig, nota);

// Agrega la nueva calificación a la lista
		calificaciones.add(nuevaCalificacion);

// Actualiza el atributo de sesión con la lista actualizada
		session.setAttribute(attributeName, calificaciones);

		response.sendRedirect("profesor?alumno=" + alumno.getLogin());


	}

}
