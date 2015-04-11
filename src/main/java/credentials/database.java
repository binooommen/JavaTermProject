/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package credentials;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author c0647015
 */
public class database {

    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String jdbc = "jdbc:mysql://" + System.getenv("OPENSHIFT_MYSQL_DB_HOST") + ":"
                    + System.getenv("OPENSHIFT_MYSQL_DB_PORT") + "/simpleerp";
            String user = System.getenv("OPENSHIFT_MYSQL_DB_USERNAME");
            String pass = System.getenv("OPENSHIFT_MYSQL_DB_PASSWORD");
            conn = DriverManager.getConnection(jdbc, user, pass);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return conn;
    }
//    
//    public static Connection getConnection() {
//        Connection conn = null;
//        try {
//            Class.forName("com.mysql.jdbc.Driver");
//            String jdbc = "jdbc:mysql://localhost/simpleerp";
//            conn = DriverManager.getConnection(jdbc, "root", "");
//        } catch (ClassNotFoundException | SQLException ex) {
//            Logger.getLogger(database.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return conn;
//    }
}
