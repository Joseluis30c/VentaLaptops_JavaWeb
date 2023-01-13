package Modelo;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {
	//Propiedad
    Connection conex;
    //Método
    public Conexion() {
        try{
            // Driver
            Class.forName("com.mysql.jdbc.Driver");
            //Configuración del objeto conexion|
            conex = DriverManager.getConnection("jdbc:mysql://localhost:3306/laptopdb","root","");
        }catch(Exception e){
            System.out.println("Mensaje : " + e.getMessage());
        }finally{
            System.out.println("Inicio de la aplicación");
        }
    }
    public Connection getCon(){
        return conex;
    }
    
}
