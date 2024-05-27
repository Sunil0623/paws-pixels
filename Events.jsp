<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add Event</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <style>
            body {
                background-color: #f2f2f2;
                font-family: 'Poppins', sans-serif;
                margin: 0;
                padding: 0;
            }
            .container {
                max-width: 600px;
                margin: 50px auto;
                padding: 40px;
                background-color: #ffffff;
                border-radius: 20px;
                box-shadow: 0 0 30px rgba(0, 0, 0, 0.1);
            }
            h1 {
                color: #5469d4;
                text-align: center;
                margin-bottom: 40px;
                text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
                font-weight: 700;
            }
            form {
                width: 100%;
            }
            label {
                display: block;
                margin-bottom: 10px;
                color: #5469d4;
                font-weight: 600;
            }
            input[type="text"], input[type="date"], input[type="file"],input[type="time"], select, textarea {
                width: 100%;
                padding: 15px;
                margin-bottom: 20px;
                border: none;
                border-radius: 10px;
                box-sizing: border-box;
                background-color: #f5f5f5;
                color: #333;
                font-family: 'Poppins', sans-serif;
                font-size: 16px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            textarea {
                resize: vertical;
            }
            input[type="submit"] {
                background-color: #5469d4;
                color: #ffffff;
                padding: 15px 30px;
                border: none;
                border-radius: 10px;
                cursor: pointer;
                width: 100%;
                transition: background-color 0.3s ease;
                font-family: 'Poppins', sans-serif;
                font-size: 18px;
                font-weight: 600;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            input[type="submit"]:hover {
                background-color: #3e4c9c;
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
        </style>
    </head>
    <body>
       
        <div class="container">
            <h1>ADD EVENT</h1>
            <form action="AddEventServlet" method="post" enctype="multipart/form-data">
                <label for="eventName">Event Name:</label>
                <input type="text" name="eventName" id="eventName" placeholder="Enter event name" required>

                <label for="eventDate">Event Date:</label>
                <input type="date" name="eventDate" id="eventDate" required>

                <label for="eventTime">Event Time:</label>
                <input type="time" name="eventTime" id="eventTime" required>

                <label for="eventLocation">Event Location:</label>
                <input type="text" name="eventLocation" id="eventLocation" placeholder="Enter event location" required>

                <label for="petType">Pet Type Allowed:</label>
                <select name="petType" id="petType" required>
                    <option value="">Select Pet Type</option>
                    <option value="Dog">Dog</option>
                    <option value="Cat">Cat</option>
                    <option value="Bird">Bird</option>
                    <option value="Fish">Fish</option>
                    <option value="Reptile">Reptile</option>
                    <option value="Rodent">Rodent</option>
                    <option value="Other">Other</option>
                </select>

                <label for="eventDescription">Event Description:</label>
                <textarea name="eventDescription" id="eventDescription" placeholder="Describe the event" required></textarea>

                <label for="eventImage">Event Image:</label>
                <input type="file" name="eventImage" id="eventImage" required>

                <label for="ticket_info">Ticket-info:</label>
                <input type="text" name="ticket_info" id="ticket_info" required>

                <input type="submit" value="Add Event">
            </form>
        </div>

        <!-- Back Button -->
        <a href="AdminDashboard.jsp" class="back-btn"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>
    </body>
</html>