package logica;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import javax.imageio.ImageIO;
import net.glxn.qrgen.QRCode;

public class GenerarQR {

    public static void generarQR(String texto, String rutaCompleta) {
        ByteArrayOutputStream outStream = QRCode.from(texto).withSize(400, 400).stream();
        ByteArrayInputStream inputStream = new ByteArrayInputStream(outStream.toByteArray());

        try {
            BufferedImage bf = ImageIO.read(inputStream);

            File f = new File(rutaCompleta);
            ImageIO.write(bf, "png", f);

            System.out.println("Código QR generado y guardado como: " + f.getAbsolutePath());

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
