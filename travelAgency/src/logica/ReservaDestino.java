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
class ReservaDestino {
    private Cliente cliente;
    private Destino destino;
    private Date fechaReserva;
    
    // Constructor
    public ReservaDestino(Cliente cliente, Destino destino, Date fechaReserva) {
        this.cliente = cliente;
        this.destino = destino;
        this.fechaReserva = fechaReserva;
    }
}
