/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package es.albarregas.controllers.beans;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author badoe
 */
public class Usuario implements Serializable {

    private String nombre;
    private Date fechaNacimiento;
    private Integer hijos;
    private Double salario;

    public Usuario(String nombre, Date fechaNacimiento, int hijos, double salario) {
        this.nombre = nombre;
        this.fechaNacimiento = fechaNacimiento;
        this.hijos = hijos;
        this.salario = salario;
    }

    public Usuario() {
    }

    /**
     * @return the fechaNacimiento
     */
    public Date getFechaNacimiento() {
        return fechaNacimiento;
    }

    /**
     * @param fechaNacimiento the fechaNacimiento to set
     */
    public void setFechaNacimiento(Date fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    /**
     * @return the hijos
     */
    public int getHijos() {
        return hijos;
    }

    /**
     * @param hijos the hijos to set
     */
    public void setHijos(int hijos) {
        this.hijos = hijos;
    }

    /**
     * @return the salario
     */
    public double getSalario() {
        return salario;
    }

    /**
     * @param salario the salario to set
     */
    public void setSalario(double salario) {
        this.salario = salario;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getNombre() {
        return this.nombre;
    }

}
