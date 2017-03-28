
package Examen;

// DATOS DEL PACIENTE
public abstract class Estudio {
    
    private String nya;
    private String nyaacompañante;
    private String relacion;
    private String FechayHora;
    
    
     public abstract double calcularValorEstudio();

    
    public String getNya() {
        return nya;
    }

    
    public void setNya(String nya) {
        this.nya = nya;
    }

    
    public String getNyaacompañante() {
        return nyaacompañante;
    }

    
    public void setNyaacompañante(String nyaacompañante) {
        this.nyaacompañante = nyaacompañante;
    }

    
    public String getRelacion() {
        return relacion;
    }

    
    public void setRelacion(String relacion) {
        this.relacion = relacion;
    }

    
    public String getFechayHora() {
        return FechayHora;
    }

    
    public void setFechayHora(String FechayHora) {
        this.FechayHora = FechayHora;
    }
     
     
}
