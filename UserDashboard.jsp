
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <link rel="stylesheet" href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css">
        <link rel="stylesheet" href="css/UserDashboard.css">
        <style>
            .pet-world {
                width: 125px;
                height: 125px;
                border-radius: 50%;
                overflow: hidden;
                margin-left: 25px;
                position: relative;
                transition: transform 0.3s ease-in-out;
            }

            .pet-world img {
                width: 100%;
                height: auto;
                display: block;
            }

            .pet-world:hover {
                transform: scale(1.1);
            }
            .pet-locations {
                max-width: 1200px;
                margin: 0 auto;
                padding: 20px;
            }

            .locations-container {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
                grid-gap: 20px;
            }

            .location-card {
                background-color: #fff;
                box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
                overflow: hidden;
                transition: transform 0.3s ease-in-out;
            }

            .location-card:hover {
                transform: translateY(-5px);
            }

            .location-card img {
                width: 100%;
                height: 200px;
                object-fit: cover;
            }

            .card-content {
                padding: 10px;
            }

            .location-card h3 {
                margin: 5px 0;
                font-size: 20px;
                color: #333;
            }

            .location-card p {
                margin: 5px 0;
                color: #666;
            }

            .visit-btn {
                display: inline-block;
                margin-top: 10px;
                padding: 8px 16px;
                background-color: #4CAF50;
                color: #fff;
                text-decoration: none;
                border-radius: 4px;
                transition: background-color 0.3s ease-in-out;
            }

            .visit-btn:hover {
                background-color: #3e8e41;
            }
            .admin-contact {
                background-color: #ffffff;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            }

            .admin-contact h1 {
                text-align: center;
            }

            .input-field {
                margin-bottom: 20px;
            }

            .input-field input,
            .textarea-field textarea {
                width: 100%;
                padding: 10px;
                border-radius: 5px;
                outline: none;
            }

            .error-txt {
                color: red;
                display: none;
                font-size: 14.5px;
                text-align: left;
                margin: -5px 0 10px;
            }

            .field .error-txt {
                display: none;
            }

            form .textarea-field .error-txt {
                margin-top: -10px;
            }

            .field.error .item {
                border-color: red;
            }

            .field .item {
                width: 100%;
                padding: 18px;
                background: transparent;
                border: 2px solid #ccc;
                outline: invert;
                border-radius: 6px;
                font-size: 16px;
                margin: 12px 0;
            }

            .field .item::placeholder {
                color: rgba(20, 3, 3, 0.3);
            }
            .btn {
                background-color: #5469d4;
                color: #fff;
                border: none;
                border-radius: 5px;
                padding: 10px 20px;
                cursor: pointer;
                text-align: center;
                transition: background-color 0.3s ease;
                display: block;
                margin: 0 auto;
            }


            .btn:hover {
                background-color: #3e4c9c;
            }

            .textarea-field textarea {
                resize: vertical;
                min-height: 100px;
                max-height: 300px;
            }
            /* Modal Styles */
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
                backdrop-filter: blur(5px);
            }

            /* Modal Content */
            .modal-content {
                background-color: #fefefe;
                margin: 10% auto;
                padding: 20px;
                border: 1px solid #888;
                width: 30%;
                border-radius: 10px;
                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
                position: relative;
                animation-name: animatetop;
                animation-duration: 0.4s;
            }

            /* The Close Button */
            .close {
                color: #aaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }

            .close:hover,
            .close:focus {
                color: black;
                text-decoration: none;
                cursor: pointer;
            }

            /* Okay Button */
            .okay-btn {
                background-color: #4CAF50;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                margin-top: 20px;
                transition: background-color 0.3s ease;
            }

            .okay-btn:hover {
                background-color: #45a049;
            }
      
            /* Animation */
            @keyframes animatetop {
                from {
                    top: -300px;
                    opacity: 0;
                }
                to {
                    top: 0;
                    opacity: 1;
                }
            }

            @media screen and (max-width: 600px) {
                .input-field input, .textarea-field textarea {
                    width: calc(100% - 20px);
                }
            }

        </style>
        <script defer src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
        <script defer src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
        <script defer src="https://cdn.jsdelivr.net/npm/chart.js@4.4.2/dist/chart.umd.min.js"></script>
        <script defer src="javascript/UserDashboard.js"></script>
        <title>USER DASHBOARD</title>
    </head>

    <body>

        <nav class="main-menu">
            <div>
                <div class="user-info">
                    <img src="image/PetsWorldLogo.jpeg" alt="Logo" />
                    <%
                        String Email = (String) session.getAttribute("email");
                        session = request.getSession();
                        session.getAttribute("email");
                        System.out.print("Email is:" + Email);


                    %>


                </div>

                <ul>

                    <li class="nav-item active">
                        <a href="#">
                            <i class="fa fa-home nav-icon"></i>
                            <span class="nav-text">Home</span>
                        </a>
                    </li>
                    <li class="nav-item ">
                        <a href="UserProfile.jsp">
                            <i class="fa fa-user nav-icon"></i>
                            <span class="nav-text">Profile</span>
                        </a>
                    </li>

                    <li class="nav-item">
                        <a href="BuyCompanion.jsp">
                            <i class="fas fa-paw nav-icon"></i>
                            <span class="nav-text">Buy</span>
                        </a>
                    </li>

                    <li class="nav-item">
                        <a href="SellCompanion.jsp">
                            <i class="fas fa-hand-holding-usd nav-icon"></i>
                            <span class="nav-text">Sell</span>
                        </a>
                    </li>
                </ul>
            </div>

            <ul>
                <li class="nav-item">
                    <a href="UserLogout.jsp"  ><i class="fa fa-right-from-bracket nav-icon">
                        </i><span class="nav-text">Logout</span></a>
                </li>
            </ul>
        </nav>

        <section class="content">
            <div class="left-content">


                <div class="search-and-check">

                    <div class="search-box">
                        <input type="text" id="searchBar" list="searchOptions" placeholder="Search..." onkeyup="handleSearch(event)">
                        <datalist id="searchOptions">
                            <option value="events">
                            <option value="clinics">
                            <option value="admin">
                            <option value="reviews">
                        </datalist>
                        <i class="bx bx-search" onclick="search()"></i>
                    </div>

                    <div class="interaction-control-mobile interactions">  
                        <div class="toggle" onclick="switchTheme()">
                            <div class="mode-icon moon">
                                <i class="bx bxs-moon "></i>
                            </div>
                            <div class="mode-icon sun hidden">
                                <i class="bx bxs-sun"></i>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="header">
                    <picture class="morning-img">
                        <img class="header-mobile"
                             src="image/PetsWorldWelcome.jpeg"alt="" />
                        <img class="header-tablet"
                             src="image/PetsWorldWelcome.jpeg"alt="" />
                        <img class="header-desktop"
                             src="image/PetsWorldWelcome.jpeg"alt="" />
                    </picture>

                    <picture class="night-img hidden">
                        <img class="header-mobile"
                             src="image/PetsWorldWelcome.jpeg" alt="" />
                        <img class="header-tablet"
                             src="image/PetsWorldWelcome.jpeg"  alt="" />
                        <img class="header-desktop"
                             src="image/PetsWorldWelcome.jpeg"   alt="" />
                    </picture>
                </div>


                <h1 style="color:#5469d4; text-align: center" id="events">UPCOMING EVENTS!!</h1>
                <%                    try {
                        // Establish database connection
                        Class.forName("org.postgresql.Driver");
                        String dbUrl = "jdbc:postgresql://localhost:5432/Pets";
                        String dbUser = "postgres";
                        String dbPassword = "root";
                        Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

                        // SQL query to fetch all event details
                        String sql = "SELECT * FROM events";
                        Statement stmt = conn.createStatement();
                        ResultSet rs = stmt.executeQuery(sql);
                %>

                <!-- Modal -->
                <div id="ticketModal" class="modal">
                    <div class="modal-content">
                        <h1 style="color:#5469d4">Tickets Information</h1><span class="close">&times;</span> 

                        <p id="ticketInfoContent"></p>
                        <p>Sorry for the inconvenience. Tickets are only available offline. Please get them at the location.</p>
                        <button class="okay-btn">Okay</button>
                    </div>
                </div>

                <%
                    while (rs.next()) {
                        String imageFileName = rs.getString("eventimage");
                        String eventName = rs.getString("eventname");
                        String eventDate = rs.getString("eventdate");
                        String eventTime = rs.getString("eventtime");
                        String eventLocation = rs.getString("eventlocation");
                        String petType = rs.getString("pettype");
                        String eventDescription = rs.getString("eventdescription");
                        String imageUrl = "Events-Images/" + imageFileName;
                        String ticketInfo = rs.getString("ticket_info");
                %>
                <div class="card event-card" style="margin-top:6px" >
                    <div class="event-header">
                        <img src="<%= imageUrl%>" alt="Event Image" />
                        <p><%= eventDate%>, <%= eventTime%></p>
                    </div>
                    <div class="event-content">
                        <h2><%= eventName%></h2>
                        <p><%= eventDescription%></p>
                        <p><%= eventLocation%></p>
                    </div>
                    <div class="event-footer">
                        <p style="background-color: #582bac"><%= petType%> Event</p>
                        <div class="btn-group">
                            <button class="buy-ticket-btn" data-ticket-info="<%= ticketInfo%>">Buy Ticket</button>
                            <div class="share">
                                <button class="share-btn">
                                    <i class="fa-solid fa-share"></i>
                                </button>
                                <ul class="popup">
                                    <li>
                                        <a href="#" style="color: rgb(34, 173, 34)"><i class="bx bxl-whatsapp"></i></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <br>
                <%
                        }

                        // Close database connections
                        rs.close();
                        stmt.close();
                        conn.close();
                    } catch (Exception e) {
                        out.println("Error: " + e.getMessage());
                    }
                %>









                <div class="reviews" >
                    <h1 style="color:#5469d4; text-align: center" id="reviews">Past Pet Event Reviews</h1>
                    <div class="review-container">
                        <div class="card review-card">
                            <h2>Westminster Kennel Club Dog Show</h2>
                            <div class="ratings">
                                <i class="bx bxs-star"></i>
                                <i class="bx bxs-star"></i>
                                <i class="bx bxs-star"></i>
                                <i class="bx bxs-star"></i>
                                <i class="bx bx-star"></i>
                            </div>
                            <p>
                                The Westminster Kennel Club Dog Show was a prestigious event showcasing top breeds and incredible talents. It was a delight to witness such well-trained and beautiful dogs in action.
                            </p>
                        </div>

                        <div class="card review-card">
                            <h2>Crufts Dog Show</h2>
                            <div class="ratings">
                                <i class="bx bxs-star"></i>
                                <i class="bx bxs-star"></i>
                                <i class="bx bxs-star"></i>
                                <i class="bx bxs-star"></i>
                                <i class="bx bxs-star-half"></i>
                            </div>
                            <p>
                                The Crufts Dog Show is a must-attend event for all dog lovers. The variety of breeds, agility competitions, and obedience trials make it a truly memorable experience for both participants and spectators.
                            </p>
                        </div>

                        <div class="card review-card">
                            <h2>Kitten Bowl</h2>
                            <div class="ratings">
                                <i class="bx bxs-star"></i>
                                <i class="bx bxs-star"></i>
                                <i class="bx bxs-star"></i>
                                <i class="bx bxs-star"></i>
                                <i class="bx bxs-star"></i>
                            </div>
                            <p>
                                The Kitten Bowl is a heartwarming event that combines cuteness and athleticism. Watching adorable kittens play and compete in mini-games is a joy for all animal lovers.
                            </p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="right-content">
                <div class="interaction-control interactions">

                    <div class="toggle" onclick="switchTheme()">
                        <div class="mode-icon moon">
                            <i class="bx bxs-moon"></i>
                        </div>
                        <div class="mode-icon sun hidden">
                            <i class="bx bxs-sun"></i>
                        </div>
                    </div>
                </div>


                <div class="pet-locations">
                    <h1 style="color:#5469d4;text-align:center" id='clinics'>Pet Clinics and Stores</h1>
                    <div class="locations-container" style="margin-top:4px;">
                        <div class="location-card">
                            <div class="card-content">
                                <h3>Vetic Pet Clinic</h3>
                                <p>1070, Ground Floor, MM Heights, 24th Main Rd, opp. Karnataka Bank, 1st Sector, HSR Layout, Bengaluru, Karnataka 560102</p>
                                <p>Phone: 9205140300</p>
                                <a href="https://www.google.com/maps/place/Vetic+Pet+Clinic/@12.9178092,77.6469518,17z/data=!3m1!4b1!4m6!3m5!1s0x3bae15eb7173a555:0xfa7f0bdd643d55a9!8m2!3d12.9178092!4d77.6491231!16s%2Fg%2F11l36g56wm" target="_blank" class="visit-btn">Visit Location</a>
                            </div>
                        </div>

                        <div class="location-card">
                            <div class="card-content">
                                <h3>Leela Pet Clinic</h3>
                                <p>111, 27th Main Rd, Sector 2, HSR Layout, Bengaluru, Karnataka 560102</p>
                                <p>Phone: 9731899239</p>
                                <a href="https://www.google.com/maps/place/Leela+pet+clinic/@12.910282,77.652002,12z/data=!4m6!3m5!1s0x3bae1509207acb55:0x6b761a7cf682e38a!8m2!3d12.9102823!4d77.6520018!16s%2Fg%2F11nxy1fh9z?hl=en&entry=ttu" target="_blank" class="visit-btn">Visit Location</a>
                            </div>
                        </div>
                        <div class="location-card">
                            <div class="card-content">
                                <h3>Furrever Pet Spa & Store</h3>
                                <p>355/3, first floor, 5th main, 14th B Cross Rd, HSR Layout, Bengaluru, Karnataka 560102, India</p>
                                <p>Phone: 08904078989</p>
                                <a href="https://www.google.com/maps/dir//Furrever+Happy+Pet+Spa+%26+Store,+355%2F3,+first+floor,+5th+main,+14th+B+Cross+Rd,+HSR+Layout,+Bengaluru,+Karnataka+560102,+India/@12.9144991,77.5627363,12z/data=!4m8!4m7!1m0!1m5!1m1!1s0x3bae15232c07fa15:0x908c8aa1dcd75fd1!2m2!1d77.6327741!2d12.9144991?hl=en&entry=ttu" target="_blank" class="visit-btn">Visit Location</a>
                            </div>
                        </div>

                        <div class="location-card">
                            <div class="card-content">
                                <h3>V-Care Pet PolyClinic</h3>
                                <p>1st Main Cross, Jakkasandra, 1st Block Koramangala, Bengaluru, Karnataka 560034, India</p>
                                <p>Phone: 08025525834 </p>
                                <a href="https://www.google.com/maps/dir//V-Care+Pet+PolyClinic,+1st+Main+Cross,+Jakkasandra,+1st+Block+Koramangala,+Bengaluru,+Karnataka+560034,+India/@12.9265379,77.5674604,12z/data=!4m8!4m7!1m0!1m5!1m1!1s0x3bae144e17ea8d7d:0x76711542424b7f09!2m2!1d77.6375072!2d12.9265366?hl=en&entry=ttu" target="_blank" class="visit-btn">Visit Location</a>
                            </div>
                        </div>
                        <div class="location-card">
                            <div class="card-content">
                                <h3>My Pet's Choice Clinic </h3>
                                <p>195/A, 22nd Cross Rd, 3rd Sector, Sector 3, HSR Layout, Bengaluru, Karnataka 560102, India</p>
                                <p>Phone: 08123733554</p>
                                <a href="https://www.google.com/maps/dir//My+Pet's+Choice+Clinic,+195%2FA,+22nd+Cross+Rd,+3rd+Sector,+Sector+3,+HSR+Layout,+Bengaluru,+Karnataka+560102,+India/@12.909126,77.6241921,14z/data=!4m17!1m8!3m7!1s0x1105739038cb9ff5:0x326fa83ca4c37b31!2sMy+Pet's+Choice+Clinic!8m2!3d12.909126!4d77.6417016!15sChVwZXQgY2xpbmljcyBiYW5nYWxvcmVaFyIVcGV0IGNsaW5pY3MgYmFuZ2Fsb3JlkgEPYW5pbWFsX2hvc3BpdGFsmgEjQ2haRFNVaE5NRzluUzBWSlEwRm5TVVF4YWs4dE5WcEJFQUXgAQA!16s%2Fg%2F11b77dgzp1!4m7!1m0!1m5!1m1!1s0x1105739038cb9ff5:0x326fa83ca4c37b31!2m2!1d77.6417016!2d12.909126?hl=en&entry=ttu" target="_blank" class="visit-btn">Visit Location</a>
                            </div>
                        </div>
                        <div class="location-card">
                            <div class="card-content">
                                <h3>i-V Pet Clinic & Pet Store</h3>
                                <p>No:1533/33/2 , ground floor, Devarachikkanahalli Main Rd, opp. to Dmart, Bommanahalli, Bengaluru, Karnataka 560076, India</p>
                                <p>Phone: 07676815571</p>
                                <a href="https://www.google.com/maps/dir//i-Vet+Pet+Clinic+%26+Pet+Store,+No:1533%2F33%2F2+,+ground+floor,+Devarachikkanahalli+Main+Rd,+opp.+to+Dmart,+Bommanahalli,+Bengaluru,+Karnataka+560076,+India/@12.8959415,77.6030735,14z/data=!4m8!4m7!1m0!1m5!1m1!1s0x3bae154e549f863f:0x9e6b247fd3e10ab9!2m2!1d77.620583!2d12.8959415?hl=en&entry=ttu" target="_blank" class="visit-btn">Visit Location</a>
                            </div>
                        </div>

                        <%--contact admin part--%>


                        <div class="admin-contact" id="admin">
                            <h1 style="color:#5469d4">Contact Admin !!</h1>
                            <form action="#">
                                <img src="/icons/Raghav.jpeg" alt="" style="padding: 2rem;" width="200px" />
                                <div class="input-box">
                                    <div class="input-field field">
                                        <input type="text" placeholder="Full Name" id="name-smtp" class="item" autocomplete="off">
                                        <div class="error-txt">Full Name can't be blank</div>
                                    </div>
                                    <div class="input-field field">
                                        <input type="text" placeholder="Email Address" id="email-smtp" class="item" autocomplete="off">
                                        <div class="error-txt email">Email address can't be blank</div>
                                    </div>
                                </div>
                                <div class="input-box">
                                    <div class="input-field field">
                                        <input type="text" placeholder="Phone Number" id="phonenumber" class="item" autocomplete="off">
                                        <div class="error-txt">Phone Number Can't be blank</div>
                                    </div>
                                    <div class="input-field field">
                                        <input type="text" placeholder="Subject" id="subject-smtp" class="item" autocomplete="off">
                                        <div class="error-txt">Subject can't be blank</div>
                                    </div>
                                </div>
                                <div class="textarea-field field">
                                    <textarea name="" id="message-smtp" cols="30" rows="10" placeholder="Your Message" class="item"
                                              autocomplete="off"></textarea>
                                    <div class="error-txt">Message can't be blank</div>
                                </div>
                                <button class="btn" type="submit">Send Message</button>
                            </form>
                        </div>




                    </div>
                </div>

            </div>
        </section>




        <script>
            window.onload = function () {
                var modal = document.getElementById("ticketModal");
                var btns = document.getElementsByClassName("buy-ticket-btn");
                var span = document.getElementsByClassName("close")[0];
                var ticketInfoContent = document.getElementById("ticketInfoContent");
                var okayBtn = document.querySelector(".okay-btn");
                for (var i = 0; i < btns.length; i++) {
                    btns[i].onclick = function () {
                        modal.style.display = "block";
                        var ticketInfo = this.getAttribute("data-ticket-info");
                        ticketInfoContent.innerHTML = ticketInfo;
                    };
                }

                span.onclick = function () {
                    modal.style.display = "none";
                };
                window.onclick = function (event) {
                    if (event.target === modal) {
                        modal.style.display = "none";
                    }
                };
                okayBtn.onclick = function () {
                    modal.style.display = "none";
                };
            };
//search functionality
            function handleSearch(event) {
                if (event.key === 'Enter') {
                    filterContent();
                }
            }

            function search() {
                filterContent();
            }

            function filterContent() {
                // Get the search term
                const searchTerm = document.getElementById('searchBar').value.toLowerCase();
                // Get the selected search option
                const selectedOption = document.getElementById('searchBar').value.toLowerCase();
                // Reference to sections
                const eventsSection = document.getElementById('events');
                const reviewsSection = document.getElementById('reviews');
                const admincontactSection = document.getElementById('admin');
                const petsclinicSection = document.getElementById('clinics');
                // Reference to section texts
                const eventsText = eventsSection.innerText.toLowerCase();
                const reviewsText = reviewsSection.innerText.toLowerCase();
                const admincontactText = admincontactSection.innerText.toLowerCase();
                const petsclinicText = petsclinicSection.innerText.toLowerCase();

                // Check the search term and scroll to the relevant section if the term is found in the selected option
                switch (selectedOption) {
                    case 'events':
                        if (eventsText.includes(searchTerm)) {
                            eventsSection.scrollIntoView({behavior: 'smooth'});
                        }
                        break;
                    case 'reviews':
                        if (reviewsText.includes(searchTerm)) {
                            reviewsSection.scrollIntoView({behavior: 'smooth'});
                        }
                        break;
                    case 'admin':
                        if (admincontactText.includes(searchTerm)) {
                            admincontactSection.scrollIntoView({behavior: 'smooth'});
                        }
                        break;
                    case 'clinics':
                        if (petsclinicText.includes(searchTerm)) {
                            petsclinicSection.scrollIntoView({behavior: 'smooth'});
                        }
                        break;
                    default:
                        break;
                }
            }

        </script>


        <script src="https://smtpjs.com/v3/smtp.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="javascript/email.js"></script>
    </body>

</html>