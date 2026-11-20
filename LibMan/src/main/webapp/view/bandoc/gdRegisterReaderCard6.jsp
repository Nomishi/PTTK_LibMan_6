<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="dao.ReaderDAO6, model.Reader6, model.ReaderCard6" %>
<%
    Reader6 sessionReader = (Reader6) session.getAttribute("reader");
    if (sessionReader == null) {
        response.sendRedirect("../thanhvien/gdLogin6.jsp");
        return;
    }
    
    ReaderCard6 pendingCard = (ReaderCard6) session.getAttribute("pendingCard");
    Reader6 reader = null;
    if (pendingCard != null && pendingCard.getReader() != null) {
        reader = pendingCard.getReader();
    } else {
        ReaderDAO6 readerDAO = new ReaderDAO6();
        reader = readerDAO.getReaderById(sessionReader.getId());
        if (reader == null) {
            reader = sessionReader;
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng kí thẻ bạn đọc</title>
    <style>
        body { font-family: Arial, sans-serif; display: flex; justify-content: center; margin-top: 40px; }
        .container { border: 2px solid #000; width: 520px; padding: 30px 40px; }
        h1 { text-align: center; margin-bottom: 25px; }
        .form-row { display: flex; align-items: center; margin-bottom: 14px; }
        .form-row label { width: 150px; font-weight: bold; }
        .form-row input, .form-row select { flex: 1; padding: 6px; border: 1.5px solid #000; }
        .btn-wrap { text-align: center; margin-top: 25px; }
        .btn { padding: 8px 30px; font-size: 16px; font-weight: bold; border: 2px solid #000; background: #fff; cursor: pointer;
        .req { color: red; margin-left: 3px; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Đăng kí thẻ</h1>
        <form action="gdSubmitReaderCard6.jsp" method="post">
            <div class="form-row">
                <label>Họ và tên:</label>
                <input type="text" name="fullName" value="<%= reader.getFullName() != null ? reader.getFullName() : "" %>" required>
            </div>
            <div class="form-row">
                <label>Email:</label>
                <input type="email" name="email" value="<%= reader.getEmail() != null ? reader.getEmail() : "" %>" required>
            </div>
            <div class="form-row">
                <label>Số điện thoại:</label>
                <input type="text" name="phone" value="<%= reader.getPhone() != null ? reader.getPhone() : "" %>" required>
            </div>
            <div class="form-row">
                <label>Ngày sinh:</label>
                <input type="date" id="txtdateOfBirth" name="txtdateOfBirth" value="<%= reader.getDateOfBirth() != null ? reader.getDateOfBirth() : "" %>" required>
            </div>
            <div class="form-row">
                <label>Địa chỉ:</label>
                <input type="text" id="txtAddress" name="txtAddress" value="<%= reader.getAddress() != null ? reader.getAddress() : "" %>" required>
            </div>
            <div class="form-row">
                <label>Loại bạn đọc:</label>
                <select id="slReaderType" name="slReaderType" required>
                    <option value="">--Chọn loại bạn đọc--</option>
                    <option value="Sinh viên" <%= "Sinh viên".equals(reader.getReaderType()) ? "selected" : "" %>>Sinh viên</option>
                    <option value="Giảng viên" <%= "Giảng viên".equals(reader.getReaderType()) ? "selected" : "" %>>Giảng viên</option>
                    <option value="Cán bộ" <%= "Cán bộ".equals(reader.getReaderType()) ? "selected" : "" %>>Cán bộ</option>
                    <option value="Khác" <%= "Khác".equals(reader.getReaderType()) ? "selected" : "" %>>Khác</option>
                </select>
            </div>
            <div class="form-row">
                <label>Mã định danh:</label>
                <input type="text" id="txtReaderCode" name="txtReaderCode" value="<%= reader.getReaderCode() != null ? reader.getReaderCode() : "" %>" placeholder="VD: B23DCCN486">
            </div>
            <div class="btn-wrap">
                <button type="submit" id="btnSend" name="btnSend" class="btn">Gửi</button>
            </div>
        </form>
    </div>
</body>
</html>