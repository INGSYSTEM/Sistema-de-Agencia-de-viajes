package logica;

import java.time.LocalDate;

public class Personas {

    public Personas(int Id, String Nombre, String Apellido, String Numero_de_telefono, String Correo_electronico, String Genero) {
        this.Id = Id;
        this.Nombre = Nombre;
        this.Apellido = Apellido;
        this.Numero_de_telefono = Numero_de_telefono;
        this.Correo_electronico = Correo_electronico;
        this.Genero = Genero;
    }
    
    public Personas (String Genero) {
        this.Genero = Genero;
    }
           
    private int Id;
    private String Nombre;
    private String Apellido;
    private String Numero_de_telefono;
    private String Correo_electronico;
    private String Genero;
}
