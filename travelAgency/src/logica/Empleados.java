package logica;

import java.time.LocalDate;

public class Empleados extends Personas{

    public Empleados(String Puesto, LocalDate Fecha_de_contratacion,
            Usuarios Id_usuario, int Id, String Nombre, String Apellido,
            String Numero_de_telefono, String Correo_electronico) {
        super(Id, Nombre, Apellido, Numero_de_telefono, Correo_electronico);
        this.Puesto = Puesto;
        this.Fecha_de_contratacion = Fecha_de_contratacion;
        this.Id_usuario = Id_usuario;
    }
    
    private String Puesto;
    private LocalDate Fecha_de_contratacion;
    private Usuarios Id_usuario;
}
