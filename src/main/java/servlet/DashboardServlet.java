package servlet;

import Dao.PesananDAO;
import model.Pesanan;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PesananDAO dao = new PesananDAO();
        List<Pesanan> listPesanan = dao.getAllPesanan();

        request.setAttribute("listPesanan", listPesanan);
        request.getRequestDispatcher("dashboard.jsp").forward(request, response);
    }
}
