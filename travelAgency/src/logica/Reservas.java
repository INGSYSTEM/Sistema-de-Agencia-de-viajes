package logica;

import java.time.LocalDate;

public class Reservas {

    public Reservas(int Id_reserva, Clientes Id_cliente, Viajes Id_viaje, LocalDate Fecha_de_reserva, LocalDate Fecha_de_viaje, String Destino, int Numero_de_pasajeros, String Estado_de_la_reserva, double Precio_total) {
        this.Id_reserva = Id_reserva;
        this.Id_cliente = Id_cliente;
        this.Id_viaje = Id_viaje;
        this.Fecha_de_reserva = Fecha_de_reserva;
        this.Fecha_de_viaje = Fecha_de_viaje;
        this.Destino = Destino;
        this.Numero_de_pasajeros = Numero_de_pasajeros;
        this.Estado_de_la_reserva = Estado_de_la_reserva;
        this.Precio_total = Precio_total;
    }
    
    private int Id_reserva;
    private Clientes Id_cliente;
    private Viajes Id_viaje;
    private LocalDate Fecha_de_reserva;
    private LocalDate Fecha_de_viaje;
    private String Destino;
    private int Numero_de_pasajeros;
    private String Estado_de_la_reserva;
    private double Precio_total;
}
