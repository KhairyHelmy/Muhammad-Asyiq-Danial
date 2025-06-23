/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.controller;

import com.util.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String carOwnerName = request.getParameter("carOwnerName");
        String carPlateNumber = request.getParameter("carPlateNumber");
        String phone = request.getParameter("phone");
        String carModel = request.getParameter("carModel");
        String serviceType = request.getParameter("serviceType");

        String insertQuery = "INSERT INTO booking (car_owner_name, car_plate_number, phone, car_model, service_type) VALUES (?, ?, ?, ?, ?)";
        request.setAttribute("carOwnerName", carOwnerName);
        request.setAttribute("carPlateNumber", carPlateNumber);
        request.setAttribute("phone", phone);
        request.setAttribute("carModel", carModel);
        request.setAttribute("serviceType", serviceType);


    }}