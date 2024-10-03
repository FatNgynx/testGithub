<%-- 
    Document   : edit
    Created on : Sep 26, 2024, 5:34:09 PM
    Author     : Do Van Luan - CE180457
--%>

<%@page import="java.util.ArrayList"%>
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
        <title>Edit genre</title>
    </head>
    <body>
        <h1>Edit genre</h1>
        <%
            if (request.getMethod().equals("POST")) {
                String name = request.getParameter("genreName");
                if (gDAO.update(new Genre(id, name)) == 1) {
                    response.sendRedirect("list.jsp");
                }
            } else {
                Genre g = gDAO.getOnlyById(id);
                if (g != null) {

        %>
        <form method="post">
            <div>
                <label for="genreId">Genre ID</label>
                <input type="text" name="id"
                       readonly="readonly" id="genreId" value="<%= id%>"/>
            </div>
            <div>
                <label for="genreName">Genre name</label>
                <input type="text" value="<%= g.getName()%>"
                       name="genreName" placeholder="Insert new genre name..." id="genreName"/>
            </div>

            <div> 
                <button>Edit</button>
            </div>
        </form>
        <% } else {%>
        <p>There is no genre with ID <%= id%>!
            <%
                    }
                }
            %>

    </body>
</html>
