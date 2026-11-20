<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.text.NumberFormat, java.util.Locale, dao.InvoiceDAO6, model.Invoice6, model.InvoiceDetail6, model.Manager6" %>
<%
    Manager6 manager = (Manager6) session.getAttribute("manager");
    if (manager == null) {
        response.sendRedirect("../thanhvien/gdLogin6.jsp");
        return;
    }

    int invoiceId = Integer.parseInt(request.getParameter("invoiceId"));
    String importId = request.getParameter("importId");
    String supplierId = request.getParameter("supplierId");
    String supplierName = request.getParameter("supplierName");
    String startStr = request.getParameter("startDate");
    String endStr = request.getParameter("endDate");

    InvoiceDAO6 invoiceDAO = new InvoiceDAO6();
    Invoice6 invoice = invoiceDAO.getInvoiceById(invoiceId);

    NumberFormat nf = NumberFormat.getInstance(new Locale("vi", "VN"));
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chi tiết hoá đơn</title>
    <style>
        body { font-family: Arial, sans-serif; display: flex; justify-content: center; margin-top: 40px; }
        .container { border: 2px solid #000; width: 760px; padding: 30px 40px; }
        h1 { text-align: center; margin-bottom: 20px; }
        .meta-bar { display: flex; justify-content: space-between; margin-bottom: 20px; font-size: 16px; }
        table { width: 100%; border-collapse: collapse; margin-bottom: 12px; }
        th, td { border: 1.5px solid #000; padding: 8px 10px; text-align: center; }
        td.left { text-align: left; }
        .total-row { text-align: right; font-size: 17px; font-weight: bold; margin-bottom: 20px; }
        .btn { padding: 6px 18px; border: 2px solid #000; background: #fff; font-weight: bold; text-decoration: none; color: #000; display: inline-block; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Chi tiết hoá đơn</h1>
        <div class="meta-bar">
            <div>Mã hoá đơn: <b>HD<%= invoice != null ? invoice.getId() : invoiceId %></b></div>
            <div>Mã lần nhập: <b>LN<%= importId %></b></div>
            <div>Nhà cung cấp: <b><%= supplierName %></b></div>
        </div>

        <table id="tblInvoiceDetail">
            <thead>
                <tr>
                    <th style="width: 50px;">TT</th>
                    <th>Mã tài liệu</th>
                    <th>Tên tài liệu</th>
                    <th>Tên tác giả</th>
                    <th>Số lượng</th>
                    <th>Đơn giá</th>
                </tr>
            </thead>
            <tbody>
                <%
                    if (invoice != null && invoice.getDsInvoiceDetail() != null) {
                        int stt = 1;
                        for (InvoiceDetail6 d : invoice.getDsInvoiceDetail()) {
                %>
                <tr>
                    <td><%= stt++ %></td>
                    <td>TL<%= d.getDocument().getId() %></td>
                    <td class="left"><%= d.getDocument().getDocumentName() %></td>
                    <td class="left"><%= d.getDocument().getAuthor() %></td>
                    <td><%= d.getQuantity() %></td>
                    <td><%= nf.format(d.getUnitPrice()) %></td>
                </tr>
                <%
                        }
                    }
                %>
            </tbody>
        </table>

        <div class="total-row">
            Tổng tiền: <%= invoice != null ? nf.format(invoice.getTotalAmount()) : "0" %>
        </div>

        <a id="btnReturn" href="gdImportList6.jsp?supplierId=<%= supplierId %>&supplierName=<%= java.net.URLEncoder.encode(supplierName, "UTF-8") %>&startDate=<%= startStr %>&endDate=<%= endStr %>" class="btn">Quay lại</a>
    </div>
</body>
</html>