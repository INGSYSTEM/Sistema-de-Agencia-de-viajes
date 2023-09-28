package logica;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.DefaultComboBoxModel;
import javax.swing.JComboBox;

/**
 *
 * @author Juan Romero
 */
public class Configuraciones {
    // Método para poder llenar el combobox de países
    public void llenarComboBox(JComboBox<String> comboBox) throws SQLException, ClassNotFoundException {
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
    
    // Método para poder registrar Clientes
    public void registrarCliente (String nombres, String apellidos, String email,
            String usuario, String contrasena, String genero) {
        
    }
    
}
