package controller;

import Dao.PesananDAO;
import model.DetailPesanan;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nama = request.getParameter("nama");
        String telp = request.getParameter("telp");
        String metode = request.getParameter("metode");

        // Contoh data keranjang (biasanya dari session)
        List<DetailPesanan> cart = (List<DetailPesanan>) request.getSession().getAttribute("cart");

        double total = 0;
        for (DetailPesanan d : cart) {
            total += d.getSubtotal();
        }

        PesananDAO DAO = new PesananDAO();
        DAO.insertPesanan(nama, total, metode, telp, cart);

        // hapus keranjang
        request.getSession().removeAttribute("cart");

        response.sendRedirect("dashboard");
    }
}
