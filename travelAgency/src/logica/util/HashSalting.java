package logica.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

public class HashSalting {
    private static final int SALT_LENGTH = 16; // Longitud del salt en bytes
    private static final String HASH_ALGORITHM = "SHA-256"; // Algoritmo de hash, puedes cambiarlo si lo deseas
    
    /**
     * Toma una contraseña como entrada, genera un salt aleatorio,
     * combina la contraseña y el salt, y luego calcula el hash del resultado.
     * Devuelve el hash salteado en formato hexadecimal.
     * @param contraseña La contraseña ingresada por el usuario.
     * @return El hash salting.
     */
    
    public static String generarHashSalteado(String contraseña) {
        try {
            SecureRandom random = new SecureRandom();
            byte[] salt = new byte[SALT_LENGTH];
            random.nextBytes(salt);

            // Combina la contraseña con el salt
            byte[] contraseñaConSalt = new byte[contraseña.length() + SALT_LENGTH];
            System.arraycopy(contraseña.getBytes(), 0, contraseñaConSalt, 0, contraseña.length());
            System.arraycopy(salt, 0, contraseñaConSalt, contraseña.length(), SALT_LENGTH);

            MessageDigest md = MessageDigest.getInstance(HASH_ALGORITHM);
            byte[] hash = md.digest(contraseñaConSalt);

            // Convierte el hash y el salt a hexadecimal
            StringBuilder hashSalteado = new StringBuilder();
            for (byte b : hash) {
                hashSalteado.append(String.format("%02x", b));
            }
            hashSalteado.append(":");
            for (byte b : salt) {
                hashSalteado.append(String.format("%02x", b));
            }

            return hashSalteado.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * Toma una contraseña y un hash salteado como entrada,
     * verifica si la contraseña coincide con el hash almacenado.
     * Divide el hash salteado en el hash y el salt, recalcula el hash
     * de la contraseña ingresada con el salt almacenado y lo
     * compara con el hash guardado.
     * @param contraseña Contraseña ingresada por el usuario.
     * @param hashSalteado hash-salting consultado desde la base de datos.
     * @return true o flase
     */
    
    public static boolean validarContraseña(String contraseña, String hashSalteado) {
        try {
            String[] partes = hashSalteado.split(":");
            if (partes.length != 2) {
                return false; // El formato del hash salteado no es válido
            }

            byte[] hashGuardado = hexStringToByteArray(partes[0]);
            byte[] salt = hexStringToByteArray(partes[1]);

            // Combina la contraseña con el salt almacenado
            byte[] contraseñaConSalt = new byte[contraseña.length() + salt.length];
            System.arraycopy(contraseña.getBytes(), 0, contraseñaConSalt, 0, contraseña.length());
            System.arraycopy(salt, 0, contraseñaConSalt, contraseña.length(), salt.length);

            MessageDigest md = MessageDigest.getInstance(HASH_ALGORITHM);
            byte[] hashGenerado = md.digest(contraseñaConSalt);

            // Compara el hash generado con el hash guardado
            return MessageDigest.isEqual(hashGuardado, hashGenerado);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
    * La función hexStringToByteArray se utiliza para convertir una cadena
    * hexadecimal en un array de bytes en Java. En el contexto de la clase
    * HashSalting, se utiliza para convertir las representaciones
    * hexadecimales del hash y del salt de nuevo en arrays de bytes,
    * de modo que puedan ser utilizados en cálculos de hash y otras operaciones.
    * 
    * La función hexStringToByteArray realiza lo siguiente:
    * 
    * 1. Recibe una cadena hexadecimal como entrada (por ejemplo, "a1b2c3").
    * 2. Divide la cadena en pares de caracteres (por ejemplo, "a1", "b2", "c3").
    * 3. Convierte cada par de caracteres hexadecimal en su valor numérico
    *    equivalente, produciendo un byte (en este caso, "a1" se convierte
    *    en el byte 0xa1, "b2" se convierte en el byte 0xb2, y "c3"
    *    se convierte en el byte 0xc3).
    * 4. Almacena esos bytes en un array de bytes.
    * 
    * El resultado final es un array de bytes que representa la misma información que
    * la cadena hexadecimal original.
    * 
    * @param hex La cadena hexadecimal que se va a convertir en un array de bytes.
    * @return Un array de bytes que representa la información contenida en la cadena hexadecimal.
    */
    
    private static byte[] hexStringToByteArray(String hex) {
        int len = hex.length();
        byte[] byteArray = new byte[len / 2];
        for (int i = 0; i < len; i += 2) {
            byteArray[i / 2] = (byte) ((Character.digit(hex.charAt(i), 16) << 4)
                                 + Character.digit(hex.charAt(i+1), 16));
        }
        return byteArray;
    }
}
