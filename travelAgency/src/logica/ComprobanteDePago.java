package logica;

import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.PageSize;
import com.lowagie.text.pdf.PdfContentByte;
import java.awt.Graphics2D;
import java.awt.Image;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import javax.imageio.ImageIO;
import com.lowagie.text.pdf.PdfWriter;
import java.awt.Color;
import java.awt.Font;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import java.time.format.DateTimeFormatter;
import java.util.Locale;

public class ComprobanteDePago {
    public static void comprobante(String numeroDeLaOrden, String nombreApellido,
            String fechaDelVuelo, String vueloNumero, String asientoDesignado,
            String numeroReserva, String codigoDeLaReserva, String horaDesignadaDelIncioDelEmbarque,
            String horaDesignadaDelFinDelEmbarque, int numeroDeLaTerminal, int numeroDeLaPuerta,
            String numeroDelGrupoDeEmbarque, String descripcionDelEquipaje,
            String fechaDelOrigenDelVuelo, String horaDelOrigenDelVuelo, String zonaDeOrigen,
            String nombreDelAeropuertoDeOrigen, String fechaDelDestinoDelVuelo,
            String horaDelDestinoDelVuelo, String zonaDeDestino,
            String nombreDelAeropuertoDeDestino, String pathQR) throws IOException, DocumentException {
        String basePath = System.getProperty("user.dir"); // Obtiene la carpeta de trabajo actual del proyecto
        Document document = new Document(PageSize.HALFLETTER);
        PdfWriter pdfWriter = PdfWriter.getInstance(document,
                new FileOutputStream(basePath + "/src/comprobante/Ejemplo_pdf_java.pdf"));
        document.open();
        PdfContentByte pdfContentByte = pdfWriter.getDirectContent();
        Graphics2D graphics2D = pdfContentByte.createGraphics(PageSize.HALFLETTER.getWidth(), PageSize.HALFLETTER.getHeight());

        // Cargar las imágenes
        Image logo = ImageIO.read(new File(basePath + "/src/resources/img/logo_cabecera.png"));
        Image qrCode = ImageIO.read(new File(basePath + pathQR));
        
        // Colocar las especificaciones del vuelo
        
        String numeroOrden = "Nº de orden " + numeroDeLaOrden;
        String nombreDelCliente = nombreApellido;
        String labelvuelo = "Vuelo";
        LocalDate fechaVuelo = LocalDate.parse(fechaDelVuelo, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        String FechaVueloFormateado = fechaVuelo.format(DateTimeFormatter.ofPattern("dd MMM. yyyy", new Locale("es", "ES")));
        String vuelo = vueloNumero;
        String labelAsiento = "Asiento";
        String numeroAsiento = asientoDesignado;
        String tipoDeViaje = "Económico";
        String codigoReserva = numeroReserva + " Reserva " + codigoDeLaReserva;
        String labelEmbarque = "En puerta de embarque";
        LocalTime horaEmbarque = LocalTime.parse(horaDesignadaDelIncioDelEmbarque, DateTimeFormatter.ofPattern("HH:mm"));
        String LabelFinEmbarque = "El embarque finalizará a las";
        LocalTime horaFinEmbarque = LocalTime.parse(horaDesignadaDelFinDelEmbarque, DateTimeFormatter.ofPattern("HH:mm"));
        String labelTerminal = "Terminal";
        int numeroTerminal = numeroDeLaTerminal;
        String labelPuerta = "Puerta/Gate";
        int numeroPuerta = numeroDeLaPuerta;
        String labelGrupoEmbarque = "Embarque";
        String grupoEmbarque = numeroDelGrupoDeEmbarque;
        String labelDescripcionEquipaje = "En este vuelo puedes llevar:";
        String descripcionEquipaje = descripcionDelEquipaje;
        
        LocalDate fechaOrigenVuelo = LocalDate.parse(fechaDelOrigenDelVuelo, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        String fechaOrigenVueloFormateado = fechaVuelo.format(DateTimeFormatter.ofPattern("dd MMM. yyyy", new Locale("es", "ES")));
        LocalTime horaSalidaOrigen = LocalTime.parse(horaDelOrigenDelVuelo, DateTimeFormatter.ofPattern("HH:mm"));
        String origen = zonaDeOrigen;
        String nombreAeropuertoOrigen = nombreDelAeropuertoDeOrigen;
        
        
        LocalDate fechaDestinoVuelo = LocalDate.parse(fechaDelDestinoDelVuelo, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        String fechaDestinoVueloFormateado = fechaVuelo.format(DateTimeFormatter.ofPattern("dd MMM. yyyy", new Locale("es", "ES")));
        LocalTime horaLlegadaDestino = LocalTime.parse(horaDelDestinoDelVuelo, DateTimeFormatter.ofPattern("HH:mm"));
        String destino = zonaDeDestino;
        String nombreAeropuertoDestino = nombreDelAeropuertoDeDestino;
        
        // Configura la fuente en negrita
        Font fuenteNegrita = new Font("Arial", Font.BOLD, 12); // Cambia la fuente y el tamaño según tus necesidades
        graphics2D.setFont(fuenteNegrita);
        Font fuenteNormal = new Font("Arial", Font.PLAIN, 12); // Cambia la fuente y el tamaño según tus necesidades
        Font fuenteTablaOrigenDestino = new Font("Arial", Font.PLAIN, 10);
        Font fuenteTablaOrigenDestinoNegrita = new Font("Arial", Font.BOLD, 10);
        
        // Logo de la cabecera
        graphics2D.drawImage(logo, 35, 50, 150, 50, null);
        // posición del texto en el comprobante de pago
        graphics2D.setFont(fuenteNegrita);
        graphics2D.setColor(Color.GRAY);
        graphics2D.drawString(numeroOrden, 40, 130);
        graphics2D.setColor(Color.BLACK);
        graphics2D.setFont(fuenteNormal);
        
        graphics2D.drawString(nombreDelCliente, 40, 150);
                
        
        graphics2D.drawString(labelvuelo, 40, 170);
        
        graphics2D.setColor(Color.GRAY);
        graphics2D.drawString(FechaVueloFormateado.toUpperCase(), 40, 190);
        graphics2D.setColor(Color.BLACK);
        
        graphics2D.drawString(vuelo, 40, 210);
        graphics2D.drawString(labelAsiento, 40, 230);
        graphics2D.drawString(numeroAsiento, 40, 250);

        graphics2D.setColor(Color.GRAY);
        graphics2D.drawString(tipoDeViaje, 40, 270);
        graphics2D.setColor(Color.BLACK);
        
        graphics2D.setFont(fuenteNegrita);
        graphics2D.drawString(labelDescripcionEquipaje, 40, 290);
        graphics2D.setFont(fuenteNormal);
        graphics2D.drawString(descripcionEquipaje, 40, 310);
        // Restaura la fuente original si es necesario

        graphics2D.setFont(fuenteNormal);
        
        graphics2D.drawString(codigoReserva, 230, 310);
        
        // Dibujar el código QR en el lado izquierdo
        graphics2D.drawImage(qrCode, 220, 150, 150, 150, null);
                
        // Cargar la imagen de la tabla
        Image tabla = ImageIO.read(new File(basePath + "/src/resources/img/tabla.png"));

        // Dibujar la imagen de la tabla en la nueva imagen
        graphics2D.drawImage(tabla, 30, 320, 350, 60, null);
        
        
        graphics2D.setFont(fuenteNegrita);
        graphics2D.drawString(labelEmbarque, 50, 340);
        graphics2D.drawString(LabelFinEmbarque, 210, 340);
        graphics2D.setFont(fuenteNormal);
        
        graphics2D.drawString(String.valueOf(horaEmbarque), 95, 360);
        graphics2D.drawString(String.valueOf(horaFinEmbarque), 280, 360);
        
        graphics2D.setFont(fuenteNegrita);
        graphics2D.drawString(labelTerminal, 80, 400);
        graphics2D.drawString(labelPuerta, 160, 400);
        graphics2D.drawString(labelGrupoEmbarque, 260, 400);
        graphics2D.setFont(fuenteNormal);
        
        graphics2D.drawString(String.valueOf(numeroTerminal), 100, 420);
        graphics2D.drawString(String.valueOf(numeroPuerta), 190, 420);
        graphics2D.drawString(grupoEmbarque, 268, 420);
        
        // Tabla de vuelo de origen a destino
        
        Image tablaOrigenDestino = ImageIO.read(new File(basePath + "/src/resources/img/tabla_vuelo.png"));
        graphics2D.drawImage(tablaOrigenDestino, 30, 440, 350, 145,null);
        
        // Datos de la tabla origen a destino
                
        // Parte del origen
        
        graphics2D.setFont(fuenteTablaOrigenDestino);
        graphics2D.drawString(String.valueOf(fechaOrigenVuelo), 130, 460);
        graphics2D.drawString(fechaOrigenVueloFormateado, 130, 480);
        graphics2D.setFont(fuenteTablaOrigenDestinoNegrita);
        graphics2D.drawString(String.valueOf(horaSalidaOrigen), 130, 500);
        
        graphics2D.drawString(origen, 200, 460);
        graphics2D.setFont(fuenteTablaOrigenDestino);
        graphics2D.drawString(nombreAeropuertoOrigen, 200, 480);
        
        // Parte del destino
        
        graphics2D.setFont(fuenteTablaOrigenDestino);
        graphics2D.drawString(String.valueOf(fechaDestinoVuelo), 130, 530);
        graphics2D.drawString(fechaDestinoVueloFormateado, 130, 550);
        graphics2D.setFont(fuenteTablaOrigenDestinoNegrita);
        graphics2D.drawString(String.valueOf(horaLlegadaDestino), 130, 570);
        
        graphics2D.drawString(destino, 200, 530);
        graphics2D.setFont(fuenteTablaOrigenDestino);
        graphics2D.drawString(nombreAeropuertoDestino, 200, 550);
        
        graphics2D.dispose();
        document.close();
    }

    
}
