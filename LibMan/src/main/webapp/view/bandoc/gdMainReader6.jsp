<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.Reader6" %>
<%
    Reader6 reader = (Reader6) session.getAttribute("reader");
    if (reader == null) {
        response.sendRedirect("../thanhvien/gdLogin6.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trang chủ bạn đọc</title>
    <style>
        body { font-family: Arial, sans-serif; display: flex; justify-content: center; margin-top: 60px; }
        .container { border: 2px solid #000; width: 500px; padding: 30px; text-align: center; }
        .menu-link { display: inline-block; margin: 30px 0; font-size: 20px; text-decoration: none; color: #000; border: 1.5px solid #000; padding: 10px 25px; }
        .header-info { text-align: right; font-size: 14px; }
    </style>
</head>
<body>
    <div class="container">
        <div class="header-info">
            Xin chào, <b><%= reader.getFullName() %></b> | 
            <a href="../thanhvien/doLogout6.jsp">Đăng xuất</a>
        </div>
        <h1>Trang chủ bạn đọc</h1>
        <a id="registerReaderCard" class="menu-link" href="gdRegisterReaderCard6.jsp">Đăng kí thẻ</a>
    </div>
</body>
</html>