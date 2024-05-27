<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Login</title>
        <link rel="stylesheet" type="text/css" href="css/UserLogin.css">
        <style>
            .container .captcha-box img {
                height: 55px;
                width: 300px;
                border-radius: 7px;
            }

            .container input {
                all: unset;
                height: 42px;
                width: 210px;
                border: 1px solid grey;
                padding-left: 15px;
                border-radius: 5px;
                margin-right: 30px;
                margin-left: 65px;
                margin-top: 6px;
                font-size: 15px;
            }

            .container.active {
                height: 370px;
            }

            .captcha-container {
                display: flex;
                flex-direction: column;
                align-items: flex-start;
            }

            .message {
                margin-top: 10px;
                margin-bottom: 0;
            }

            .container .captcha-box {
                height: 55px;
                width: 270px;
                display: flex;
                align-items: center;
                justify-content: center;
                margin: auto;
                margin-top: 33px;
            }

            .container .captcha-box h4 {
                position: absolute;
                font-size: 23px;
                letter-spacing: 2px;
                color: lightgrey;
                text-decoration: line-through;
                color: rgba(220, 220, 220, 0.8);
            }

            .container button {
                border-left: 20px;
                all: unset;
                height: 5px;
                padding: 15px;
                display: flex;
                flex-direction: center; /* Change to center */
                color: white;
                align-items: center;
                justify-content: center;
                background: #5469d4;
                border: 2px solid none;
                border-radius: 5px;
                white-space: nowrap;
                margin-top: 7px;
                font-size: 15px;
                margin-left: auto; /* Center horizontally */
                margin-right: auto; /* Center horizontally */
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <div class="login-root">
            <div class="box-root flex-flex flex-direction--column" style="min-height: 100vh; flex-grow: 1;">
                <div class="loginbackground box-background--white padding-top--64">
                    <div class="loginbackground-gridContainer">
                        <div class="box-root flex-flex" style="grid-area: top/start/8/end;">
                            <div class="box-root" style="background-image: linear-gradient(white 0%, rgb(247, 250, 252) 33%); flex-grow: 1;"></div>
                        </div>
                        <div class="box-root flex-flex" style="grid-area: 4/2/auto/5;">
                            <div class="box-root box-divider--light-all-2 animationLeftRight tans3s" style="flex-grow: 1;"></div>
                        </div>
                        <div class="box-root flex-flex" style="grid-area: 6/start/auto/2;">
                            <div class="box-root box-background--blue800" style="flex-grow: 1;"></div>
                        </div>
                        <div class="box-root flex-flex" style="grid-area: 7/start/auto/4;">
                            <div class="box-root box-background--blue animationLeftRight" style="flex-grow: 1;"></div>
                        </div>
                        <div class="box-root flex-flex" style="grid-area: 8/4/auto/6;">
                            <div class="box-root box-background--gray100 animationLeftRight tans3s" style="flex-grow: 1;"></div>
                        </div>
                        <div class="box-root flex-flex" style="grid-area: 2/15/auto/end;">
                            <div class="box-root box-background--cyan200 animationRightLeft tans4s" style="flex-grow: 1;"></div>
                        </div>
                        <div class="box-root flex-flex" style="grid-area: 3/14/auto/end;">
                            <div class="box-root box-background--blue animationRightLeft" style="flex-grow: 1;"></div>
                        </div>
                        <div class="box-root flex-flex" style="grid-area: 4/17/auto/20;">
                            <div class="box-root box-background--gray100 animationRightLeft tans4s" style="flex-grow: 1;"></div>
                        </div>
                        <div class="box-root flex-flex" style="grid-area: 5/14/auto/17;">
                            <div class="box-root box-divider--light-all-2 animationRightLeft tans3s" style="flex-grow: 1;"></div>
                        </div>
                    </div>
                </div>

                <div class="box-root padding-top--24 flex-flex flex-direction--column" style="flex-grow: 1; z-index: 9;">
                    <div class="box-root padding-top--48 padding-bottom--24 flex-flex flex-justifyContent--center">
                        <h1>Password Reset</h1>
                    </div>
                    <div class="formbg-outer">
                        <div class="formbg">
                            <div class="formbg-inner padding-horizontal--48">
                              
                                <form id="stripe-login" action="PasswordDbreset.jsp" method="post">
                                    <div class="field padding-bottom--24">
                                        <label for="email">Email</label>
                                        <input type="email" id="email" name="email">
                                    </div>
                                    <div class="field padding-bottom--24">
                                        <div class="grid--50-50">
                                            <label for="password">Enter New Password</label>
                                                                                   </div>
                                        <input type="password" name="password" id="password" required>
                                    </div>
                                     <div class="field padding-bottom--24">
                                        <div class="grid--50-50">
                                            <label for="cpassword">Confirm  Password</label>
                                                                                   </div>
                                        <input type="cpassword" name="cpassword" id="cpassword" required>
                                     </div>

                                    <!-- Captcha fields  -->

                                    <div class="field padding-bottom--24 container"
                                         style="bg-color: blue">
                                        <div class="captcha-container">
                                            <div class="field padding-bottom--24 captcha-box">
                                                <img src="./image/Captcha.jpeg" alt="captcha">
                                                <h4 class="captcha"></h4>
                                            </div>
                                            <input type="text" placeholder="Enter the captcha"
                                                   class="field padding-bottom--24 user-input"> <br>
                                            <button type="button"
                                                    class="field padding-bottom--20 generate-btn">Re-Generate captcha</button>
                                        </div>
                                        <br>
                                        <p class="message"></p>
                                        <div class="field padding-bottom--24">
                                            <input class="field padding-bottom--24 verify-btn"
                                                   style="background-color: #5469d4; color: white; width: 95%; margin-left: -2px; text-align: center"
                                                   type="submit" name="submit" value="LOGIN">
                                        </div>
                                        <div class="footer-link padding-top--24">
                                            <span>Don't have an account? <a href="UserRegistration.jsp">Sign
                                                    up</a></span>
                                            <div
                                                class="listing padding-top--24 padding-bottom--24 flex-flex center-center"></div>
                                        </div>
                                    </div>




                                </form>
                            </div>
                        </div>
                        <div class="footer-link padding-top--24">
                            <div class="listing padding-top--24 padding-bottom--24 flex-flex center-center">
                                <span><a href="#">Privacy</a></span> <span><a href="#">Terms &amp; Conditions</a></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>
            // JavaScript code for captcha and form submission
            let captchaTxt = document.querySelector('.container .captcha-box h4');
            let userInput = document.querySelector('.container .user-input');
            let checkBtn = document.querySelector('.verify-btn');
            let generateBtn = document.querySelector('.generate-btn');
            let container = document.querySelector('.container');
            let message = document.querySelector('.container .message');

            let captchacharacter = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

            let generateCaptcha = () => {
                captchaTxt.innerHTML = '';
                for (let i = 0; i < 6; i++) {
                    let captcha = captchacharacter[Math.floor(Math.random() * captchacharacter.length)];
                    captchaTxt.innerHTML += ' ' + captcha;
                }
                userInput.value = '';
                message.style.display = 'none';
                container.classList.remove('active');
            };

            let check = () => {
                let userAnswer = userInput.value;
                let captcha = captchaTxt.innerHTML;
                if (userAnswer.replaceAll(' ', '') === captcha.replaceAll(' ', '')) {
                    container.classList.add('active');
                    message.style.display = 'block';
                    message.innerHTML = '<i class="fa-solid fa-circle-check"></i> Captcha matched. You are not a robot';
                    message.classList.remove('incorrect');
                    message.classList.add('correct');
                    return true;
                } else {
                    message.style.display = 'block';
                    container.classList.add('active');
                    message.innerHTML = '<i class="fa-solid fa-triangle-exclamation"></i> Captcha not matched. please try again!';
                    message.classList.remove('correct');
                    message.classList.add('incorrect');
                    return false; 
                }
            };

            generateCaptcha();
            generateBtn.addEventListener('click', generateCaptcha);
            checkBtn.addEventListener('click', () => {
                if (userInput.value !== '') {
                    if (check()) {
                        document.getElementById('stripe-login').submit();
                    }
                } else {
                    alert('Please enter the captcha first!');
                }
            });

            // Prevent form submission if captcha is incorrect
            document.getElementById('stripe-login').addEventListener('submit', function (event) {
                if (!check()) {
                    event.preventDefault();
                }
            });
        </script>
    </body>
</html>
