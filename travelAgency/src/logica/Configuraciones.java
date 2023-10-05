package logica;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.swing.DefaultComboBoxModel;
import javax.swing.JComboBox;

/**
 *
 * @author Juan Romero
 */
public class Configuraciones {
    // Método para poder llenar el combobox de países
    public void llenarComboBoxDestino(JComboBox<String> comboBox) throws SQLException, ClassNotFoundException {
        ConexionDB conexion = new ConexionDB();
        String consultaSql = "SELECT nombre_destino FROM DESTINO ORDER BY nombre_destino";
        DefaultComboBoxModel<String> modelo = new DefaultComboBoxModel<>();
        try (PreparedStatement ps = conexion.connection.prepareStatement(consultaSql)) {
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    String nombreDestino = rs.getString("nombre_destino");
                    modelo.addElement(nombreDestino);
                }
            }
        } catch (SQLException e) {
            System.err.println("Error: " + e);
            throw e;
        } finally {
            conexion.connection.close();
        }
        comboBox.setModel(modelo);
    }
    
    public void llenarComboBoxOrigen(JComboBox<String> comboBox) throws SQLException, ClassNotFoundException {
        ConexionDB conexion = new ConexionDB();
        String consultaSql = "SELECT origen FROM VUELO GROUP BY origen ORDER BY origen";
        DefaultComboBoxModel<String> modelo = new DefaultComboBoxModel<>();
        try (PreparedStatement ps = conexion.connection.prepareStatement(consultaSql)) {
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    String nombreDestino = rs.getString("origen");
                    modelo.addElement(nombreDestino);
                }
            }
        } catch (SQLException e) {
            System.err.println("Error: " + e);
            throw e;
        } finally {
            conexion.connection.close();
        }
        comboBox.setModel(modelo);
    }
    
    // Método para poder registrar Clientes
    public void registrarCliente (String nombres, String apellidos, String email,
            String usuario, String contrasena, String genero) {
        
    }
    
    public String obtenerCodigoVerificacion (String email) throws SQLException, ClassNotFoundException {
        ConexionDB conexion = new ConexionDB();
        String consultaSql = "SELECT codeVerificacion FROM CLIENTE WHERE email = ?";
        try (PreparedStatement ps = conexion.connection.prepareStatement(consultaSql)) {
            ps.setString(1, email); // Asigna el valor del email
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("codeVerificacion"); // Devuelve el código de verificación
                }
            }
        } catch (SQLException e) {
            System.err.println("Error: " + e);
            throw e;
        } finally {
            conexion.connection.close();
        }
        return null; // Si no se encuentra el código de verifiación, devuelve null
    }
    
    public void actualizarCodigoVerificacion(String email, String nuevoCodigo) throws SQLException, ClassNotFoundException {
        ConexionDB conexion = new ConexionDB();
        String consultaSql = "UPDATE CLIENTE SET codeVerificacion = '"+ nuevoCodigo+ "' WHERE email = '"+ email +"'";
        try (PreparedStatement ps = conexion.connection.prepareStatement(consultaSql)) {
            ps.executeUpdate(); // Ejecuta la actualización
        } catch (SQLException e) {
            System.err.println("Error: " + e);
            throw e;
        } finally {
            conexion.connection.close();
        }
    }

    public void actualizarContrasena(String email, char[] contrasena) throws SQLException, ClassNotFoundException {
        ConexionDB conexion = new ConexionDB();
        String consultaSql = "UPDATE CLIENTE SET contrasena = HASHBYTES('SHA2_256','"+ new String(contrasena) + "') WHERE email = '"+ email +"'";
        try (PreparedStatement ps = conexion.connection.prepareStatement(consultaSql)) {
            ps.executeUpdate(); // Ejecuta la actualización
        } catch (SQLException e) {
            System.err.println("Error: " + e);
            throw e;
        } finally {
            conexion.connection.close();
        }
    }
    
    public void standarCodigoVerificacion(String email) throws SQLException, ClassNotFoundException {
        ConexionDB conexion = new ConexionDB();
        String consultaSql = "UPDATE CLIENTE SET codeVerificacion = NULL WHERE email = '"+ email +"'";
        try (PreparedStatement ps = conexion.connection.prepareStatement(consultaSql)) {
            ps.executeUpdate(); // Ejecuta la actualización
        } catch (SQLException e) {
            System.err.println("Error: " + e);
            throw e;
        } finally {
            conexion.connection.close();
        }
    }
    
    // Función para validar email
    public boolean isValidEmail(String email) {
        // Patrón de expresión regular para verificar direcciones de correo electrónico
        String regex = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";

        // Compila la expresión regular en un patrón
        Pattern pattern = Pattern.compile(regex);

        // Crea un objeto Matcher para la dirección de correo electrónico proporcionada
        Matcher matcher = pattern.matcher(email);

        // Comprueba si la dirección de correo electrónico coincide con el patrón
        return matcher.matches();
    }

    // Función para validar contraseñas fuertes
    
    public boolean isStrongPassword(char[] password) {
        String passwordStr = new String(password);

        // Verifica si la contraseña tiene al menos 8 caracteres
        if (passwordStr.length() < 8) {
            return false;
        }

        // Verifica si la contraseña contiene al menos una letra mayúscula
        if (!passwordStr.matches(".*[A-Z].*")) {
            return false;
        }

        // Verifica si la contraseña contiene al menos un carácter especial
        if (!passwordStr.matches(".*[!@#$%^&*()].*")) {
            return false;
        }

        // Si pasa todas las verificaciones, la contraseña se considera fuerte
        return true;
    }
    
    public void insertarCliente(String nombre,
            String apellido, String email, String usuario, char [] contrasena,
            String genero) throws SQLException, ClassNotFoundException {
        ConexionDB conexion = new ConexionDB();
        String consultaSql = "INSERT INTO CLIENTE (nombre, apellido, email, usuario, contrasena, genero, trabajaEmpresa, codeVerificacion) VALUES ("
                + nombre + ", " + apellido + "," + email + ", " + usuario + ", HASHBYTES('SHA2_256','" + new String(contrasena) +  "'), " + genero + ", 1, NULL)";
        try (PreparedStatement ps = conexion.connection.prepareStatement(consultaSql)) {
            ps.executeUpdate(); // Ejecuta la inserción
        } catch (SQLException e) {
            System.err.println("Error: " + e);
            throw e;
        } finally {
            conexion.connection.close();
        }
    }
}
