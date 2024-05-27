<%@ page import="java.sql.*" %>
<%
// Database connection details
    String dbUrl = "jdbc:postgresql://localhost:5432/Pets";
    String dbUser = "postgres";
    String dbPassword = "root";

// Establish database connection
    try {
        Class.forName("org.postgresql.Driver");
        Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

        // SQL query to fetch all pet details
        String sql = "SELECT * FROM pets_details";
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(sql);

        // Handle delete request
        String deletePetId = request.getParameter("deletePetId");
        if (deletePetId != null) {
            int petId = Integer.parseInt(deletePetId);
            String deleteSql = "DELETE FROM pets_details WHERE id = ?";
            PreparedStatement deleteStmt = conn.prepareStatement(deleteSql);
            deleteStmt.setInt(1, petId);
            int rowsDeleted = deleteStmt.executeUpdate();
            if (rowsDeleted > 0) {
                // Pet deleted successfully
                response.sendRedirect("ManagePetsLink.jsp");
            } else {
                // Pet not found or deletion failed
                response.sendRedirect("Error.jsp");
            }
            deleteStmt.close();
        }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Pet Details</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <!-- Google Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <style>
            body {
                font-family: 'Poppins', sans-serif;
                background-color: #f8f9fa;
            }

            .card {
                border: none;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
                transition: transform 0.3s ease, box-shadow 0.3s ease;
            }

            .card:hover {
                transform: translateY(-10px);
                box-shadow: 0 0 30px rgba(0, 0, 0, 0.3);
            }

            .card-img-top {
                height: 300px;
                object-fit: cover;
            }

            .card-title {
                color: #5469d4;
                font-weight: 700;
            }

            .card-text {
                color: #555;
            }

            .btn-primary {
                background-color: #5469d4;
                border-color: #5469d4;
                transition: background-color 0.3s ease, border-color 0.3s ease;
            }

            .btn-primary:hover {
                background-color: #3e4c9c;
                border-color: #3e4c9c;
            }

            .back-btn {
                position: fixed;
                bottom: 20px;
                right: 20px;
                z-index: 1;
                font-size: 18px;
                padding: 12px 20px;
                border-radius: 30px;
                box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
            }

            .back-btn i {
                margin-right: 8px;
            }
        </style>
    </head>
    <body>
       
        <div class="container mx-auto mt-4">
            <h1 class="text-center mb-4" style="color: #5469d4;">Pet Details</h1>
            <div class="row">
                <%
                    while (rs.next()) {
                        String imageFileName = rs.getString("imageFileName");
                        String description = rs.getString("description");
                        String email = rs.getString("email");
                        String phoneNumber = rs.getString("phoneNumber");
                        String petName = rs.getString("petName");
                        String petAge = rs.getString("petAge");
                        String petGender = rs.getString("petGender");
                        String petType = rs.getString("petType");
                        String imageUrl = "pets-images/" + imageFileName;
                        int petId = rs.getInt("id");
                %>
                <div class="col-md-4 mb-4">
                    <div class="card">
                        <img src="<%= imageUrl%>" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title"><%= petName%></h5>
                            <p class="card-text">Description: <%= description%></p>
                            <p class="card-text">Age: <%= petAge%> | Gender: <%= petGender%> | Type: <%= petType%></p>
                            <button class="btn btn-primary" data-toggle="modal" data-target="#contactModal<%= rs.getRow()%>">Contact Owner</button>
                            <a href="ManagePetsLink.jsp?deletePetId=<%= petId%>" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this pet?')"><i class="fas fa-trash"></i></a>
                        </div>
                    </div>
                </div>

                <!-- Contact Modal -->
                <div class="modal fade" id="contactModal<%= rs.getRow()%>" tabindex="-1" role="dialog" aria-labelledby="contactModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="contactModalLabel">Contact Owner</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <p><i class="fas fa-envelope"></i> <%= email%></p>
                                <p><i class="fas fa-phone"></i> <%= phoneNumber%></p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                    }
                %>
            </div>
        </div>

        <a href="AdminDashboard.jsp" class="btn btn-primary back-btn"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
<%
        // Close database connection
        rs.close();
        stmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>