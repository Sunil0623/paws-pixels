<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="preconnect"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;300;400;600;700&display=swap"
	rel="Stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.2.1/css/fontawesome.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500;700&amp;display=swap">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.2.1/css/fontawesome.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.2.1/css/all.min.css">
<link rel="stylesheet" href="css/index.css">
<title>Home</title>
<style>
</style>
</head>
<body>
	<section class="header" id="header">
		<nav>
			<a class="image" href="#"><img src="image/PetsWorldLogo.jpeg" alt="Logo"></a>
			<div class="nav-links" id="navLinks">
				<ul style="display: auto;">
					<li><a class="nav-link scrollto active" href="#header">Home</a></li>
					<li><a class="nav-link scrollto" style="color: white"
						href="UserLogin.jsp">Login / Signup</a></li>
					<li><a class="nav-link scrollto" href="AdminLogin.jsp">Admin</a></li>
					<li><a class="nav-link scrollto" href="#About">About Us</a></li>

				</ul>
			</div>
		</nav>
	</section>


	<div id="app">
		<canvas id="webgl-canvas"></canvas>
		<div id="hero">
			<h1>Find Your Companion</h1>
		</div>
	</div>
	<section class="about" id="About">
		<div class="about-content">
			<h2>About Us</h2>
			<p>We understand the profound bond between humans and animals. At
				Find Your Companion, our mission is to help you find the perfect
				furry (or feathered, or scaled!) friend to bring joy and love into
				your life. We believe that every pet deserves a loving home, and
				every person deserves the companionship of a loyal animal friend.</p>
		</div>
		<img src="image/PetsWorldLogo.jpeg" alt="About Us Image"
			class="about-image">
	</section>

	<section class="testimonials" id="Testimonials">
		<h1>What Our Adopters Say</h1>
		<div class="row">
			<div class="testimonial-col">
				<img src="image/Petwner 2.jpeg" alt="Adopter">
				<div>
					<p>"We adopted our beloved dog, Max, through Find Your
						Companion, and it was the best decision ever! The website was easy
						to navigate, and the adoption process was smooth and stress-free.
						Max has brought so much joy and love into our lives, and we're so
						grateful to Find Your Companion for helping us find our perfect
						furry friend."</p>
					<h3>Sumanth</h3>
					<i style="color: Turquoise" class="fa fa-star"></i> <i
						style="color: Turquoise" class="fa fa-star"></i> <i
						style="color: Turquoise" class="fa fa-star"></i> <i
						style="color: Turquoise" class="fa fa-star"></i> <i
						style="color: White" class="fa fa-star"></i>
				</div>
			</div>
			<div class="testimonial-col">
				<img src="image/Adopter 2.jpeg" alt="Adopter">
				<div>
					<p>"I found the perfect cat companion on Pet-Finder! The
						website has a wide variety of adoptable pets, and the search
						filters made it easy to find a cat that matched my lifestyle and
						needs. The staff at Find Your Companion was also incredibly
						helpful and answered all my questions throughout the adoption
						process. My cat, Luna, is now a happy and healthy part of my
						family, and I couldn't be more thankful to Find Your Companion."</p>
					<h3>Pavan</h3>
					<i style="color: Turquoise" class="fa fa-star"></i> <i
						style="color: Turquoise" class="fa fa-star"></i> <i
						style="color: Turquoise" class="fa fa-star"></i> <i
						style="color: Turquoise" class="fa fa-star"></i> <i
						style="color: White" class="fa fa-star"></i>
				</div>
			</div>
		</div>
	</section>



	<footer>
		<p style="color: white">
			&copy; 2024 || Pet-Finder(Companion For the life). All Rights
			Reserved || <strong> Terms &amp; Conditions apply</strong>
		</p>
	</footer>
	<button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>


	<script type="module" src="javascript/index.js"></script>
	<script>
		let mybutton = document.getElementById("myBtn");

		window.onscroll = function() {
			scrollFunction();
		};

		function scrollFunction() {
			if (document.body.scrollTop > 20
					|| document.documentElement.scrollTop > 20) {
				mybutton.style.display = "block";
			} else {
				mybutton.style.display = "none";
			}
		}

		function topFunction() {
			document.body.scrollTop = 0;
			document.documentElement.scrollTop = 0;
		}
	</script>
</body>
</html>


