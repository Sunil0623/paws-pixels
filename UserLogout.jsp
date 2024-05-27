<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Get the session if it exists
    session = request.getSession(false);
    
    if (session != null) {
        String email = (String) session.getAttribute("email");
        
        // Print the email for debugging purposes
        System.out.print("Email is: " + email);
        
        // Invalidate the session if the email attribute is found
        if (email != null) {
            session.invalidate();
        }

        // Set cache control headers to prevent caching
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
    }

    // Redirect to the login page or home page after logout
    response.sendRedirect("index.jsp");  // Change this to your desired page
%>
