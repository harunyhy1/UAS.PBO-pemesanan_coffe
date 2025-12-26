/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package servlet;

import config.Koneksi;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;

    @WebServlet("/pesan")
public class PesananServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws IOException {

        String nama = req.getParameter("nama");
        int idMenu = Integer.parseInt(req.getParameter("id_menu"));
        int jumlah = Integer.parseInt(req.getParameter("jumlah"));

        try {
            Connection c = Koneksi.getConnection();
            // logic insert pesanan (disederhanakan)
        } catch (Exception e) {
            e.printStackTrace();
        }

        res.sendRedirect("index.jsp");
    }
}

