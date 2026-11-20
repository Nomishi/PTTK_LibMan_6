<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.Date, java.util.List, dao.TKSupplierDAO6, model.Manager6, model.TKSupplier6" %>
<%
    Manager6 manager = (Manager6) session.getAttribute("manager");
    if (manager == null) {
        response.sendRedirect("../thanhvien/gdLogin6.jsp");
        return;
    }

    String startStr = request.getParameter("txtStartDate");
    String endStr = request.getParameter("txtEndDate");
    List<TKSupplier6> listTKSupplier = null;

    if (startStr != null && !startStr.isEmpty() && endStr != null && !endStr.isEmpty()) {
        Date startDate = Date.valueOf(startStr);
        Date endDate = Date.valueOf(endStr);
        TKSupplierDAO6 tkDAO = new TKSupplierDAO6();
        listTKSupplier = tkDAO.getSupplierStatistic(startDate, endDate);
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thống kê nhà cung cấp</title>
    <style>
        body { font-family: Arial, sans-serif; display: flex; justify-content: center; margin-top: 40px; }
        .container { border: 2px solid #000; width: 680px; padding: 30px 40px; }
        h1 { text-align: center; margin-bottom: 25px; }
        .filter-bar { display: flex; align-items: center; justify-content: center; gap: 15px; margin-bottom: 25px; }
        .filter-bar input[type="date"] { padding: 5px; border: 1.5px solid #000; }
        .btn { padding: 6px 18px; border: 2px solid #000; background: #fff; font-weight: bold; cursor: pointer; text-decoration: none; color: #000; display: inline-block; }
        table { width: 100%; border-collapse: collapse; margin-bottom: 20px; }
        th, td { border: 1.5px solid #000; padding: 8px 12px; text-align: center; }
        td.left { text-align: left; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Thống kê nhà cung cấp</h1>
        <form class="filter-bar" action="gdSupplierStatistics6.jsp" method="get">
            <label>Bắt đầu:</label>
            <input type="date" id="txtStartDate" name="txtStartDate" value="<%= startStr != null ? startStr : "" %>" required>
            <label>Kết thúc:</label>
            <input type="date" id="txtEndDate" name="txtEndDate" value="<%= endStr != null ? endStr : "" %>" required>
            <button type="submit" id="btnStatistic" name="btnStatistic" class="btn">Thống kê</button>
        </form>

        <table id="tblTKSupplier">
            <thead>
                <tr>
                    <th style="width: 60px;">TT</th>
                    <th>Tên nhà cung cấp</th>
                    <th style="width: 180px;">Tổng số lượng nhập</th>
                </tr>
            </thead>
            <tbody>
                <%
                    if (listTKSupplier != null && !listTKSupplier.isEmpty()) {
                        int stt = 1;
                        for (TKSupplier6 tk : listTKSupplier) {
                %>
                <tr>
                    <td><%= stt++ %></td>
                    <td class="left">
                        <a class="chooseSupplier" href="gdImportList6.jsp?supplierId=<%= tk.getId() %>&supplierName=<%= java.net.URLEncoder.encode(tk.getSupplierName(), "UTF-8") %>&startDate=<%= startStr %>&endDate=<%= endStr %>">
                            <%= tk.getSupplierName() %>
                        </a>
                    </td>
                    <td><%= tk.getImportedQuantity() %></td>
                </tr>
                <%
                        }
                    } else if (listTKSupplier != null) {
                %>
                <tr>
                    <td colspan="3">Không có dữ liệu nhập trong khoảng thời gian này.</td>
                </tr>
                <%  } else { %>
                <tr>
                    <td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>
                </tr>
                <%  } %>
            </tbody>
        </table>

        <a id="btnReturn" href="gdChooseStatistics6.jsp" class="btn">Quay lại</a>
    </div>
</body>
</html>