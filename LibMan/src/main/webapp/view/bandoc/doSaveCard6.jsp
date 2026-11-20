<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="dao.ReaderDAO6, dao.ReaderCardDAO6, model.Reader6, model.ReaderCard6" %>
<%
    ReaderCard6 card = (ReaderCard6) session.getAttribute("pendingCard");
    if (card == null) {
        response.sendRedirect("gdMainReader6.jsp");
        return;
    }

    Reader6 reader = card.getReader();

    ReaderDAO6 readerDAO = new ReaderDAO6();
    ReaderCardDAO6 cardDAO = new ReaderCardDAO6();

    boolean updated = readerDAO.updateReaderProfile(reader);
    boolean inserted = cardDAO.addReaderCard(card);

    if (updated && inserted) {
        session.setAttribute("reader", reader);
        session.removeAttribute("pendingCard");
%>
        <script>
            alert("Đăng ký thẻ bạn đọc thành công!");
            window.location.href = "gdMainReader6.jsp";
        </script>
<%
    } else {
%>
        <script>
            alert("Có lỗi xảy ra khi lưu thẻ bạn đọc. Vui lòng thử lại!");
            window.location.href = "gdRegisterReaderCard6.jsp";
        </script>
<%
    }
%>