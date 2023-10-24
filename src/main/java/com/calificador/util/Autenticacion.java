package com.calificador.util;

import com.calificador.models.*;

public class Autenticacion {
    private Escuela escuela; 

    public Autenticacion(Escuela escuela) {
        this.escuela = escuela;
    }

    public String autenticar(String login, String password) {

        Usuario usuario = escuela.getUsuarios().get(login);
        String respuesta = "";

        if (usuario != null && usuario.getPassword().equals(password)) {
            if (usuario instanceof Profesor) {
                respuesta = "Profesor";
            }else if (usuario instanceof Alumno){
                respuesta = "Alumno";
            }else{
                respuesta = "None";
            }
        }
        return respuesta;
    }
}

