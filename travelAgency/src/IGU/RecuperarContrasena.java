/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package IGU;

import IGU.util.ButtonGradient;
import java.sql.SQLException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.NoSuchProviderException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.swing.Icon;
import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JTextField;
import javax.swing.text.AbstractDocument;
import javax.swing.text.AttributeSet;
import javax.swing.text.BadLocationException;
import javax.swing.text.DocumentFilter;
import javax.swing.text.DocumentFilter.FilterBypass;
import logica.Cliente;
import logica.Configuraciones;

/**
 *
 * @author Juan Romero
 */
public class RecuperarContrasena extends javax.swing.JFrame {
    Configuraciones configuraciones;
    private String generadorCodigosVerificacion() throws SQLException, ClassNotFoundException {
        int codigoNumerico = (int)(Math.random() * 900000) + 100000;
        return String.valueOf(codigoNumerico);
    }
    
    private static String email = "businessluminoushorizons@gmail.com";
    private static String contrasena = "jjyq lwkz awcv szth";
    private String emailTo;
    private String subject;
    private String content;
    
    private Properties properties;
    private Session session;
    private MimeMessage mimeMessage;
    
    Cliente cliente = new Cliente();
    /**
     * Creates new form RecuperarContrasena
     */
    public RecuperarContrasena() {
        initComponents();
        configuraciones = new Configuraciones();
        setIconImage(new ImageIcon(getClass().getResource("/favicon/Nuevo_logo_de_Luminous_Horizons.png")).getImage());
        properties = new Properties();
        
        // controlar caracteres
            
        ((AbstractDocument) inputCode.getDocument()).setDocumentFilter(new DocumentFilter() {
            @Override
            public void replace(FilterBypass fb, int offset, int length, String text, AttributeSet attrs) throws BadLocationException {
                String string = fb.getDocument().getText(0, fb.getDocument().getLength()) + text;

                if (string.length() <= 6) {
                    super.replace(fb, offset, length, text, attrs); // To accept the replace action
                } else {
                    Icon icono = new ImageIcon(getClass().getResource("/icon/error.png"));
                    JOptionPane.showMessageDialog(null, "El código de seguridad es de 6 digitos.",
                        "ADVERTENCIA", JOptionPane.ERROR_MESSAGE, icono);
                }
            }
        });
        
        this.setResizable(false);
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
    }

    private void createEmail () throws SQLException, ClassNotFoundException {
        String emailTo = inputEmail.getText().trim();
        NuevaContrasena.miEmail = inputEmail.getText().trim();
        String subject = "RECUPERACIÓN DE CONTRASEÑA";
        String sms = """
                    ¡Hola! %s

                    Hemos recibido una solicitud para restablecer tu contraseña. Para confirmar esta solicitud y establecer una nueva contraseña, por favor, introduce el siguiente código de verificación:

                    %s

                    Si no has solicitado un cambio de contraseña, puedes ignorar este mensaje. Tu contraseña actual seguirá siendo válida.

                    Gracias por tu atención, Luminous Horizons
                    """;
        String code = generadorCodigosVerificacion();
        String content = String.format(sms, cliente.obtenerNombreClientePorCorreo(inputEmail.getText()),
                code);
        
        configuraciones.actualizarCodigoVerificacion(inputEmail.getText(), code);

        //Simple Mail Transfer Protocolo (SMTP)
        Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        properties.setProperty("mail.smtp.starttls.enable", "true");
        properties.setProperty("mail.smtp.port", "587");
        properties.setProperty("mail.smtp.user", email);
        properties.setProperty("mail.smtp.ssl.protocols", "TLSv1.2");
        properties.setProperty("mail.smtp.auth", "true");

        session = Session.getDefaultInstance(properties);
        try {
            mimeMessage = new MimeMessage(session);
            mimeMessage.setFrom(new InternetAddress(email));
            mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(emailTo));
            mimeMessage.setSubject(subject);
            mimeMessage.setText(content, "ISO-8859-1", "html");
        } catch (AddressException ex) {
            Logger.getLogger(RecuperarContrasena.class.getName()).log(Level.SEVERE, null, ex);
        } catch (MessagingException ex) {
            Logger.getLogger(RecuperarContrasena.class.getName()).log(Level.SEVERE, null, ex);
        }        
    }
    
    // Crear un nuevo JTextField, el JLabel y 
    JTextField inputCode = new JTextField();
    JLabel label_code = new JLabel();
    ButtonGradient btnEnviar = new ButtonGradient();
    
    private void sendEmail () {
        try {
            Transport transport = session.getTransport("smtp");
            transport.connect(email, contrasena);
            transport.sendMessage(mimeMessage, mimeMessage.getRecipients(Message.RecipientType.TO));
            transport.close();
            Icon icono = new ImageIcon(getClass().getResource("/icon/correo-electronico.png"));
            JOptionPane.showMessageDialog(null, "Se envio un codigo de recuperación al correo " + inputEmail.getText(),
                    "MENSAJE DE RECUPERACIÓN", JOptionPane.WARNING_MESSAGE, icono);
            
            // Agregar un label al JTextField
            label_code.setText("Código de verifiación");
            
            // Agregar el boton
            
            btnEnviar.setText("Enviar");
            
            // Agregar decoraciones label
            label_code.setFont(new java.awt.Font("Segoe UI", 1, 18));
            label_code.setForeground(new java.awt.Color(226, 203, 253));

            // Agregar decoraciones input
            inputCode.setBackground(new java.awt.Color(24, 7, 43));
            inputCode.setForeground(new java.awt.Color(255, 255, 255));
            inputCode.setBorder(new javax.swing.border.LineBorder(new java.awt.Color(226, 203, 253), 3, true));
            
            // Decoraciones del boton
            
            btnEnviar.setColor1(new java.awt.Color(153, 0, 204));
            btnEnviar.setColor2(new java.awt.Color(0, 0, 0));
            btnEnviar.setFont(new java.awt.Font("Segoe UI", 1, 12));
            
            // Especificar las posiciones y tamaños manualmente
            label_code.setBounds(70, 250, 367, 30);
            inputCode.setBounds(70, 300, 367, 37);
            btnEnviar.setBounds(200, 350, 98, 36);
            // Reemplazar el JTextField existente con el nuevo
            contenido.remove(label_email);
            contenido.remove(inputEmail);
            contenido.remove(btn_recuperar);
            contenido.add(inputCode);
            contenido.add(label_code);
            contenido.add(btnEnviar);
            btnEnviar.addActionListener(new java.awt.event.ActionListener() {
                public void actionPerformed(java.awt.event.ActionEvent evt) {
                    try {
                        btn_enviarActionPerformed(evt);
                    } catch (SQLException ex) {
                        Logger.getLogger(RecuperarContrasena.class.getName()).log(Level.SEVERE, null, ex);
                    } catch (ClassNotFoundException ex) {
                        Logger.getLogger(RecuperarContrasena.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            });
            // Actualizar el panel para mostrar el nuevo JTextField
            contenido.revalidate();
            contenido.repaint();

        } catch (NoSuchProviderException ex) {
            Logger.getLogger(RecuperarContrasena.class.getName()).log(Level.SEVERE, null, ex);
        } catch (MessagingException ex) {
            Logger.getLogger(RecuperarContrasena.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        contenido = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        label_email = new javax.swing.JLabel();
        inputEmail = new javax.swing.JTextField();
        btn_recuperar = new IGU.util.ButtonGradient();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setTitle("RECUPERAR CONTRASEÑA | Luminous Horizons");

        contenido.setBackground(new java.awt.Color(24, 7, 43));

        jLabel1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/resources/img/Nuevo logo de Luminous Horizons.png"))); // NOI18N

        label_email.setFont(new java.awt.Font("Segoe UI", 1, 18)); // NOI18N
        label_email.setForeground(new java.awt.Color(226, 203, 253));
        label_email.setText("Email");

        inputEmail.setBackground(new java.awt.Color(24, 7, 43));
        inputEmail.setForeground(new java.awt.Color(255, 255, 255));
        inputEmail.setBorder(new javax.swing.border.LineBorder(new java.awt.Color(226, 203, 253), 3, true));
        inputEmail.setCaretColor(new java.awt.Color(255, 255, 255));

        btn_recuperar.setText("Recuperar");
        btn_recuperar.setColor1(new java.awt.Color(153, 0, 204));
        btn_recuperar.setColor2(new java.awt.Color(0, 0, 0));
        btn_recuperar.setFont(new java.awt.Font("Segoe UI", 1, 12)); // NOI18N
        btn_recuperar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btn_recuperarActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout contenidoLayout = new javax.swing.GroupLayout(contenido);
        contenido.setLayout(contenidoLayout);
        contenidoLayout.setHorizontalGroup(
            contenidoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(contenidoLayout.createSequentialGroup()
                .addGroup(contenidoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(contenidoLayout.createSequentialGroup()
                        .addGap(52, 52, 52)
                        .addComponent(jLabel1))
                    .addGroup(contenidoLayout.createSequentialGroup()
                        .addGap(70, 70, 70)
                        .addGroup(contenidoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(inputEmail, javax.swing.GroupLayout.PREFERRED_SIZE, 367, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(label_email)))
                    .addGroup(contenidoLayout.createSequentialGroup()
                        .addGap(206, 206, 206)
                        .addComponent(btn_recuperar, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(54, Short.MAX_VALUE))
        );
        contenidoLayout.setVerticalGroup(
            contenidoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(contenidoLayout.createSequentialGroup()
                .addGap(33, 33, 33)
                .addComponent(jLabel1)
                .addGap(18, 18, 18)
                .addComponent(label_email)
                .addGap(18, 18, 18)
                .addComponent(inputEmail, javax.swing.GroupLayout.PREFERRED_SIZE, 37, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(btn_recuperar, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(32, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(contenido, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(contenido, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btn_recuperarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btn_recuperarActionPerformed
        try {
            Cliente cliente = new Cliente();
            String rpta = null;
            rpta = cliente.autenticarCorreo(inputEmail.getText());
            if (rpta.equals("")) {
                try {
                    createEmail();
                } catch (SQLException ex) {
                    Logger.getLogger(RecuperarContrasena.class.getName()).log(Level.SEVERE, null, ex);
                } catch (ClassNotFoundException ex) {
                    Logger.getLogger(RecuperarContrasena.class.getName()).log(Level.SEVERE, null, ex);
                }
                sendEmail();
            }else {
                Icon icono = new ImageIcon(getClass().getResource("/icon/error.png"));
                JOptionPane.showMessageDialog(null, "El correo ingresado no esta registrado en la empresa", "VALIDACIÓN DE CORREO ELECTRONICO",JOptionPane.ERROR_MESSAGE, icono);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(RecuperarContrasena.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(RecuperarContrasena.class.getName()).log(Level.SEVERE, null, ex);
        }
    }//GEN-LAST:event_btn_recuperarActionPerformed
    
    private void btn_enviarActionPerformed(java.awt.event.ActionEvent evt) throws SQLException, ClassNotFoundException {
        // Verificamos el codigo
        if (configuraciones.obtenerCodigoVerificacion(inputEmail.getText()).equals(inputCode.getText())){
            NuevaContrasena nuevaContrasena = new NuevaContrasena();
            nuevaContrasena.setVisible(true);
            nuevaContrasena.setLocationRelativeTo(null);
            dispose();
        }else {
            Icon icono = new ImageIcon(getClass().getResource("/icon/error.png"));
            JOptionPane.showMessageDialog(null, "El código ingresado no existe", "ADVERTENCIA",JOptionPane.ERROR_MESSAGE, icono);
        }
    }
       

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private IGU.util.ButtonGradient btn_recuperar;
    private javax.swing.JPanel contenido;
    private javax.swing.JTextField inputEmail;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel label_email;
    // End of variables declaration//GEN-END:variables
}
