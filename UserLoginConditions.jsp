<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
String email = request.getParameter("email");
String password = request.getParameter("password");

System.out.println("email:"+email);

if (email != null && password != null) {
    try {
        Class.forName("org.postgresql.Driver");
        Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/Pets", "postgres", "root");

        String query = "SELECT fname FROM user_details WHERE email = ? AND PASSWORD = ?";
        PreparedStatement pst = conn.prepareStatement(query);
        pst.setString(1, email);
        pst.setString(2, password);

        ResultSet resultSet = pst.executeQuery();

        if (resultSet.next()) {
            String firstName = resultSet.getString("fname");

            // Create or get the existing session
            HttpSession session1 = request.getSession();

            // Set the session attributes
            session1.setAttribute("email", email);
            session1.setAttribute("fname", firstName);

            // Redirect to the UserDashboard.jsp
            response.sendRedirect("UserDashboard.jsp");

        } else {
%>
<script>
    alert("Invalid email/password");
    window.location = "UserLogin.jsp";
</script>
<%
        }

        resultSet.close();
        pst.close();
        conn.close();

    } catch (SQLException e) {
        e.printStackTrace();
        out.println("<p style='color:red;'>SQL Error: " + e.getMessage() + "</p>");
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
    }
} else {
%>
<script>
    alert("Email and password must be provided.");
    window.location = "UserLogin.jsp";
</script>
<%
}
%>