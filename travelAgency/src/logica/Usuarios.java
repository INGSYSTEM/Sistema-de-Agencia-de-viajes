package logica;

public class Usuarios {

    public Usuarios(int Id_usuario, String Nombre_usuario, String Contrasena_hash) {
        this.Id_usuario = Id_usuario;
        this.Nombre_usuario = Nombre_usuario;
        this.Contrasena_hash = Contrasena_hash;
    }
    
    private int Id_usuario;
    private String Nombre_usuario;
    private String Contrasena_hash;
}
