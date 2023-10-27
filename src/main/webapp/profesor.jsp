<%--
  Created by IntelliJ IDEA.
  User: Allam
  Date: 24/10/2023
  Time: 16:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.calificador.models.*" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login - Portal Educativo</title>
    <link rel="icon" type="image/x-icon" href="./css/icon.svg" />
    <link rel="stylesheet" href="./css/style.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
            href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet"
    />
</head>
<body>
<%
    String usuario = (String) session.getAttribute("usuario");
    if (usuario == null || !usuario.equals("profesor")) {
        response.sendRedirect("login.jsp");
    } else {
%>
<div class="background-svg"></div>
<nav>
    <div class="navbar">
        <div class="school">
            <div class="overlap-group">
                <img class="vector" src="./css/icon.svg" />
            </div>
        </div>
        <div class="label">
            <a class="text-wrapper" href="index.jsp" style="text-decoration: none">Portal Educativo</a>
        </div>
        <a href="CloseSesion" class="boton">Cerrar Sesión</a>
    </div>
    <div class="box"></div>
</nav>
<section>
    <div class="label2">
        <div class="text-wrapper b panel">
            <%
            String nombre = (String) session.getAttribute("login");
            Alumno alumno = (Alumno) session.getAttribute("alumno");
            %>
            Hola, <%= nombre %>!
            <div style="font-size: 15px">Aqui podras ver datos de los alumnos</div>

        </div>

        <div class="caja_flex">
            <div class="listado">
                <h3>Listado Alumnos</h3>
                <ul>
                    <%
                        // Obtener la instancia de Escuela desde la sesión
                        Escuela escuela = (Escuela) session.getAttribute("escuela");

                        if (escuela != null) {
                            for (Usuario user : escuela.getUsuarios().values()) {
                                if (user instanceof Alumno) {
                    %>
                    <li><a href="profesor?alumno=<%=user.getLogin()%>"><%= user.getLogin() %></a></li>
                    <%
                                }
                            }
                        }
                    %>
                </ul>
            </div>

            <div class="informacion">
                <h3>Ficha del Alumno</h3>
                <div class="ficha">
                    <span><% if (alumno != null) { %>
        <%= alumno.getLogin() %>
    <% } %></span>
                    <table>
                        <tr>
                            <th>Profesor</th>
                            <th>Asignatura</th>
                            <th>Nota</th>
                        </tr>
                        <%
                            if (alumno != null) {
                                ArrayList<Calificacion> calificaciones = (ArrayList<Calificacion>) session.getAttribute("calificaciones_"+alumno.getLogin());
                                if (calificaciones != null) {
                                    for (Calificacion calificacion : calificaciones) {
                        %>
                        <tr>
                            <td><%= calificacion.getProfesor().getLogin() %></td>
                            <td><%= calificacion.getAsignatura() %></td>
                            <td><%= calificacion.getNota() %></td>
                        </tr>
                        <%
                                }
                            }
                            }
                        %>
                    </table>
                    <div class="container b">
                        <form action="profesor" method="post">
                            <div class="form-group">
                                <label for="asig">Nueva Asignatura</label>
                                <input
                                        type="text"
                                        id="asig"
                                        name="asig"
                                        placeholder="e.g. Lengua"
                                        required
                                />
                            </div>
                            <div class="form-group">
                                <label for="nota">Nota (0/100)</label>
                                <input
                                        type="number"
                                        min="0" max="100"
                                        id="nota"
                                        name="nota"
                                        placeholder="e.g. 100"
                                        required
                                />
                            </div>
                                <%
                            if (alumno != null) {




                                %>
                            <div style="text-align: center">
                                <button type="submit" class="envio">Añadir</button>
                            </div>
                            <%
                                }
                            %>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<footer>
    <div id="footer">2023 &copy; Portal Educativo</div>
</footer>
<%
    }
%>
</body>
</html>

