
package Examen;


public class Analisis extends Estudio {
    
    
    private int cantmuestras;
    private int cantestudiosespecificos;

    
     public Analisis(String unNya, String unNyaA, String unRelacion, String unFechayHora, int unCantM, int unCantEstudios){
        setNya (unNya);
        setNyaacompañante (unNyaA);
        setRelacion (unRelacion);
        setFechayHora (unFechayHora);
        cantmuestras = unCantM;
        cantestudiosespecificos = unCantEstudios;
   
    }
    
    
    
    
    public int getCantmuestras() {
        return cantmuestras;
    }

    
    public void setCantmuestras(int cantmuestras) {
        this.cantmuestras = cantmuestras;
    }

    
    public int getCantestudiosespecificos() {
        return cantestudiosespecificos;
    }

    
    public void setCantestudiosespecificos(int cantestudiosespecificos) {
        this.cantestudiosespecificos = cantestudiosespecificos;
    }
    
    
    public double calcularValorEstudio (){
        double valor;
        valor =  225*cantestudiosespecificos + 170*cantmuestras;
        return valor;
    }
    
}
