package logica;

import java.time.LocalDate;

public class Clientes {

    public Clientes(int Id_cliente, String Nombre, String Apellido, String Genero, LocalDate Fecha_de_nacimiento, String Direccion, String Estado_o_Provincia, String codigo_postal, String Numero_de_telefono, String Correo_electronico, Usuarios Id_usuario) {
        this.Id_cliente = Id_cliente;
        this.Nombre = Nombre;
        this.Apellido = Apellido;
        this.Genero = Genero;
        this.Fecha_de_nacimiento = Fecha_de_nacimiento;
        this.Direccion = Direccion;
        this.Estado_o_Provincia = Estado_o_Provincia;
        this.codigo_postal = codigo_postal;
        this.Numero_de_telefono = Numero_de_telefono;
        this.Correo_electronico = Correo_electronico;
        this.Id_usuario = Id_usuario;
    }
    
    private int Id_cliente;
    private String Nombre;
    private String Apellido;
    private String Genero;
    private LocalDate Fecha_de_nacimiento;
    private String Direccion;
    private String Estado_o_Provincia;
    private String codigo_postal;
    private String Numero_de_telefono;
    private String Correo_electronico;
    private Usuarios Id_usuario;
}
