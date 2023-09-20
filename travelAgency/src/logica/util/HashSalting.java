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
     * Nos permite hacer un test de hash-salting.
     * @param args
     */
    public static void main(String[] args) {
        System.out.println(generarHashSalteado("PASSWORD"));
    }
}
