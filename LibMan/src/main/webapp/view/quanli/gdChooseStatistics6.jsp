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
    <title>Chọn thống kê</title>
    <style>
        body { font-family: Arial, sans-serif; display: flex; justify-content: center; margin-top: 60px; }
        .container { border: 2px solid #000; width: 520px; padding: 30px 40px; }
        h1 { text-align: center; margin-bottom: 30px; }
        .content { display: flex; align-items: flex-start; justify-content: center; gap: 25px; }
        .label { font-size: 18px; padding-top: 10px; }
        .options { display: flex; flex-direction: column; gap: 15px; width: 220px; }
        .opt-btn { display: block; border: 2px solid #000; padding: 10px 15px; text-align: left; text-decoration: none; color: #000; font-size: 18px; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Chọn thống kê</h1>
        <div class="content">
            <div class="label">Loại thống kê:</div>
            <div class="options">
                <a class="opt-btn" href="#">Người dùng</a>
                <a class="opt-btn" href="#">Tài liệu</a>
                <a id="supplierStatistic" class="opt-btn" href="gdSupplierStatistics6.jsp">Nhà cung cấp</a>
            </div>
        </div>
    </div>
</body>
</html>