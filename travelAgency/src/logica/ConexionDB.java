package logica;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Clase para gestionar la conexión a la base de datos.
 */
public class ConexionDB {
    static Connection connection;

    // Constructor de la clase
    public ConexionDB() throws ClassNotFoundException, SQLException {
        String url = "jdbc:sqlserver://localhost:1433;databaseName=LuminousHorizons";
        String user = "TestLuminousHorizons";
        String password = "Admin";

        // Registra el controlador JDBC
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

        // Establece la conexión
        connection = DriverManager.getConnection(url, user, password);
    }
}
