package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import config.Koneksi;

@WebServlet("/pesanan")
public class PesananServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nama = request.getParameter("nama_pelanggan");
        String telp = request.getParameter("no_telp");
        String metode = request.getParameter("metode_pembayaran");
        int total = Integer.parseInt(request.getParameter("total"));

        try (Connection conn = Koneksi.getConnection()) {
            String sql = "INSERT INTO pesanan "
                    + "(nama_pelanggan, no_telp, metode_pembayaran, total) "
                    + "VALUES (?, ?, ?, ?)";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, nama);
            ps.setString(2, telp);
            ps.setString(3, metode);
            ps.setInt(4, total);
            ps.executeUpdate();

        } catch (Exception e) {
        }

        // setelah checkout → ke dashboard
        response.sendRedirect("index.jsp");
    }
}
