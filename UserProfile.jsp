<%@ page import="java.sql.*" %>
<%
    // Check if the user is logged in

    String userId = (String) session.getAttribute("email");
    session = request.getSession();
    session.getAttribute("email");
    System.out.print("Email is:" + userId);

    // Database connection details
    String url = "jdbc:postgresql://localhost:5432/Pets";
    String username = "postgres";
    String password = "root";

    // Retrieve user profile from the database
    try {
        Class.forName("org.postgresql.Driver");
        Connection conn = DriverManager.getConnection(url, username, password);
        PreparedStatement stmt = conn.prepareStatement("SELECT * FROM user_details WHERE email = ?");
        stmt.setString(1, userId);
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            // Retrieve user profile data from the ResultSet
            String fname = rs.getString("fname");
            String lname = rs.getString("lname");
            String phonenumber = rs.getString("phonenumber");
            String email = rs.getString("email");
            String address = rs.getString("address");
            String profilePicture = rs.getString("profile_image");
            // ... retrieve other profile fields as needed
%>
<!DOCTYPE html>
<html>
    <head>
        <title>User Profile</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">

        <style>
            /* Reset some default styles */
            body, h1, p {
                margin: 0;
                padding: 0;
            }

            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
            }

            .container {
                max-width: 800px;
                background-color: #fff;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                border-radius: 10px;
                padding: 30px;
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            h1 {
                color: #5469d4;
                margin-bottom: 20px;
                text-align: center;
            }

            .profile-picture-container {
                width: 200px;
                height: 200px;
                border-radius: 50%;
                overflow: hidden;
                margin-bottom: 20px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            }
         
            .profile-picture {
                width: 100%;
                height: 100%;
                object-fit: cover;
            }

            .profile-info {
                margin-bottom: 20px;
                text-align: center;
            }

            .profile-info p {
                margin-bottom: 10px;
            }

            .btn-primary-800 {
                display: inline-block;
                padding: 10px 20px;
                background-color: #5469d4;
                color: #fff;
                text-decoration: none;
                border-radius: 5px;
                transition: background-color 0.3s ease;
            }

            .btn-primary-800:hover {
                background-color: #3b4ab8;
            }

            /* Modal styles */
            .modal {
                display: none;
                position: fixed;
                z-index: 1;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                overflow: auto;
                background-color: rgba(0, 0, 0, 0.4);
            }

            .modal-content {
                background-color: #fff;
                margin: 10% auto;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
                width: 35%;
                max-width: 500px;
                position: relative;
            }

            .close {
                position: absolute;
                top: 10px;
                right: 15px;
                font-size: 24px;
                font-weight: bold;
                color: #aaa;
                cursor: pointer;
            }

            .close:hover,
            .close:focus {
                color: #5469d4;
                text-decoration: none;
            }

            .modal-content h2 {
                color: #5469d4;
                margin-top: 0;
                margin-bottom: 20px;
                text-align: center;
            }

            .modal-content form {
                display: flex;
                flex-direction: column;
            }

            .modal-content label {
                font-weight: bold;
                margin-bottom: 5px;
                color: #333;
            }

            .modal-content input[type="text"],
            .modal-content input[type="file"] {
                padding: 10px;
                border-radius: 5px;
                border: 1px solid #ccc;
                margin-bottom: 15px;
            }

            .modal-content input[type="submit"] {
                background-color: #5469d4;
                color: #fff;
                padding: 12px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-weight: bold;
                transition: background-color 0.3s ease;
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
                background-color: #5469d4;
                color: #ffffff;
                text-decoration: none;
                transition: background-color 0.3s ease;
            }
            .back-btn:hover {
                background-color: #3e4c9c;
            }
            .back-btn i {
                margin-right: 8px;
            }

            .modal-content input[type="submit"]:hover {
                background-color: #3b4ab8;
            }

            /* Responsive styles */
            @media (max-width: 768px) {
                .container {
                    padding: 20px;
                }

                .profile-picture-container {
                    width: 150px;
                    height: 150px;
                }

                .modal-content {
                    width: 80%;
                }
            }

            @media (max-width: 480px) {
                .profile-picture-container {
                    width: 120px;
                    height: 120px;
                }

                .modal-content {
                    margin: 25% auto;
                    padding: 20px;
                }
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>User Profile</h1>
            <div class="profile-picture-container">
                <img src="<%= request.getContextPath() + "/userimages/" + profilePicture%>" alt="Profile Picture" class="profile-picture">
            </div>
            <div class="profile-info">
                <p>Name: <%= fname%> <%= lname%></p>
                <p>Phone Number: <%= phonenumber%></p>
                <p>Email: <%= email%></p>
                <p>Address: <%= address%></p>
            </div>
            <a href="#" class="btn-primary-800" id="updateBtn">Update</a>
        </div>

        <!-- Modal -->
        <div id="updateModal" class="modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                <h2>Update Profile</h2>
                <form action="updateProfile.jsp" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="userId" value="<%= userId%>">
                    <label for="profilePicture">Profile Picture:</label>
                    <input type="file" id="profilePicture" name="profilePicture"><br>

                    <label for="username">Username:</label>
                    <input type="text" id="username" name="username" value="<%= fname%> <%= lname%>"><br>

                    <label for="address">Address:</label>
                    <input type="text" id="address" name="address" value="<%= address%>"><br>

                    <label for="phonenumber">Phone Number:</label>
                    <input type="text" id="phonenumber" name="phonenumber" value="<%= phonenumber%>"><br>

                    <input type="submit" value="Update">
                </form>
            </div>
        </div>
        <a href="UserDashboard.jsp" class="back-btn"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>


        <script>
            // Get the modal
            var modal = document.getElementById("updateModal");

            // Get the button that opens the modal
            var btn = document.getElementById("updateBtn");

            // Get the <span> element that closes the modal
            var span = document.getElementsByClassName("close")[0];

            // When the user clicks the button, open the modal
            btn.onclick = function () {
                modal.style.display = "block";
            }

            // When the user clicks on <span> (x), close the modal
            span.onclick = function () {
                modal.style.display = "none";
            }

            // When the user clicks anywhere outside of the modal, close it
            window.onclick = function (event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            }
        </script>
    </body>
</html>
<%
        } else {
            out.println("User profile not found.");
        }

        rs.close();
        stmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>