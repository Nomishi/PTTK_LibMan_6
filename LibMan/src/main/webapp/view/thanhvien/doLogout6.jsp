<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    // Hủy toàn bộ phiên làm việc hiện tại (xóa reader, manager, staff, pendingCard...)
    session.invalidate();
    
    // Quay về trang đăng nhập
    response.sendRedirect("gdLogin6.jsp");
%>