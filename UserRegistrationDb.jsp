<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String phonenumber = request.getParameter("phonenumber");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String cpassword = request.getParameter("cpassword");

    Connection conn = null;
    PreparedStatement pst = null;

    try {
        Class.forName("org.postgresql.Driver");
        conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/Pets", "postgres", "root");

        // Check if the email already exists in the database
        String checkQuery = "SELECT COUNT(*) FROM user_details WHERE email = ?";
        PreparedStatement checkPst = conn.prepareStatement(checkQuery);
        checkPst.setString(1, email);
        ResultSet rs = checkPst.executeQuery();
        rs.next();
        int count = rs.getInt(1);

        if (count > 0) {
            // Email already exists, show alert and redirect
%>
            <script>
                alert("An account with this email already exists. Please login.");
                window.location = "UserLogin.jsp";
            </script>
<%
        } else {
            // Email does not exist, proceed with registration
            String insertQuery = "INSERT INTO user_details (fname, lname, phonenumber, email, password, cpassword) VALUES (?, ?, ?, ?, ?, ?)";
            pst = conn.prepareStatement(insertQuery);
            pst.setString(1, fname);
            pst.setString(2, lname);
            pst.setLong(3, Long.parseLong(phonenumber));
            pst.setString(4, email);
            pst.setString(5, password);
            pst.setString(6, cpassword);

            int rowsAffected = pst.executeUpdate();

            if (rowsAffected > 0) {
                session = request.getSession();
                session.setAttribute("email", email);
                session.setAttribute("fname", fname);

                out.println("<script>");
                out.println("alert('Registration successful. Please login.');");
                out.println("window.location = 'UserLogin.jsp';");
                out.println("</script>");
            } else {
%>
                <script>
                    alert("Registration failed. Please try again.");
                    window.location = "UserRegistration.jsp";
                </script>
<%
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
        // Handle the SQL exception
    } catch (Exception e) {
        e.printStackTrace();
        // Handle other exceptions
    } finally {
        try {
            if (pst != null) {
                pst.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
%>