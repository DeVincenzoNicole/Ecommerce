
package com.Nicole.config;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class conexion {
    
    
    Connection conn;
    Statement st;
    
    public Connection conexion(){
        
        
        try {
            //cargo el Driver mysql
            Class.forName("com.mysql.jdbc.Driver");
            // creo el objeto conexion
            conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce", "root", "root");
            System.out.println("Conexión establecida");
            // para detectar errores de conexion
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(conexion.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Error de clases");
        } catch (SQLException ex) {
            Logger.getLogger(conexion.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Eror en SQL");
        } 
        return conn;
        
        
    }

    Statement createStatement() {
        throw new UnsupportedOperationException("No soportado.");
    }
   
}
