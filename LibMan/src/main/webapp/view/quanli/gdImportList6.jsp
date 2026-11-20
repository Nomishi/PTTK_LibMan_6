<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.Date, java.time.format.DateTimeFormatter, java.util.List, dao.ImportDocumentDAO6, model.ImportDocument6, model.Manager6, model.TKSupplier6" %>
<%
    Manager6 manager = (Manager6) session.getAttribute("manager");
    if (manager == null) {
        response.sendRedirect("../thanhvien/gdLogin6.jsp");
        return;
    }

    int supplierId = Integer.parseInt(request.getParameter("supplierId"));
    String supplierName = request.getParameter("supplierName");
    String startStr = request.getParameter("startDate");
    String endStr = request.getParameter("endDate");
    Date startDate = Date.valueOf(startStr);
    Date endDate = Date.valueOf(endStr);

    TKSupplier6 tkSupplier = new TKSupplier6();
    tkSupplier.setId(supplierId);
    tkSupplier.setSupplierName(supplierName);
    tkSupplier.setStartDate(java.sql.Date.valueOf(startStr));
    tkSupplier.setEndDate(java.sql.Date.valueOf(endStr));

    ImportDocumentDAO6 importDAO = new ImportDocumentDAO6();
    List<ImportDocument6> listImport = importDAO.getImportBySupplier(tkSupplier);

    DateTimeFormatter fmt = DateTimeFormatter.ofPattern("dd/MM/yyyy");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thống kê lần nhập</title>
    <style>
        body { font-family: Arial, sans-serif; display: flex; justify-content: center; margin-top: 40px; }
        .container { border: 2px solid #000; width: 700px; padding: 30px 40px; }
        h1 { text-align: center; margin-bottom: 20px; }
        .info-bar { display: flex; justify-content: space-between; margin-bottom: 20px; font-size: 15px; }
        .info-bar span.box { border: 1.5px solid #000; padding: 3px 10px; }
        table { width: 100%; border-collapse: collapse; margin-bottom: 20px; }
        th, td { border: 1.5px solid #000; padding: 8px 12px; text-align: center; }
        .btn { padding: 6px 18px; border: 2px solid #000; background: #fff; font-weight: bold; text-decoration: none; color: #000; display: inline-block; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Thống kê lần nhập</h1>
        <div class="info-bar">
            <div>Bắt đầu: <span class="box"><%= startDate.toLocalDate().format(fmt) %></span></div>
            <div>Kết thúc: <span class="box"><%= endDate.toLocalDate().format(fmt) %></span></div>
            <div>Nhà cung cấp: <b><%= supplierName %></b></div>
        </div>

        <table id="tblImportDoc">
            <thead>
                <tr>
                    <th style="width: 60px;">TT</th>
                    <th>Mã lần nhập</th>
                    <th>Ngày nhập</th>
                    <th>Số lượng nhập</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int stt = 1;
                    for (ImportDocument6 imp : listImport) {
                %>
                <tr>
                    <td><%= stt++ %></td>
                    <td>
                        <a class="chooseImport" href="gdInvoiceDetail6.jsp?invoiceId=<%= imp.getInvoice().getId() %>&importId=<%= imp.getId() %>&supplierId=<%= supplierId %>&supplierName=<%= java.net.URLEncoder.encode(supplierName, "UTF-8") %>&startDate=<%= startStr %>&endDate=<%= endStr %>">
                            LN<%= imp.getId() %>
                        </a>
                    </td>
                    <td><%= imp.getImportedDate().toLocalDate().format(fmt) %></td>
                    <td><%= imp.getTotalImportedQuantity() %></td>
                </tr>
                <%  } %>
            </tbody>
        </table>

        <a id="btnReturn" href="gdSupplierStatistics6.jsp?txtStartDate=<%= startStr %>&txtEndDate=<%= endStr %>" class="btn">Quay lại</a>
    </div>
</body>
</html>