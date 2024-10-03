<%-- 
    Document   : delete
    Created on : Oct 2, 2024, 4:17:37 PM
    Author     : Do Van Luan - CE180457
--%>

<%@page import="Model.Genre"%>
<%@page import="DAO.GenreDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    GenreDAO gDAO = new GenreDAO();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete genre</title>
    </head>
    <body>
        <h1>Delete genre</h1>
        <%
            if (request.getMethod().equals("POST")) {
                if (gDAO.delete(id) == 1) {
                    response.sendRedirect("list.jsp");
                }
            } else {
                Genre g = gDAO.getOnlyById(id);
                if (g != null) {

        %>
        <form method="POST">
            <div>Are you sure to delete genre with id <%= id%>?</div>
            <div><a>Back</a> <button>Delete</button></div>
        </form>
        <%
        } else {
        %>
        <div>There is no genre with id <%= id%>!</div>
        <%
                }
            }
        %>
    </body>
</html>
