<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    try {
        Class.forName("org.postgresql.Driver");
        Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/Pets", "postgres", "root");

        String query = "SELECT * FROM admin_login WHERE email = ? AND password = ?";
        PreparedStatement pst = conn.prepareStatement(query);
        pst.setString(1, email);
        pst.setString(2, password);

        ResultSet resultSet = pst.executeQuery();

        if (resultSet.next()) {

            session = request.getSession();
            session.setAttribute("email", email);

            response.sendRedirect("AdminDashboard.jsp");
            return; // Add return statement to stop further execution
        } else {
            // Display error message as a pop-up using JavaScript
%>
<script>
    alert("Invalid email/password");
    window.location = "AdminLogin.jsp";
</script>
<%
        }

        resultSet.close();
        pst.close();
        conn.close();
    } catch (SQLException e) {
        e.printStackTrace();
        // Handle the SQL exception
    } catch (Exception e) {
        e.printStackTrace();
        // Handle other exceptions
    }
%>