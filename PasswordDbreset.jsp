<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.Random" %>
<%@ page import=" java.util.Properties" %>

<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String cpassword = request.getParameter("cpassword");

    try {
        // Establish a database connection
        Class.forName("org.postgresql.Driver");
        Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/Pets", "postgres", "root");

        // Update query
        String updateQuery = "UPDATE user_details SET password=?, cpassword=? WHERE email = ?";
        PreparedStatement updateStatement = conn.prepareStatement(updateQuery);
        updateStatement.setString(1, password);
        updateStatement.setString(2, cpassword);
        updateStatement.setString(3, email);

        int rowsUpdated = updateStatement.executeUpdate();

        if (rowsUpdated > 0) {
            out.println("<script>alert('Password updated'); window.location.href='UserLogin.jsp';</script>");
        } else {
            out.println("<script>alert('Password update failed'); window.location.href='PasswordReset.jsp';</script>");
        }

        updateStatement.close();
        conn.close();
    } catch (SQLException e) {
        e.printStackTrace();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
