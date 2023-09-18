package logica;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;

public class Empleados extends Personas{

    public Empleados(int Id, String Nombre, String Apellido, String Numero_de_telefono, String Correo_electronico, String Genero) {
        super(Id, Nombre, Apellido, Numero_de_telefono, Correo_electronico, Genero);
    }

    public Empleados(String Genero) {
        super(Genero);
    }   
       
    
    public String VarificarGenero () throws ClassNotFoundException, SQLException {
        Usuarios usuarios =  new Usuarios();
        String rpta = "";
        ConexionDB conexion = new ConexionDB();
        Statement st;
        ResultSet rs;
        String ConsultaSql = "SELECT e.Genero FROM Usuarios AS u INNER JOIN Empleados AS e ON u.Id_usuario = e.Id_usuario WHERE u.Nombre_de_usuario = '" + usuarios.getNombre_usuario() + "' AND u.Clave = '"+ usuarios.getClave() +"'";
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
    
    private String Puesto;
    private LocalDate Fecha_de_contratacion;
    private Usuarios Id_usuario;
}
