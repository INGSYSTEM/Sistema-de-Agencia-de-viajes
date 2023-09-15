package logica;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
/**
 *
 * @author Juan Romero
 */
public class ConexionDB {
    static Connection connection;

    public ConexionDB() throws ClassNotFoundException, SQLException {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String url = "jdbc:sqlserver://localhost:1433;database=LuminousHorizons";
        connection = DriverManager.getConnection(url, "sa", "Admin21");
    }
    
}
