
package Examen;

public class EstudioImagen extends Estudio {
    
    private double duracion;
    private int tipo;
    private int []vector = new int[4];
   
    
    public EstudioImagen (String unNya, String unNyaA, String unRelacion, String unFechayHora, double unDuracion, int unTipo){
        setNya (unNya);
        setNyaacompañante (unNyaA);
        setRelacion (unRelacion);
        setFechayHora (unFechayHora);
        setVector(vector);
        duracion = unDuracion;
        tipo = unTipo;
   
    }

    
    public double getDuracion() {
        return duracion;
    }

    
    public void setDuracion(double duracion) {
        this.duracion = duracion;
    }

    
    public int getTipo() {
        return tipo;
    }

    
    public void setTipo(int tipo) {    // HACEMOS EL CORTE DE CONTROL DEL TIPO EN EL PROGRAMA PRINCIPAL PARA AHORRAR VARIABLES
        this.tipo = tipo;
    }
    
    
    public int[] getVector() {
        return vector;
    }

    
    public void setVector(int[] vector) {
        
        this.vector[0] = 540;
        this.vector[1] = 356;
        this.vector[2] = 210;
        this.vector[3] = 67;
    }

    
       public double calcularValorEstudio (){
        double valor;
        valor = (570 + (duracion * vector[tipo])) ;
        return valor;
       }
}