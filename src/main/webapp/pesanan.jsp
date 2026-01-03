<%-- 
    Document   : pesanan
    Created on : Dec 18, 2025, 1:03:01 PM
    Author     : kenas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pesanan - Beans & Brew</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script> 
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
        }

        nav ul li a:hover {
            background: rgba(255,255,255,0.1);
            color: #ffcc80;
        }

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
        }

        /* Main Content */
        .main-content {
            margin-top: 90px;
            padding: 2rem 5%;
            max-width: 1200px;
            margin-left: auto;
            margin-right: auto;
            min-height: calc(100vh - 200px);
        }

        .page-title {
            font-size: 2.5rem;
            color: #3e2723;
            margin-bottom: 2rem;
            text-align: center;
        }

        /* Cart Container */
        .cart-container {
            display: grid;
            grid-template-columns: 1fr 400px;
            gap: 2rem;
        }

        /* Cart Items */
        .cart-items {
            background: white;
            border-radius: 15px;
            padding: 2rem;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
        }

        .cart-item {
            display: flex;
            gap: 1.5rem;
            padding: 1.5rem;
            border-bottom: 1px solid #e0e0e0;
            align-items: center;
        }

        .cart-item:last-child {
            border-bottom: none;
        }

        .item-image {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 10px;
            background: #e0e0e0;
        }

        .item-details {
            flex: 1;
        }

        .item-name {
            font-size: 1.3rem;
            font-weight: bold;
            color: #3e2723;
            margin-bottom: 0.5rem;
        }

        .item-price {
            color: #ff6f00;
            font-size: 1.1rem;
            font-weight: bold;
        }

        .item-controls {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .quantity-control {
            display: flex;
            align-items: center;
            gap: 0.8rem;
            background: #f5f5f5;
            padding: 0.5rem 1rem;
            border-radius: 50px;
        }

        .qty-btn {
            background: #ff6f00;
            color: white;
            border: none;
            width: 30px;
            height: 30px;
            border-radius: 50%;
            font-size: 1.2rem;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.3s;
        }

        .qty-btn:hover {
            background: #ff8f00;
            transform: scale(1.1);
        }

        .qty-number {
            font-weight: bold;
            font-size: 1.1rem;
            min-width: 30px;
            text-align: center;
        }

        .remove-btn {
            background: #f44336;
            color: white;
            border: none;
            padding: 0.5rem 1rem;
            border-radius: 50px;
            cursor: pointer;
            transition: all 0.3s;
            font-weight: bold;
        }

        .remove-btn:hover {
            background: #d32f2f;
            transform: scale(1.05);
        }

        /* Checkout Section */
        .checkout-section {
            background: white;
            border-radius: 15px;
            padding: 2rem;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
            height: fit-content;
            position: sticky;
            top: 110px;
        }

        .checkout-title {
            font-size: 1.5rem;
            color: #3e2723;
            margin-bottom: 1.5rem;
            padding-bottom: 1rem;
            border-bottom: 2px solid #e0e0e0;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            color: #555;
            font-weight: 500;
        }

        .form-group input,
        .form-group select {
            width: 100%;
            padding: 0.8rem;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            font-size: 1rem;
            transition: border 0.3s;
        }

        .form-group input:focus,
        .form-group select:focus {
            outline: none;
            border-color: #ff6f00;
        }

        .order-summary {
            margin: 1.5rem 0;
            padding: 1rem 0;
            border-top: 2px solid #e0e0e0;
            border-bottom: 2px solid #e0e0e0;
        }

        .summary-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 0.8rem;
            font-size: 1.1rem;
        }

        .summary-row.total {
            font-size: 1.5rem;
            font-weight: bold;
            color: #3e2723;
            margin-top: 1rem;
        }

        .checkout-btn {
            width: 100%;
            background: #ff6f00;
            color: white;
            border: none;
            padding: 1rem;
            border-radius: 50px;
            font-size: 1.2rem;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s;
            box-shadow: 0 4px 15px rgba(255, 111, 0, 0.3);
        }

        .checkout-btn:hover {
            background: #ff8f00;
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(255, 111, 0, 0.5);
        }

        .checkout-btn:disabled {
            background: #ccc;
            cursor: not-allowed;
            transform: none;
        }

        /* Empty Cart */
        .empty-cart {
            text-align: center;
            padding: 4rem 2rem;
            background: white;
            border-radius: 15px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
        }

        .empty-cart-icon {
            font-size: 5rem;
            margin-bottom: 1rem;
        }

        .empty-cart h2 {
            color: #666;
            margin-bottom: 1rem;
        }

        .empty-cart p {
            color: #999;
            margin-bottom: 2rem;
        }

        .back-to-menu-btn {
            display: inline-block;
            background: #ff6f00;
            color: white;
            padding: 1rem 2rem;
            border-radius: 50px;
            text-decoration: none;
            font-weight: bold;
            transition: all 0.3s;
        }

        .back-to-menu-btn:hover {
            background: #ff8f00;
            transform: translateY(-2px);
        }

        /* Success Modal */
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,0.7);
            z-index: 2000;
            align-items: center;
            justify-content: center;
        }

        .modal.show {
            display: flex;
        }

        .modal-content {
            background: white;
            padding: 3rem;
            border-radius: 20px;
            text-align: center;
            max-width: 500px;
            animation: modalSlideIn 0.3s ease-out;
        }

        @keyframes modalSlideIn {
            from {
                transform: translateY(-100px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        .modal-icon {
            font-size: 5rem;
            margin-bottom: 1rem;
        }

        .modal-content h2 {
            color: #4caf50;
            margin-bottom: 1rem;
        }

        .modal-content p {
            color: #666;
            margin-bottom: 2rem;
            font-size: 1.1rem;
        }

        .modal-btn {
            background: #ff6f00;
            color: white;
            border: none;
            padding: 1rem 3rem;
            border-radius: 50px;
            font-size: 1.1rem;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s;
        }

        .modal-btn:hover {
            background: #ff8f00;
            transform: scale(1.05);
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
        @media (max-width: 968px) {
            .cart-container {
                grid-template-columns: 1fr;
            }

            .checkout-section {
                position: static;
            }

            .cart-item {
                flex-direction: column;
                text-align: center;
            }

            .item-controls {
                flex-direction: column;
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

    <!-- Main Content -->
    <div class="main-content">
        <h1 class="page-title">🛒 Keranjang Pesanan</h1>

        <div id="cartContent">
            <!-- Cart items akan di-render di sini -->
        </div>
    </div>

    <!-- Success Modal -->
    <div class="modal" id="successModal">
        <div class="modal-content">
            <div class="modal-icon">✅</div>
            <h2>Pesanan Berhasil!</h2>
            <p>Terima kasih telah memesan di Beans & Brew. Pesanan Anda sedang diproses.</p>
            <button type="button" onclick="konfirmasiPesanan(event)" class="checkout-btn">Checkout</button>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; 2024 Beans & Brew. All rights reserved. Made with ❤️ and ☕</p>
    </footer>

    <script>
        function getCart() {
            const cart = sessionStorage.getItem('cart');
            return cart ? JSON.parse(cart) : [];
        }

        function saveCart(cart) {
            sessionStorage.setItem('cart', JSON.stringify(cart));
            renderCart();
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

        function updateQuantity(id, change) {
            let cart = getCart();
            const item = cart.find(item => item.id === id);
            
            if (item) {
                item.quantity += change;
                if (item.quantity <= 0) {
                    cart = cart.filter(item => item.id !== id);
                }
                saveCart(cart);
            }
        }

        function removeItem(id) {
            let cart = getCart();
            cart = cart.filter(item => item.id !== id);
            saveCart(cart);
        }

        function calculateTotal() {
            const cart = getCart();
            return cart.reduce((total, item) => total + (item.price * item.quantity), 0);
        }

        function renderCart() {
            const cart = getCart();
            const container = document.getElementById('cartContent');
            
            if (cart.length === 0) {
                container.innerHTML = 
                    '<div class="empty-cart">' +
                        '<div class="empty-cart-icon">🛒</div>' +
                        '<h2>Keranjang Kosong</h2>' +
                        '<p>Belum ada item di keranjang. Yuk, mulai pesan kopi favoritmu!</p>' +
                        '<a href="menu" class="back-to-menu-btn">Lihat Menu</a>' +
                    '</div>';
                return;
            }

            const total = calculateTotal();
            const totalItems = cart.reduce((sum, item) => sum + item.quantity, 0);

            var cartItemsHTML = '';
            for (var i = 0; i < cart.length; i++) {
                var item = cart[i];
                cartItemsHTML += 
                    '<div class="cart-item">' +
                        '<div class="item-details">' +
                            '<div class="item-name">' + item.name + '</div>' +
                            '<div class="item-price">Rp ' + item.price.toLocaleString('id-ID') + '</div>' +
                        '</div>' +
                        '<div class="item-controls">' +
                            '<div class="quantity-control">' +
                                '<button class="qty-btn" onclick="updateQuantity(' + item.id + ', -1)">−</button>' +
                                '<span class="qty-number">' + item.quantity + '</span>' +
                                '<button class="qty-btn" onclick="updateQuantity(' + item.id + ', 1)">+</button>' +
                            '</div>' +
                            '<button class="remove-btn" onclick="removeItem(' + item.id + ')">🗑️ Hapus</button>' +
                        '</div>' +
                    '</div>';
            }

            // Ganti bagian checkout-section di dalam renderCart() menjadi seperti ini:

        container.innerHTML = 
            '<div class="cart-container">' +
                '<div class="cart-items">' +
                    cartItemsHTML +
                '</div>' +
                // AWAL FORM
                '<form action="pesanan" method="post" class="checkout-section">' + 
                    '<h2 class="checkout-title">Detail Pesanan</h2>' +

                    '<div class="form-group">' +
                        '<label>Nama Lengkap</label>' +
                        '<input type="text" name="nama_pelanggan" placeholder="Nama" required>' +
                    '</div>' +

                    '<div class="form-group">' +
                        '<label>No. HP</label>' +
                        '<input type="text" name="no_telp" placeholder="No HP" required>' +
                    '</div>' +

                    '<div class="form-group">' +
                        '<label>Metode Pembayaran</label>' +
                        '<select name="metode_pembayaran" required>' +
                            '<option value="">-- Pilih Metode --</option>' +
                            '<option value="Cash">Cash</option>' +
                            '<option value="QRIS">QRIS</option>' +
                        '</select>' +
                    '</div>' +

            // Input hidden untuk total (otomatis terisi)
            '<input type="hidden" name="total" id="hiddenTotal" value="' + total + '">' +

            '<div class="order-summary">' +
                '<div class="summary-row total">' +
                    '<span>Total:</span>' +
                    '<span>Rp ' + total.toLocaleString('id-ID') + '</span>' +
                '</div>' +
            '</div>' +
            
            '<button type="submit" class="checkout-btn">Checkout</button>' +
        '</form>' +
        // AKHIR FORM
    '</div>';
        }

        function checkout() {
            const name = document.getElementById('customerName').value.trim();
            const phone = document.getElementById('customerPhone').value.trim();
            const payment = document.getElementById('paymentMethod').value;

            if (!name || !phone) {
                alert('Mohon lengkapi nama dan nomor telepon!');
                return;
            }

            // Untuk sementara simpan di sessionStorage
            // Nanti bisa diganti dengan AJAX request ke server
            const orderData = {
                name: name,
                phone: phone,
                payment: payment,
                items: getCart(),
                total: calculateTotal(),
                date: new Date().toISOString()
            };

            console.log('Order Data:', orderData);
            
            // Clear cart
            sessionStorage.removeItem('cart');
            
            // Show success modal
            document.getElementById('successModal').classList.add('show');
        }

        function backToMenu() {
            window.location.href = 'menu';
        }

        // Initialize on page load
        document.addEventListener('DOMContentLoaded', function() {
            renderCart();
            updateCartBadge();
        });
    </script>
</body>
</html>