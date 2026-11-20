<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.Manager6" %>
<%
    Manager6 manager = (Manager6) session.getAttribute("manager");
    if (manager == null) {
        response.sendRedirect("../thanhvien/gdLogin6.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trang chủ quản lí</title>
    <style>
        body { font-family: Arial, sans-serif; display: flex; justify-content: center; margin-top: 60px; }
        .container { border: 2px solid #000; width: 500px; padding: 40px 30px; text-align: center; }
        h1 { margin-bottom: 40px; }
        .menu-link { font-size: 22px; text-decoration: none; color: #000; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Trang chủ quản lí</h1>
        <a id="viewStatistic" class="menu-link" href="gdChooseStatistics6.jsp">Xem thống kê</a>
    </div>
</body>
</html>