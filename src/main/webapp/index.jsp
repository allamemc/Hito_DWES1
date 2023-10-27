<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Inicio - Portal Educativo</title>
    <link rel="stylesheet" href="./css/style.css"/>
    <link rel="icon" type="image/x-icon" href="./css/icon.svg"/>
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
    <link
            href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet"
    />
</head>
<body>
<%
    String usuario = (String) session.getAttribute("usuario");

%>
<div class="background-svg"></div>
<nav>
    <div class="navbar">
        <div class="school">
            <div class="overlap-group">
                <img class="vector" src="./css/icon.svg"/>
            </div>
        </div>
        <div class="label">
            <a class="text-wrapper" href="index.jsp" style="text-decoration: none">Portal Educativo</a>
        </div>
        <%

            if (usuario == null) {
        %>
        <a href="./login.jsp" class="boton">Iniciar Sesion</a>
        <%
        } else {
        %>
        <a href="<%if (usuario.equals("alumno")) { %>alumno.jsp" class="boton">Panel</a><%
    } else {
    %>profesor.jsp" class="boton">Panel</a>
        <%
            }
        %>
        <%
            }
        %>

    </div>
    <div class="box"></div>
</nav>
<header class="header">
    <h1 class="heading-primary">
        <span class="heading-primary-main">tus calificaciones</span>
        <span class="heading-primary-sub">En cualquier momento</span>
    </h1>
</header>
<div class="descripcion">
    <div class="titulo">
        <div class="title-notice">
            <span class="titulo-main">Portal de para Profesores</span>
            <cite class="titulo-sub"
            >Bienvenidos al Portal de Calificaciones para Profesores, tu
                herramienta completa y eficiente para administrar...</cite
            >
            <span class="text-box"></span>
            <p>
                Nuestra plataforma proporciona a los docentes una experiencia
                única en la gestión de calificaciones. Con nuestras
                características avanzadas, podrás ingresar, evaluar y dar
                seguimiento a las calificaciones de tus clases de manera eficaz.
                Ya no tendrás que preocuparte por la tediosa tarea de llevar
                registros en papel; en su lugar, podrás disfrutar de las ventajas
                de un sistema en línea seguro y fácil de usar.
            </p>

            <p>Nuestro Portal de Calificaciones para Profesores ofrece:</p>

            <ul>
                <li>
                    Registro y actualización de calificaciones de forma rápida.
                </li>
                <li>
                    Acceso seguro desde cualquier lugar y en cualquier momento.
                </li>
                <li>
                    Gráficos y estadísticas para evaluar el progreso de tus
                    estudiantes.
                </li>
                <li>
                    Notificaciones automáticas para mantener a los alumnos y padres
                    informados.
                </li>
                <li>
                    Herramientas de informes y análisis para tomar decisiones
                    educativas fundamentadas.
                </li>
            </ul>
            <p>
                No pierdas más tiempo en la gestión de calificaciones. Únete a
                nosotros y mejora la eficiencia de tu labor docente.
            </p></span
                >
        </div>
    </div>
    <div class="contenido">

    </div>
</div>
<footer>
    <div id="footer">2023 &copy; Portal Educativo</div>
</footer>
</body>
</html>

