package Dao;

import config.Koneksi;
import model.Pesanan;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.DetailPesanan;

public class PesananDAO {

    public List<Pesanan> getAllPesanan() {

        List<Pesanan> list = new ArrayList<>();
        String sql = "SELECT * FROM pesanan ORDER BY id_pesanan DESC";

        try (Connection conn = Koneksi.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Pesanan p = new Pesanan();
                p.setId(rs.getInt("id_pesanan"));
                p.setNama(rs.getString("nama_pelanggan"));
                p.setTelp(rs.getString("no_telp"));
                p.setMetode(rs.getString("metode_pembayaran"));
                p.setTotal(rs.getDouble("total"));
                p.setTanggal(rs.getTimestamp("tanggal"));

                list.add(p);
            }

        } catch (Exception e) {
        }

        return list;
    }

    public void insertPesanan(String nama, double total, String metode, String telp, List<DetailPesanan> cart) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
