<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="dao.UserDAO6, model.*" %>
<%
    request.setCharacterEncoding("UTF-8");
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    UserDAO6 userDAO = new UserDAO6();
    User6 user = userDAO.checkLogin(username, password);

    if (user instanceof Reader6) {
        session.setAttribute("reader", (Reader6) user);
        response.sendRedirect("../bandoc/gdMainReader6.jsp");
    } else if (user instanceof Manager6) {
        session.setAttribute("manager", (Manager6) user);
        response.sendRedirect("../quanli/gdMainManager6.jsp");
    } else if (user instanceof Staff6) {
        session.setAttribute("staff", (Staff6) user);
        response.sendRedirect("../nhanvien/gdMainStaff6.jsp");
    } else {
        response.sendRedirect("gdLogin6.jsp?err=1");
    }
%>