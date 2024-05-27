//! Active Navbar Item

const navItems = document.querySelectorAll(".nav-item");

navItems.forEach((navItem, i) => {
  navItem.addEventListener("click", () => {
    navItems.forEach((item, j) => {
      item.className = "nav-item";
    });
    navItem.className = "nav-item active";
  });
});

//! Light/Dark Mode

const moonIcon = document.querySelector(".moon");
const sunIcon = document.querySelector(".sun");
const nightImage = document.querySelector(".night-img");
const morningImage = document.querySelector(".morning-img");
const toggle = document.querySelector(".toggle");

function switchTheme() {
  document.body.classList.toggle("darkmode");
  if (document.body.classList.contains("darkmode")) {
    sunIcon.classList.remove("hidden");
    moonIcon.classList.add("hidden");
    morningImage.classList.add("hidden");
    nightImage.classList.remove("hidden");
    localStorage.setItem("theme", "dark");
  } else {
    sunIcon.classList.add("hidden");
    moonIcon.classList.remove("hidden");
    morningImage.classList.remove("hidden");
    nightImage.classList.add("hidden");
    localStorage.setItem("theme", "light");
  }
}

function updateTheme(themeMode) {
  sunIcon.classList.add("hidden");
  moonIcon.classList.add("hidden");
  morningImage.classList.add("hidden");
  nightImage.classList.add("hidden");

  if (themeMode === "dark") {
    sunIcon.classList.remove("hidden");
    nightImage.classList.remove("hidden");
    return document.body.classList.add("darkmode");
  } else {
    moonIcon.classList.remove("hidden");
    morningImage.classList.remove("hidden");
    document.body.classList.remove("darkmode");
  }
}

function initialTheme() {
  const prefersDarkTheme = window.matchMedia("(prefers-color-scheme: dark)");
  const storedTheme = localStorage.getItem("theme");

  if (storedTheme === "dark") {
    return updateTheme("dark");
  }

  if (storedTheme === "light") {
    return updateTheme("light");
  }

  if (prefersDarkTheme.matches) {
    return updateTheme("dark");
  }
}

document.addEventListener("DOMContentLoaded", initialTheme);

//! Share Button Popup

const sharebtns = document.querySelectorAll(".share-btn");

sharebtns.forEach((btn) => {
  btn.addEventListener("click", (event) => {
    const popup = btn.closest(".event-footer").querySelector(".popup");

    btn.classList.toggle("active");
    popup.classList.toggle("active");

    event.stopPropagation();
  });
});

document.addEventListener("click", (event) => {
  const popups = document.querySelectorAll(".popup");

  popups.forEach((popup) => {
    if (popup.classList.contains("active") && !popup.contains(event.target)) {
      popup.classList.remove("active");

      const shareBtn = popup
        .closest(".event-footer")
        .querySelector(".share-btn");
      shareBtn.classList.remove("active");
    }
  });
});




