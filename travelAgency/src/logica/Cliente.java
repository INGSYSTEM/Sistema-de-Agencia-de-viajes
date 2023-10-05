package logica;

import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Cliente extends Persona {
    private String usuario;
    private String contrasena;
    private int trabajaEmpresa;
    private int codeVerificacion;
    
    // Constructores

    public Cliente(String usuario, String contrasena, int trabajaEmpresa, String nombre, String apellido, String genero, String email) {
        super(nombre, apellido, genero, email);
        this.usuario = usuario;
        this.contrasena = contrasena;
        this.trabajaEmpresa = trabajaEmpresa;
    }

    public Cliente(String usuario, String contrasena) {
        super("", "", "", "");
        this.usuario = usuario;
        this.contrasena = contrasena;
    }

    public Cliente() {
        super("", "", "", "");       
    }
    
    
    // Método para autetificar al usuario
    public String Autenticar() throws ClassNotFoundException, SQLException {
        String rpta = "";
        ConexionDB conexion = new ConexionDB();
        ResultSet rs;
        String consultaSql = "SELECT * FROM CLIENTE WHERE usuario = '"+ usuario +"' AND contrasena = HASHBYTES('SHA2_256','"+ contrasena +"')";
        try {
            PreparedStatement pst = conexion.connection.prepareStatement(consultaSql);
            rs = pst.executeQuery();
            if (rs.next()) {
                rpta = ""; // Autenticación exitosa
            } else {
                rpta = "Error de autenticación"; // No se encontró el nombre de usuario
            }
        } catch(SQLException e) {
            System.err.println("Error: " + e);
            rpta = "Error de conexión"; // Error de conexión a la base de datos
        } finally {
            if (conexion.connection != null) {
                conexion.connection.close();
            }
        }
        return rpta;
    }

    // Método para obtener el nombre del cliente registrado
    public String obtenerNombreClientePorUsuario(String usuario) throws SQLException, ClassNotFoundException {
        ConexionDB conexion = new ConexionDB();
        String consultaSql = "SELECT nombre FROM CLIENTE WHERE usuario = ?";
        try (PreparedStatement ps = conexion.connection.prepareStatement(consultaSql)) {
            ps.setString(1, usuario); // Asigna el valor del usuario
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("nombre"); // Devuelve el nombre del cliente si se encuentra
                }
            }
        } catch (SQLException e) {
            System.err.println("Error: " + e);
            throw e;
        } finally {
            conexion.connection.close();
        }
        return null; // Si no se encuentra el usuario, devuelve null
    }
    
    // Método para saber el genero del cliente
    public String obtenerGeneroClientePorUsuario(String usuario) throws SQLException, ClassNotFoundException {
        ConexionDB conexion = new ConexionDB();
        String consultaSql = "SELECT genero FROM CLIENTE WHERE usuario = ?";
        try (PreparedStatement ps = conexion.connection.prepareStatement(consultaSql)) {
            ps.setString(1, usuario); // Asigna el valor del usuario
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("genero"); // Devuelve el género del cliente si se encuentra
                }
            }
        } catch (SQLException e) {
            System.err.println("Error: " + e);
            throw e;
        } finally {
            conexion.connection.close();
        }
        return null; // Si no se encuentra el usuario, devuelve null
    }
    
    // Método sacar el nombre apartir del email    
    public String obtenerNombreClientePorCorreo(String correo) throws SQLException, ClassNotFoundException {
        ConexionDB conexion = new ConexionDB();
        setEmail(correo);
        String consultaSql = "SELECT nombre FROM CLIENTE WHERE email = ?";
        try (PreparedStatement ps = conexion.connection.prepareStatement(consultaSql)) {
            ps.setString(1, getEmail()); // Asigna el valor del usuario
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("nombre"); // Devuelve el nombre del cliente si se encuentra
                }
            }
        } catch (SQLException e) {
            System.err.println("Error: " + e);
            throw e;
        } finally {
            conexion.connection.close();
        }
        return null; // Si no se encuentra el usuario, devuelve null
    }
    
    // Método para saber si el correo esta registrado en la base de datos
    public String autenticarCorreo(String correo) throws ClassNotFoundException, SQLException {
        String rpta = "";
        ConexionDB conexion = new ConexionDB();
        ResultSet rs;
        String consultaSql = "SELECT * FROM CLIENTE WHERE email = '"+ correo +"'";
        try {
            PreparedStatement pst = conexion.connection.prepareStatement(consultaSql);
            rs = pst.executeQuery();
            if (rs.next()) {
                rpta = ""; // Autenticación exitosa
            } else {
                rpta = "Error de autenticación"; // No se encontró el nombre de usuario
            }
        } catch(SQLException e) {
            System.err.println("Error: " + e);
            rpta = "Error de conexión"; // Error de conexión a la base de datos
        } finally {
            if (conexion.connection != null) {
                conexion.connection.close();
            }
        }
        return rpta;
    }
    
    // Función para ver si el correo ya esta registrado con otra persona
    
    public String verificarEmailExistente(String email) throws ClassNotFoundException, SQLException {
        String rpta = "";
        ConexionDB conexion = new ConexionDB();
        ResultSet rs;
        String consultaSql = "SELECT * FROM CLIENTE WHERE email = '" + email + "'";
        try {
            PreparedStatement pst = conexion.connection.prepareStatement(consultaSql);
            rs = pst.executeQuery();
            if (rs.next()) {
                rpta = ""; // Autenticación exitosa
            } else {
                rpta = "Error de verificación"; // No se encontró el email
            }
        } catch(SQLException e) {
            System.err.println("Error: " + e);
            rpta = "Error de conexión"; // Error de conexión a la base de datos
        } finally {
            if (conexion.connection != null) {
                conexion.connection.close();
            }
        }
        return rpta;
    }
}
