package com.calificador.util;

public class ComponentesHTML {
	private String NUEVO_FORMULARIO = "<div class=\"miniflex\" style=\"display: ${displayForm}\">\r\n"
			+ "          <form action=\"Prueba\" method=\"post\">\r\n"
			+ "            <div class=\"form_caja\" >\r\n"
			+ "              <input\r\n"
			+ "                type=\"text\"\r\n"
			+ "                name=\"user\"\r\n"
			+ "                id=\"user\"\r\n"
			+ "                class=\"inputs\"\r\n"
			+ "                placeholder=\"Nombre Alumno\"\r\n"
			+ "              />\r\n"
			+ "            </div>\r\n"
			+ "            <div class=\"form_caja b\">\r\n"
			+ "              <button type=\"submit\" id=\"envio\">Enviar</button>\r\n"
			+ "            </div>\r\n"
			+ "          </form>\r\n"
			+ "        </div>";
	

	public String getNuevoFormulario() {
		return NUEVO_FORMULARIO;
	}

	public void setNuevoFormulario(String nuevoFormulario) {
		this.NUEVO_FORMULARIO = nuevoFormulario;
	}


	
	
}
