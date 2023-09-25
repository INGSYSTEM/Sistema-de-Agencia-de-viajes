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
class Reserva {
    private Cliente cliente;
    private Vuelo vuelo;
    private Date fechaReserva;
    
    // Constructor
    public Reserva(Cliente cliente, Vuelo vuelo, Date fechaReserva) {
        this.cliente = cliente;
        this.vuelo = vuelo;
        this.fechaReserva = fechaReserva;
    }
}