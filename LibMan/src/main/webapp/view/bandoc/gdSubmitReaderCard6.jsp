<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.Date, java.time.LocalDate, java.time.format.DateTimeFormatter, java.util.regex.*, model.Reader6, model.ReaderCard6" %>
<%!
    public LocalDate calExpiryDate(LocalDate regDate, String readerType, String readerCode) {
        if ("Sinh viên".equalsIgnoreCase(readerType)) {
            if (readerCode != null && !readerCode.trim().isEmpty()) {
                Matcher m = Pattern.compile("^[A-Za-z]+(\\d{2})").matcher(readerCode.trim());
                if (m.find()) {
                    int enrollYear = 2000 + Integer.parseInt(m.group(1));
                    LocalDate standardGradDate = LocalDate.of(enrollYear + 4, 6, 30);
                    if (!regDate.isAfter(standardGradDate)) {
                        return standardGradDate;
                    }
                }
            }
            return regDate.plusYears(1);
        } else if ("Giảng viên".equalsIgnoreCase(readerType) || "Cán bộ".equalsIgnoreCase(readerType)) {
            return regDate.plusYears(2);
        } else {
            return regDate.plusYears(1);
        }
    }
%>
<%
    request.setCharacterEncoding("UTF-8");
    Reader6 sessionReader = (Reader6) session.getAttribute("reader");
    if (sessionReader == null) {
        response.sendRedirect("../thanhvien/gdLogin6.jsp");
        return;
    }

    String fullName = request.getParameter("fullName");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String dobStr = request.getParameter("txtdateOfBirth");
    String address = request.getParameter("txtAddress");
    String readerType = request.getParameter("slReaderType");
    String readerCode = request.getParameter("txtReaderCode");
    
    if (fullName == null || fullName.trim().isEmpty() ||
        email == null || email.trim().isEmpty() ||
        phone == null || phone.trim().isEmpty() ||
        dobStr == null || dobStr.trim().isEmpty() ||
        address == null || address.trim().isEmpty() ||
        readerType == null || readerType.trim().isEmpty()) {
%>
        <script>
            alert("Bạn chưa điền đủ thông tin!");
            window.history.back();
        </script>
<%
        return;
    }

    LocalDate today = LocalDate.now();
    LocalDate expiry = calExpiryDate(today, readerType, readerCode);
    DateTimeFormatter fmt = DateTimeFormatter.ofPattern("dd/MM/yyyy");

    Reader6 reader = new Reader6();
    reader.setId(sessionReader.getId());
    reader.setUserName(sessionReader.getUserName());
    reader.setFullName(fullName);
    reader.setEmail(email);
    reader.setPhone(phone);
    reader.setDateOfBirth(Date.valueOf(dobStr));
    reader.setAddress(address);
    reader.setReaderType(readerType);
    reader.setReaderCode(readerCode);

    ReaderCard6 card = new ReaderCard6();
    card.setRegistrationDate(Date.valueOf(today));
    card.setExpiryDate(Date.valueOf(expiry));
    card.setReader(reader);

    session.setAttribute("pendingCard", card);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Xác nhận thông tin thẻ</title>
    <style>
        body { font-family: Arial, sans-serif; display: flex; justify-content: center; margin-top: 40px; }
        .container { border: 2px solid #000; width: 540px; padding: 30px 40px; }
        h1 { text-align: center; margin-bottom: 25px; }
        .info-row { margin-bottom: 12px; font-size: 16px; }
        .info-row span.lbl { font-weight: bold; display: inline-block; width: 150px; }
        .date-row { display: flex; justify-content: space-between; margin: 20px 0; font-weight: bold; }
        .btn-group { display: flex; justify-content: space-around; margin-top: 25px; }
        .btn { padding: 8px 28px; font-size: 16px; font-weight: bold; border: 2px solid #000; background: #fff; text-decoration: none; color: #000; cursor: pointer; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Xác nhận thông tin</h1>
        <div class="info-row"><span class="lbl">Họ và tên:</span> <%= reader.getFullName() %></div>
        <div class="info-row"><span class="lbl">Email:</span> <%= reader.getEmail() %></div>
        <div class="info-row"><span class="lbl">Số điện thoại:</span> <%= reader.getPhone() %></div>
        <div class="info-row"><span class="lbl">Ngày sinh:</span> <%= LocalDate.parse(dobStr).format(fmt) %></div>
        <div class="info-row"><span class="lbl">Địa chỉ:</span> <%= reader.getAddress() %></div>
        <div class="info-row"><span class="lbl">Loại bạn đọc:</span> <%= reader.getReaderType() %></div>
        <div class="info-row"><span class="lbl">Mã định danh:</span> <%= (readerCode != null && !readerCode.isEmpty()) ? readerCode : "Không có" %></div>

        <div class="date-row">
            <div>Ngày đăng ký: <%= today.format(fmt) %></div>
            <div>Hạn sử dụng: <%= expiry.format(fmt) %></div>
        </div>

        <form action="doSaveCard6.jsp" method="post" class="btn-group">
            <a id="btnCancel" href="gdRegisterReaderCard6.jsp" class="btn">Hủy</a>
            <button type="submit" id="btnSubmit" name="btnSubmit" class="btn">Xác nhận</button>
        </form>
    </div>
</body>
</html>