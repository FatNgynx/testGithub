<%-- 
    Document   : create
    Created on : Oct 1, 2024, 2:14:57 PM
    Author     : Do Van Luan - CE180457
--%>

<%@page import="Model.Genre"%>
<%@page import="DAO.GenreDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create new genre</title>
    </head>
    <body>
        
        <h1> Create new Genre <h1>
        <% //Kiểm tra nếu request đang gọi vào trang JSP hiện tại (create.jsp) là POST (submit bằng form)
            if(request.getMethod().equals("POST")){
            // Lấy giá trị được truyền từ form
            String name = request.getParameter("genreName");
            // Validation giá trị truyền vào (NEVER TRUST THE CLIENT)
            if (name != null && !name.isEmpty() && !name.equals("")){
            //Tạo một đối tượng DAO để gọi hàm create()
            GenreDAO gDAO = new GenreDAO();
            // Khởi tạo 1 đối tượng Genre với ID bất kì do ta đã nội suy được next ID
            // Nếu hàm create trả về KQ 1 xem như đã insert thành công vào DB
            if (gDAO.create(new Genre(0, name)) == 1){
            // Chuyển hướng người dùng về trang list.jsp
                 response.sendRedirect("list.jsp");
            }
        }
    } else { // Nếu request hiện tại là GET (truy cập thằng từ browser)
       
        %>
        <%-- Form không có action tức sẽ gởi request về trang đang đứng (create.jsp) --%>
        <form>
            <div>
                <label for="genreName">Genre name</label>
                <input type="text" required placeholder="Insert new genre name..."
                       name="genreName" id="genreName"/>
                <%-- Thuộc tính name của input sẽ quy định parameter truyền đi --%>
            </div>
            <div>
                <button>Create</button>
            </div>
        </form>
            <%
                }
            %>
    </body>
</html>
