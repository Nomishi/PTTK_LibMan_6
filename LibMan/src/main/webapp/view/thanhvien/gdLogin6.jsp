<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập - LibMan</title>
    <style>
        body { font-family: Arial, sans-serif; display: flex; justify-content: center; margin-top: 80px; }
        .login-box { border: 2px solid #000; width: 380px; padding: 30px 40px; text-align: center; }
        h2 { margin-bottom: 20px; }
        .form-row { text-align: left; margin-bottom: 15px; }
        .form-row label { display: block; font-weight: bold; margin-bottom: 5px; }
        .form-row input { width: 100%; padding: 8px; border: 1.5px solid #000; box-sizing: border-box; }
        .btn { padding: 8px 30px; font-size: 16px; font-weight: bold; border: 2px solid #000; background: #fff; cursor: pointer; margin-top: 10px; }
        .error { color: red; font-weight: bold; margin-bottom: 15px; }
    </style>
</head>
<body>
    <div class="login-box">
        <h2>ĐĂNG NHẬP HỆ THỐNG</h2>
        <% if ("1".equals(request.getParameter("err"))) { %>
            <div class="error">Sai tên đăng nhập hoặc mật khẩu!</div>
        <% } %>
        <form action="doLogin6.jsp" method="post">
            <div class="form-row">
                <label>Tên đăng nhập:</label>
                <input type="text" name="username" required>
            </div>
            <div class="form-row">
                <label>Mật khẩu:</label>
                <input type="password" name="password" required>
            </div>
            <button type="submit" class="btn">Đăng nhập</button>
        </form>
    </div>
</body>
</html>