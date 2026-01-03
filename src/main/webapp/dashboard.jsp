<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- BARIS PERUBAHAN 1: IMPORT --%>
<%@ page import="java.util.List" %>
<%@ page import="model.Pesanan" %>

<%
    // CEK LOGIN
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Dashboard | Beans & Brew</title>

    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: #f5f1ee;
        }

        .container {
            display: flex;
            height: 100vh;
        }

        /* SIDEBAR */
        .sidebar {
            width: 240px;
            background: #3b2a24;
            color: white;
            padding: 20px;
        }

        .sidebar h2 {
            text-align: center;
            margin-bottom: 30px;
        }

        .menu a {
            display: block;
            padding: 12px 15px;
            margin-bottom: 10px;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            transition: 0.3s;
        }

        .menu a:hover {
            background: #ff8c42;
        }

        /* CONTENT */
        .content {
            flex: 1;
            padding: 30px;
            overflow-y: auto; /* Tambahkan ini agar bisa scroll jika pesanan banyak */
        }

        .card {
            background: white;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            margin-bottom: 20px;
        }

        /* PERUBAHAN 2: STYLE TABEL AGAR RAPI */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background: white;
        }

        table th, table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        table th {
            background-color: #3b2a24;
            color: white;
        }

        table tr:hover {
            background-color: #f9f9f9;
        }

        .logout {
            display: inline-block;
            padding: 10px 20px;
            background: #ff4d4d;
            color: white;
            text-decoration: none;
            border-radius: 20px;
            margin-top: 10px;
        }
    </style>
</head>

<body>

<div class="container">

    <div class="sidebar">
        <h2>Beans & Brew</h2>
        <div class="menu">
            <a href="dashboard">Pemesanan User</a>
        </div>
    </div>

    <div class="content">
        <div class="card">
            <h1>Selamat Datang ☕</h1>
            <p>Login sebagai: <b><%= session.getAttribute("user") %></b></p>
            <a href="<%= request.getContextPath() %>/logout" class="logout">Logout</a>
        </div>

        <div class="card">
            <h2>Daftar Pesanan User</h2>
            <table>
                <thead>
                    <tr>
                        <th>Nama</th>
                        <th>No HP</th>
                        <th>Metode</th>
                        <th>Total</th>
                        <th>Tanggal</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    List<Pesanan> list = (List<Pesanan>) request.getAttribute("listPesanan");
                    if (list != null && !list.isEmpty()) {
                        for (Pesanan p : list) {
                %>
                    <tr>
                        <td><%= p.getNama() %></td>
                        <td><%= p.getTelp() %></td>
                        <td><%= p.getMetode() %></td>
                        <td>Rp <%= String.format("%,.0f", (double)p.getTotal()) %></td>
                        <td><%= p.getTanggal() %></td>
                    </tr>
                <%
                        }
                    } else {
                %>
                    <tr>
                        <td colspan="5" style="text-align: center;">Belum ada data pesanan.</td>
                    </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>

</div>

</body>
</html>