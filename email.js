
const form = document.querySelector('form');
const fullName = document.getElementById("name-smtp");
const email = document.getElementById("email-smtp");
const phone = document.getElementById("phonenumber");
const subject = document.getElementById("subject-smtp");
const message = document.getElementById("message-smtp");

function sendEmail() {
    const bodyMessage = `Full Name: ${fullName.value}<br> Email: ${email.value}<br> Phone Number: ${phone.value}<br> Subject: ${subject.value}<br> Message: ${message.value}`;
    Email.send({
        Host: "smtp.elasticemail.com",
        Username: "adminpetworld@gmail.com",
        Password: "72A1C39F48B8ECA1FCCEDAF1CF2EE99A78D4",
        To: 'pavan06304@gmail.com',
        From: 'pavan06304@gmail.com',
        Subject: subject.value,
        Body: bodyMessage
    }).then(
        message => {
            if (message === "OK") {
                Swal.fire({
                    title: "Success!",
                    text: "Mail sent successfully!",
                    icon: "success"
                });
            }
        }
    );
}

function checkInputs() {
    const items = document.querySelectorAll(".item");
    items.forEach(item => {
        if (item.value === "") {
            item.classList.add("error");
            item.parentElement.classList.add("error");
        } else {
            item.classList.remove("error");
            item.parentElement.classList.remove("error");
        }
    });

    const emailRegex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    const errorTxtEmail = document.querySelector(".error-txt.email");
    if (!emailRegex.test(email.value)) {
        email.classList.add("error");
        email.parentElement.classList.add("error");
        if (email.value !== "") {
            errorTxtEmail.style.display = "block";
            errorTxtEmail.innerText = "Enter a valid Email address";
        } else {
            errorTxtEmail.style.display = "block";
            errorTxtEmail.innerText = "Email Address can't be blank";
        }
    } else {
        email.classList.remove("error");
        email.parentElement.classList.remove("error");
        errorTxtEmail.style.display = "none";
    }
}

form.addEventListener("submit", (e) => {
    e.preventDefault();
    checkInputs();
    const formInputs = [fullName, email, phone, subject, message];
    const isFormValid = formInputs.every(input => !input.classList.contains("error"));
    if (isFormValid) {
        sendEmail();
    }
});