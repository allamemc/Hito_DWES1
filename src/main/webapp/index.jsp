<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Calification 3000</title>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
            crossorigin="anonymous"
    />
    <link rel="stylesheet" href="./css/style.css" />
    <link
            href="https://api.fontshare.com/v2/css?f[]=satoshi@500,501&f[]=stardom@400&display=swap"
            rel="stylesheet"
    />
</head>
<body>
<div class="caja_flex">
    <div class="caja a">
        <h1 style="text-align: center">Sistema de <i>Calificaciones</i></h1>
        <div class="miniflex" style="display: ${displayForm}">
            <form action="LoginServlet" method="post">
                <div class="form_caja">
                    <input
                            type="text"
                            name="login"
                            id="login"
                            class="inputs"
                            placeholder="Usuario"
                    />
                </div>
                <div class="form_caja">
                    <input
                            type="password"
                            name="password"
                            id="password"
                            class="inputs"
                            placeholder="Contraseña"
                    />
                </div>
                <div class="form_caja b">
                    <button type="submit" class="envio">Enviar</button>
                </div>
            </form>
        </div>
        ${nuevoFormulario}
    </div>
    <!--<div class="caja b">
        <div class="caja_i">
          <span id="span">${respuesta}</span>
           <h4>Listado Alumnos</h4>
          <ul>
            <li><a href="ProcesarAlumnos?user=Alicia">Alicia</a></li>
          </ul>
          <button type="submit" class="envio c" href="ProcesarAlumnos?cerrarse=true">Cerrar Sesion</button>

        </div>
      </div>
      -->
</div>

<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"
></script>
<script
        type="module"
        src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"
></script>
<script
        nomodule
        src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"
></script>
</body>
</html>
