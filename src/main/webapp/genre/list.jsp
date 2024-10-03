<%-- 
    Document   : list
    Created on : Sep 26, 2024, 4:54:27 PM
    Author     : Do Van Luan - CE180457
--%>


<%@page import="Model.Genre"%>
<%@page import="java.util.Date" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DAO.GenreDAO" %>
<%@page import="db.DBContext" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
    // Tạo đối tượng DAO để gọi hàm lấy danh sách
    GenreDAO gDAO = new GenreDAO();
    ArrayList<Genre> genres = gDAO.getAll();
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Music genres list</title>
        <style>
            table tr td,th {
                border: 1px solid black;
            }
        </style>
    </head>
    <body>
        <h1>List of music genres</h1>
        <a href="create.jsp">Create</a>
        <% 
            if (genres != null && !genres.isEmpty()){%>
            <table>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Actions</th>
                </tr>
                <% 
                for (Genre g : genres) {
                %>
                <tr>
                    <td>
                        <%= g.getID()%>
                    </td>
                    <td>
                        <%= g.getName() %>
                    </td>
                    <td>
                        <a href="edit.jsp?id=<%= g.getID()%>">Edit</a>
                        <a href="delete.jsp?id=<%= g.getID()%>">Delete</a>
                    </td>
                </tr>
                <%
                    }
                %>
            </table>
            <% } else { %>
            <div>
                There is no genre!
            </div>
            <% } %>
    </body>
</html>