package logica;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Usuarios {

    public Usuarios(int Id_usuario, String Nombre_usuario, String Contrasena_hash) {
        this.Id_usuario = Id_usuario;
        this.Nombre_usuario = Nombre_usuario;
        this.Contrasena_hash = Contrasena_hash;
    }
    
    public Usuarios(String Nombre_usuario, String Contrasena_hash) {
        this.Nombre_usuario = Nombre_usuario;
        this.Contrasena_hash = Contrasena_hash;
    }
    
    public String Autenticar() throws ClassNotFoundException, SQLException {
        String rpta = "";
        Statement st;
        ResultSet rs;
        String ConsultaSql = "SELECT * FROM Usuarios WHERE Nombre_usuario = '" + Nombre_usuario + "' AND Contrasena_hash = '" + Contrasena_hash + "'";
        try {
            st = ConexionDB.connection.createStatement();
            rs = st.executeQuery(ConsultaSql);
            if(rs.next()) {
                rpta = "se conectó: " + rs.getNString("Nombre");
            }
            ConexionDB.connection.close();
        } catch(SQLException e) {
            System.err.println("error: " + e);
        }
        return rpta;
    }
    
    private int Id_usuario;
    private String Nombre_usuario;
    private String Contrasena_hash;
}
