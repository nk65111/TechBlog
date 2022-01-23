package com.tech.blog.helper;
import java.sql.*;
public class ConnectionProvider{
    private static Connection con;
    public static Connection getConnection() {
    	try {
    		if(con==null) {
    			//diver load
    			Class.forName("com.mysql.cj.jdbc.Driver");
    			
    			//connection provider
    			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog", "root", "#@Nitesh1");
    			
    		}
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	return con;
    }
}
