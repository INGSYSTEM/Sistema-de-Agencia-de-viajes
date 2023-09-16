package logica.util;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Random;
import logica.ConexionDB;


/**
 *
 * @author Juan Romero
 */
public class CodigosVerifict {
    int[] numeros = {0,1,2,3,4,5,6,7,8,9};
    String codigo = "";
    public int codigo () {
        for (int i = 0; i < 4; i++) {
            Random rand = new Random();
            int randomIndex = rand.nextInt(numeros.length);
            int randomNum = numeros[randomIndex];
            codigo += String.valueOf(randomNum);
        }
        return Integer.parseInt(codigo);
    }
    public String updateCodigo(int code, int id) throws ClassNotFoundException, SQLException {
        String rpta = "";
        ConexionDB conexion = new ConexionDB();
        Statement st;
        ResultSet rs;
        String ConsultaSql = "UPDATE Usuarios SET numero_verificacion =" + code + "WHERE Id_usuario = " + id;
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
}
