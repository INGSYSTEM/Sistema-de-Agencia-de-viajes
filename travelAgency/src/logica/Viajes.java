package logica;

import java.time.LocalDate;

public class Viajes {

    public Viajes(int Id_viaje, String Destino, LocalDate Fecha_de_salida, LocalDate Fecha_de_regreso, double Precio_por_pasajero, String Disponibilidad_de_plazas, String Descripcion_del_viaje, String Tipo_de_viaje, String Hotel, String Itinerario, Empleados Id_empleado) {
        this.Id_viaje = Id_viaje;
        this.Destino = Destino;
        this.Fecha_de_salida = Fecha_de_salida;
        this.Fecha_de_regreso = Fecha_de_regreso;
        this.Precio_por_pasajero = Precio_por_pasajero;
        this.Disponibilidad_de_plazas = Disponibilidad_de_plazas;
        this.Descripcion_del_viaje = Descripcion_del_viaje;
        this.Tipo_de_viaje = Tipo_de_viaje;
        this.Hotel = Hotel;
        this.Itinerario = Itinerario;
        this.Id_empleado = Id_empleado;
    }
        
    private int Id_viaje;
    private String Destino;
    private LocalDate Fecha_de_salida;
    private LocalDate Fecha_de_regreso;
    private double Precio_por_pasajero;
    private String Disponibilidad_de_plazas;
    private String Descripcion_del_viaje;
    private String Tipo_de_viaje;
    private String Hotel;
    private String Itinerario;
    private Empleados Id_empleado;
}
