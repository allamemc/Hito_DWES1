package com.calificador.util;

import com.calificador.models.*;

public class Autenticacion {
    private Escuela escuela; 

    public Autenticacion(Escuela escuela) {
        this.escuela = escuela;
    }

    public boolean autenticar(String login, String password) {

        Usuario usuario = escuela.getUsuarios().get(login);


        if (usuario != null && usuario.getPassword().equals(password)) {
            if (usuario instanceof Profesor) {
                return true; 
            }
        }
        return false; 
    }
}

