/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package logica;

/**
 *
 * @author Juan Romero
 */
class Asiento {
    private Vuelo vuelo;
    private int numeroAsiento;
    private String clase;
    private boolean ocupado;
    
    // Constructor
    public Asiento(Vuelo vuelo, int numeroAsiento, String clase) {
        this.vuelo = vuelo;
        this.numeroAsiento = numeroAsiento;
        this.clase = clase;
        this.ocupado = false;
    }
}
