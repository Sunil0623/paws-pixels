<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add Pet's Detail</title>
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
            input[type="text"], input[type="email"], input[type="file"], select, textarea {
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
            <h1>ADD PET'S DETAIL</h1>
            <form action="SavePetsDetailsDB" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
                <label for="image">Select Image:</label>
                <input type="file" name="image" id="image" required>

                <label for="description">Describe your pet:</label>
                <textarea name="description" id="description" placeholder="Describe your pet" required></textarea>

                <label for="email">Owner's Email:</label>
                <input type="email" name="email" id="email" placeholder="Enter owner's email" required>

                <label for="phonenumber">Owner's Phone Number:</label>
                <input type="text" name="phonenumber" id="phonenumber" placeholder="Enter owner's number" required>

                <label for="petname">Pet's Name:</label>
                <input type="text" name="petname" id="petname" placeholder="Enter pet's name" required>

                <label for="petage">Pet's Age (in months):</label>
                <input type="text" name="petage" id="petage" placeholder="Enter pet's age in months" required>

                <label for="petgender">Pet's Gender:</label>
                <select name="petgender" id="petgender" required>
                    <option value="">Select Gender</option>
                    <option value="male">Male</option>
                    <option value="female">Female</option>
                </select>

                <label for="pettype">Pet's Type:</label>
                <select name="pettype" id="pettype" required>
                    <option value="">Select Pet Type</option>
                    <option value="dog">Dog</option>
                    <option value="cat">Cat</option>
                    <option value="cow">Cow</option>
                    <option value="other">Others</option>
                </select>

                <input type="submit" value="Save Details">
            </form>
        </div>

        <!-- Back Button -->
        <a href="UserDashboard.jsp" class="back-btn"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>

        <script>
            function validateForm() {
                let phoneNumber = document.getElementById("phonenumber").value;
                let petAge = document.getElementById("petage").value;
                let petName = document.getElementById("petname").value;

                // Phone number validation
                if (phoneNumber.length !== 10) {
                    alert("Phone number must be 10 digits");
                    return false;
                }

                // Age validation
                if (isNaN(petAge) || petAge <= 0) {
                    alert("Pet age must be a positive number");
                    return false;
                }

                // Name validation
                if (!/^[a-zA-Z]/.test(petName)) {
                    alert("Pet name must start with a letter");
                    return false;
                }

                return true;
            }
        </script>
    </body>
</html>