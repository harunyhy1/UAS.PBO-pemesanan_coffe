<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Login | Beans & Brew</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #3b2a24, #5a3e36);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-card {
            background: #f5f1ee;
            width: 360px;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0,0,0,.3);
            text-align: center;
        }

        .login-card h2 {
            margin-bottom: 10px;
            color: #3b2a24;
        }

        .login-card p {
            font-size: 14px;
            color: #777;
            margin-bottom: 25px;
        }

        .login-card input {
            width: 100%;
            padding: 12px;
            margin-bottom: 15px;
            border-radius: 8px;
            border: 1px solid #ccc;
            font-size: 14px;
        }

        .login-card button {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 25px;
            background: #ff8c42;
            color: white;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: .3s;
        }

        .login-card button:hover {
            background: #e6762e;
        }

        .error {
            color: red;
            font-size: 13px;
            margin-top: 10px;
        }
    </style>
</head>
<body>

<div class="login-card">
    <h2>Beans & Brew</h2>
    <p>Silakan login untuk masuk dashboard</p>

    <form action="login" method="post" autocomplete="off">

        <!-- dummy field anti autofill -->
        <input type="text" name="fakeuser" style="display:none">
        <input type="password" name="fakepass" style="display:none">

        <input type="text"
               name="username"
               placeholder="Username"
               autocomplete="off"
               required>

        <input type="password"
               name="password"
               placeholder="Password"
               autocomplete="new-password"
               required>

        <button type="submit">Login</button>
    </form>

    <%
        if (request.getParameter("error") != null) {
    %>
        <div class="error">Username atau password salah</div>
    <%
        }
    %>
</div>

</body>
</html>
