/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package servlet;

import config.Koneksi;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Menu;

@WebServlet("/menu")
public class MenuServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        List<Menu> list = new ArrayList<>();
        try {
            Connection c = Koneksi.getConnection();
            ResultSet rs = c.createStatement().executeQuery("SELECT * FROM menu");
            while (rs.next()) {
                Menu m = new Menu();
                m.setId(rs.getInt("id_menu"));
                m.setNama(rs.getString("nama_menu"));
                m.setHarga(rs.getInt("harga"));
                m.setGambar(rs.getString("gambar"));
                list.add(m);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        req.setAttribute("menu", list);
        req.getRequestDispatcher("menu.jsp").forward(req, res);
    }
}
