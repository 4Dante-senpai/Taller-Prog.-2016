
package Examen;

import java.util.Scanner; // Importar funcionalidad para entrada 

public class Laboratorio {

    
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in); // Declarar el scanner e indicar que se leerá desde teclado
       
        double duracion = 0.0;
        int tipo = 0, cantmuestras = 0, cantestudiosespecificos = 0;
        String nya = "", nyaacompañante = "", relacion = "", FechayHora = "";
        
        System.out.println("ESTUDIO DE IMAGEN");
        System.out.println("Ingrese nombre y apellido del paciente: ");
        nya = in.next();
        System.out.println("Ingrese nombre y apellido del acompañante: ");
        nyaacompañante = in.next();
        System.out.println("Ingrese la relacion del acompañante: ");
        relacion = in.next();
        System.out.println("Ingrese fecha y hora del estudio: ");
        FechayHora = in.next();
        System.out.println("Ingrese la duracion en minutos: ");
        duracion = in.nextDouble();
        System.out.println("Ingrese el tipo de imagen (de 0 a 3)");
        System.out.println("(0 = resonancia magnetica, 1 = tomografia, 2 = ecografia, 3 = rayosX) : ");
        tipo = in.nextInt();
        
        while (tipo < 0 || tipo > 3){
            System.out.print("Categoria incorrecta. Ingrese de nuevo");
            tipo = in.nextInt();
        }
        
        EstudioImagen e = new EstudioImagen (nya, nyaacompañante, relacion, FechayHora, duracion, tipo);
        
        
        System.out.println("ESTUDIO DE ANALISIS");
        System.out.println("Ingrese nombre y apellido del paciente: ");
        nya = in.next();
        System.out.println("Ingrese nombre y apellido del acompañante: ");
        nyaacompañante = in.next();
        System.out.println("Ingrese la relacion del acompañante: ");
        relacion = in.next();
        System.out.println("Ingrese fecha y hora del estudio: ");
        FechayHora = in.next();
        System.out.println("Ingrese la cantidad de muestras tomadas: ");
        cantmuestras = in.nextInt();
        System.out.println("Ingrese la cantidad de estudios especificos: ");
        cantestudiosespecificos = in.nextInt();
        
        Analisis a = new Analisis (nya, nyaacompañante, relacion, FechayHora, cantmuestras, cantestudiosespecificos);
        
        // IMPRIMIR--------------------------------------------------------------------------------------------
        
        System.out.println("COSTO ESTUDIO DE IMAGEN: " + e.calcularValorEstudio());
        System.out.println("COSTO ANALISIS: " + a.calcularValorEstudio());
        
        
        in.close(); // Cerrar el scanner
    }
    
}
