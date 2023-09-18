package logica;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Usuarios {

    public Usuarios(int Id_usuario, String Nombre_usuario, String Contrasena_hash) {
        this.Id_usuario = Id_usuario;
        this.Nombre_usuario = Nombre_usuario;
        this.Clave = Contrasena_hash;
    }
    
    public Usuarios(String Nombre_usuario, String Contrasena_hash) {
        this.Nombre_usuario = Nombre_usuario;
        this.Clave = Contrasena_hash;
    } 

    public Usuarios() {
    }   
      
    public String Autenticar() throws ClassNotFoundException, SQLException {
        String rpta = "";
        ConexionDB conexion = new ConexionDB();
        Statement st;
        ResultSet rs;
        String ConsultaSql = "SELECT * FROM Usuarios WHERE Nombre_de_usuario = '" + Nombre_usuario + "' AND Clave = '" + Clave + "'";
        try {
            st = conexion.connection.createStatement();
            rs = st.executeQuery(ConsultaSql);
            if(rs.next()) {
                rpta = "se conectó: " + rs.getNString("Nombre");
            }
            conexion.connection.close();
        } catch(SQLException e) {
            System.err.println("error: " + e);
        }
        return rpta;
    }

    public int getId_usuario() {
        return Id_usuario;
    }

    public void setId_usuario(int Id_usuario) {
        this.Id_usuario = Id_usuario;
    }

    public String getNombre_usuario() {
        return Nombre_usuario;
    }

    public void setNombre_usuario(String Nombre_usuario) {
        this.Nombre_usuario = Nombre_usuario;
    }

    public String getClave() {
        return Clave;
    }

    public void setClave(String Clave) {
        this.Clave = Clave;
    }
    
    
    
    private int Id_usuario;
    private String Nombre_usuario;
    private String Clave;
}
