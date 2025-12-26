<%-- 
    Document   : menu
    Created on : Dec 18, 2025, 1:02:54 PM
    Author     : kenas
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, model.Menu" %>
<%
    // Ambil data dari servlet
    List<Menu> menuList = (List<Menu>) request.getAttribute("menu");
    if(menuList == null) {
        menuList = new ArrayList<>();
    }
%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu - Beans & Brew</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #2c2c2c;
            line-height: 1.6;
            background: #f5f5f5;
        }

        /* Navbar */
        nav {
            background: linear-gradient(135deg, #3e2723 0%, #5d4037 100%);
            padding: 1rem 5%;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
            box-shadow: 0 2px 10px rgba(0,0,0,0.3);
        }

        nav .container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 1400px;
            margin: 0 auto;
        }

        .logo {
            font-size: 1.8rem;
            font-weight: bold;
            color: #fff;
            text-decoration: none;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .logo::before {
            content: "☕";
            font-size: 2rem;
        }

        nav ul {
            display: flex;
            list-style: none;
            gap: 2rem;
            align-items: center;
        }

        nav ul li a {
            color: #fff;
            text-decoration: none;
            font-size: 1.1rem;
            transition: color 0.3s;
            padding: 0.5rem 1rem;
            border-radius: 5px;
            position: relative;
        }

        nav ul li a:hover {
            background: rgba(255,255,255,0.1);
            color: #ffcc80;
        }

        /* Cart Badge */
        .cart-link {
            position: relative;
        }

        .cart-badge {
            position: absolute;
            top: -8px;
            right: -8px;
            background: #ff3333;
            color: white;
            border-radius: 50%;
            width: 24px;
            height: 24px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 0.85rem;
            font-weight: bold;
            box-shadow: 0 2px 8px rgba(255, 51, 51, 0.5);
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0%, 100% {
                transform: scale(1);
            }
            50% {
                transform: scale(1.1);
            }
        }

        /* Hero Section */
        .hero {
            margin-top: 70px;
            background: linear-gradient(135deg, #3e2723 0%, #5d4037 100%);
            padding: 4rem 5%;
            text-align: center;
            color: white;
        }

        .hero h1 {
            font-size: 3rem;
            margin-bottom: 1rem;
            text-shadow: 2px 2px 8px rgba(0,0,0,0.3);
        }

        .hero p {
            font-size: 1.3rem;
            opacity: 0.9;
        }

        /* Menu Section */
        .menu-section {
            padding: 3rem 5%;
            max-width: 1400px;
            margin: 0 auto;
        }

        .menu-header {
            text-align: center;
            margin-bottom: 3rem;
        }

        .menu-header h2 {
            font-size: 2.5rem;
            color: #3e2723;
            margin-bottom: 0.5rem;
        }

        .menu-header p {
            color: #666;
            font-size: 1.1rem;
        }

        /* Menu Grid */
        .menu-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
            gap: 2rem;
        }

        .menu-card {
            background: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
            transition: all 0.3s;
        }

        .menu-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        }

        .menu-image {
            width: 100%;
            height: 280px;
            object-fit: cover;
            background: #e0e0e0;
        }

        .menu-content {
            padding: 1.5rem;
        }

        .menu-name {
            font-size: 1.5rem;
            color: #3e2723;
            margin-bottom: 0.5rem;
            font-weight: bold;
        }

        .menu-description {
            color: #666;
            margin-bottom: 1rem;
            font-size: 0.95rem;
            line-height: 1.5;
        }

        .menu-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 1rem;
        }

        .menu-price {
            font-size: 1.8rem;
            color: #ff6f00;
            font-weight: bold;
        }

        .add-to-cart-btn {
            background: #ff6f00;
            color: white;
            border: none;
            padding: 0.8rem 1.5rem;
            border-radius: 50px;
            font-size: 1rem;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            box-shadow: 0 4px 15px rgba(255, 111, 0, 0.3);
        }

        .add-to-cart-btn:hover {
            background: #ff8f00;
            transform: scale(1.05);
            box-shadow: 0 6px 20px rgba(255, 111, 0, 0.5);
        }

        .add-to-cart-btn:active {
            transform: scale(0.98);
        }

        /* Success Toast */
        .toast {
            position: fixed;
            bottom: 30px;
            right: 30px;
            background: #4caf50;
            color: white;
            padding: 1rem 2rem;
            border-radius: 10px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.3);
            display: none;
            align-items: center;
            gap: 1rem;
            animation: slideIn 0.3s ease-out;
            z-index: 2000;
        }

        .toast.show {
            display: flex;
        }

        @keyframes slideIn {
            from {
                transform: translateX(400px);
                opacity: 0;
            }
            to {
                transform: translateX(0);
                opacity: 1;
            }
        }

        .toast-icon {
            font-size: 1.5rem;
        }

        /* Empty State */
        .empty-state {
            text-align: center;
            padding: 4rem 2rem;
        }

        .empty-state h3 {
            color: #666;
            font-size: 1.5rem;
            margin-bottom: 1rem;
        }

        /* Footer */
        footer {
            background: #3e2723;
            color: white;
            text-align: center;
            padding: 2rem;
            margin-top: 3rem;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .hero h1 {
                font-size: 2rem;
            }

            .menu-grid {
                grid-template-columns: 1fr;
            }

            nav ul {
                gap: 0.5rem;
            }

            nav ul li a {
                padding: 0.5rem;
                font-size: 1rem;
            }
        }
    </style>
</head>
<body>
    <!-- Navigation -->
    <nav>
        <div class="container">
            <a href="index.jsp" class="logo">Beans & Brew</a>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="menu">Menu</a></li>
                <li class="cart-link">
                    <a href="pesanan.jsp">
                        🛒 Pesanan
                        <span class="cart-badge" id="cartBadge">0</span>
                    </a>
                </li>
                <li><a href="about.jsp">About</a></li>
            </ul>
        </div>
    </nav>

    <!-- Hero Section -->
    <div class="hero">
        <h1>🧊 Iced Coffee Menu</h1>
        <p>Kopi dingin terbaik untuk menemani harimu</p>
    </div>

    <!-- Menu Section -->
    <section class="menu-section">
        <div class="menu-header">
            <h2>Our Signature Iced Coffee</h2>
            <p>Dibuat dengan biji kopi pilihan dan es yang sempurna</p>
        </div>

        <% if(menuList.isEmpty()) { %>
            <div class="empty-state">
                <h3>😔 Menu belum tersedia</h3>
                <p>Silakan hubungi admin untuk menambahkan menu</p>
            </div>
        <% } else { %>
            <div class="menu-grid">
                <%
                    for(Menu menu : menuList) {
                %>
                <div class="menu-card">
                    <img src="<%= menu.getGambar() %>" alt="<%= menu.getNama() %>" class="menu-image" onerror="this.src='assets/img/placeholder.jpg'">
                    <div class="menu-content">
                        <h3 class="menu-name"><%= menu.getNama() %></h3>
                        <p class="menu-description">Kopi dingin pilihan terbaik dari Beans & Brew</p>
                        <div class="menu-footer">
                            <span class="menu-price">Rp <%= String.format("%,d", menu.getHarga()) %></span>
                            <button class="add-to-cart-btn" onclick="addToCart(<%= menu.getId() %>, '<%= menu.getNama() %>', <%= menu.getHarga() %>)">
                                <span>➕</span> Keranjang
                            </button>
                        </div>
                    </div>
                </div>
                <% } %>
            </div>
        <% } %>
    </section>

    <!-- Toast Notification -->
    <div class="toast" id="toast">
        <span class="toast-icon">✅</span>
        <span id="toastMessage">Item berhasil ditambahkan ke keranjang!</span>
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; 2024 Beans & Brew. All rights reserved. Made with ❤️ and ☕</p>
    </footer>

    <script>
        // Cart Management menggunakan Session Storage
        // Untuk JSP, nanti bisa diganti dengan HttpSession
        
        function getCart() {
            const cart = sessionStorage.getItem('cart');
            return cart ? JSON.parse(cart) : [];
        }

        function saveCart(cart) {
            sessionStorage.setItem('cart', JSON.stringify(cart));
            updateCartBadge();
        }

        function updateCartBadge() {
            const cart = getCart();
            const totalItems = cart.reduce((sum, item) => sum + item.quantity, 0);
            const badge = document.getElementById('cartBadge');
            badge.textContent = totalItems;
            
            if (totalItems > 0) {
                badge.style.display = 'flex';
            } else {
                badge.style.display = 'none';
            }
        }

        function addToCart(id, name, price) {
            let cart = getCart();
            
            // Cek apakah item sudah ada di cart
            const existingItem = cart.find(item => item.id === id);
            
            if (existingItem) {
                existingItem.quantity += 1;
            } else {
                cart.push({
                    id: id,
                    name: name,
                    price: price,
                    quantity: 1
                });
            }
            
            saveCart(cart);
            showToast(name + ' berhasil ditambahkan ke keranjang!');
        }

        function showToast(message) {
            const toast = document.getElementById('toast');
            const toastMessage = document.getElementById('toastMessage');
            
            toastMessage.textContent = message;
            toast.classList.add('show');
            
            setTimeout(() => {
                toast.classList.remove('show');
            }, 3000);
        }

        // Initialize cart badge on page load
        document.addEventListener('DOMContentLoaded', function() {
            updateCartBadge();
        });
    </script>
</body>
</html>