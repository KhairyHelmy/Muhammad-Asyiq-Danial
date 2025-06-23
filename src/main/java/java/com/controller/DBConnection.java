package com.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static Connection myConnection = null;
    private static final String URL = "jdbc:mysql://localhost:3306/book_management";
    private static final String USER = "root";
    private static final String PASSWORD = ""; // Change if using password like "admin"

    // Private constructor to prevent instantiation
    private DBConnection() {}

    public static Connection getConnection() throws ClassNotFoundException {
        try {
            if (myConnection == null || myConnection.isClosed()) {
                Class.forName("com.mysql.cj.jdbc.Driver"); // Updated driver class
                myConnection = DriverManager.getConnection(URL, USER, PASSWORD);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return myConnection;
    }

    public static void closeConnection() {
        try {
            if (myConnection != null && !myConnection.isClosed()) {
                myConnection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    

}

