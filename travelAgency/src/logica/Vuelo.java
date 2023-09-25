/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package logica;

import java.util.Date;

/**
 *
 * @author Juan Romero
 */
class Vuelo {
    private String origen;
    private Destino destino;
    private Date fecha;
    private String hora;
    private int capacidad;
    private double precio;
    
    // Constructor
    public Vuelo(String origen, Destino destino, Date fecha, String hora, int capacidad, double precio) {
        this.origen = origen;
        this.destino = destino;
        this.fecha = fecha;
        this.hora = hora;
        this.capacidad = capacidad;
        this.precio = precio;
    }
}
