<%--
  Created by IntelliJ IDEA.
  User: Allam
  Date: 24/10/2023
  Time: 16:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <a href="./index.jsp" class="boton">Inicio</a>
  </div>
  <div class="box"></div>
</nav>
<section>
  <%
    String usuario = (String) session.getAttribute("usuario");
    if (usuario != null) {
      response.sendRedirect("index.jsp");
    } else {
  %>
  <div class="label2">
    <div class="text-wrapper b">Iniciar Sesion</div>
  </div>
  <div class="container">
    <form action="LoginServlet" method="post">
      <div class="form-group">
        <label for="username">Usuario</label>
        <input
                type="text"
                id="username"
                name="login"
                placeholder="e.g. juan"
                required
        />
      </div>
      <div class="form-group">
        <label for="password">Contraseña</label>
        <input
                type="password"
                id="password"
                name="password"
                placeholder="1234******"
                required
        />
      </div>
      <div style="text-align: center">
        <button type="submit" class="envio">Enviar</button>
      </div>
      <a href="" class="enlace"><h3>No tengo cuenta</h3></a>
      ${respuesta}
    </form>
  </div>
</section>
<%
  }
%>
</body>
</html>

