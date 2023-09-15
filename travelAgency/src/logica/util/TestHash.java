
package logica.util;

import static logica.util.HashSalting.generarHashSalteado;
import static logica.util.HashSalting.validarContrasena;
public class TestHash {
    public static void main(String[] args) {
       System.out.println(generarHashSalteado("Admin2023"));
       System.out.println(validarContrasena("Admin2023","11d13ab2f1f3aeec89d72497628c1154362643ffde14a49c729cc83891e55f63:4231a96339998951571a9d9977e72fa5"));
    }
}
