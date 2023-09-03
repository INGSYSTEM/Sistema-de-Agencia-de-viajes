package logica;

import java.time.LocalDate;

public class Empleados {

    public Empleados(int Id_empleado, String Nombre, String Apellido, String Puesto, LocalDate Fecha_de_contratacion, String Numero_de_telefono, String Correo_electronico, Usuarios Id_usuario) {
        this.Id_empleado = Id_empleado;
        this.Nombre = Nombre;
        this.Apellido = Apellido;
        this.Puesto = Puesto;
        this.Fecha_de_contratacion = Fecha_de_contratacion;
        this.Numero_de_telefono = Numero_de_telefono;
        this.Correo_electronico = Correo_electronico;
        this.Id_usuario = Id_usuario;
    }
    
    private int Id_empleado;
    private String Nombre;
    private String Apellido;
    private String Puesto;
    private LocalDate Fecha_de_contratacion;
    private String Numero_de_telefono;
    private String Correo_electronico;
    private Usuarios Id_usuario;
}
