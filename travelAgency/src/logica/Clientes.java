package logica;

import java.time.LocalDate;

public class Clientes extends Personas{

    public Clientes(String Genero, LocalDate Fecha_de_nacimiento,
            String Direccion, String Estado_o_Provincia, String codigo_postal,
            Usuarios Id_usuario, int Id, String Nombre, String Apellido,
            String Numero_de_telefono, String Correo_electronico) {
        super(Id, Nombre, Apellido, Numero_de_telefono, Correo_electronico);
        this.Genero = Genero;
        this.Fecha_de_nacimiento = Fecha_de_nacimiento;
        this.Direccion = Direccion;
        this.Estado_o_Provincia = Estado_o_Provincia;
        this.codigo_postal = codigo_postal;
        this.Id_usuario = Id_usuario;
    }
    
    private String Genero;
    private LocalDate Fecha_de_nacimiento;
    private String Direccion;
    private String Estado_o_Provincia;
    private String codigo_postal;
    private Usuarios Id_usuario;
}
