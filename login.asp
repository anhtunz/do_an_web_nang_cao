<!--#include file="connect.asp"-->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập - Đăng kí</title>
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css'>
    <link rel='stylesheet' href='https://unicons.iconscout.com/release/v2.1.9/css/unicons.css'>
    <link rel="stylesheet" href="./style.css">
    <link rel="shortcut icon" href="/Anh/logo1.ico" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="/node_modules/toastify-js/src/toastify.css">
    <script src="/node_modules/toastify-js/src/toastify.js"></script>
</head>
<style>
    @import url('https://fonts.googleapis.com/css?family=Poppins:400,500,600,700,800,900');
    body {
        font-family: 'Poppins', sans-serif;
        font-weight: 300;
        font-size: 15px;
        line-height: 1.7;
        color: #c4c3ca;
        background-color: #1f2029;
        overflow-x: hidden;
    }

    a {
        cursor: pointer;
        transition: all 200ms linear;
    }

    a:hover {
        text-decoration: none;
    }

    .link {
        color: #c4c3ca;
    }

    .link:hover {
        color: #ffeba7;
    }

    p {
        font-weight: 500;
        font-size: 14px;
        line-height: 1.7;
    }

    h4 {
        font-weight: 600;
    }

    h6 span {
        padding: 0 20px;
        text-transform: uppercase;
        font-weight: 700;
    }

    .section {
        position: relative;
        width: 100%;
        display: block;
    }

    .full-height {
        min-height: 100vh;
    }

    [type="checkbox"]:checked,
    [type="checkbox"]:not(:checked) {
        position: absolute;
        left: -9999px;
    }

    .checkbox:checked+label,
    .checkbox:not(:checked)+label {
        position: relative;
        display: block;
        text-align: center;
        width: 60px;
        height: 16px;
        border-radius: 8px;
        padding: 0;
        margin: 10px auto;
        cursor: pointer;
        background-color: #ffeba7;
    }

    .checkbox:checked+label:before,
    .checkbox:not(:checked)+label:before {
        position: absolute;
        display: block;
        width: 36px;
        height: 36px;
        border-radius: 50%;
        color: #ffeba7;
        background-color: #102770;
        font-family: 'unicons';
        content: '\eb4f';
        z-index: 20;
        top: -10px;
        left: -10px;
        line-height: 36px;
        text-align: center;
        font-size: 24px;
        transition: all 0.5s ease;
    }

    .checkbox:checked+label:before {
        transform: translateX(44px) rotate(-270deg);
    }


    .card-3d-wrap {
        position: relative;
        width: 440px;
        max-width: 100%;
        height: 500px;
        -webkit-transform-style: preserve-3d;
        transform-style: preserve-3d;
        perspective: 800px;
        margin-top: 60px;
    }

    .card-3d-wrapper {
        width: 100%;
        height: 100%;
        position: absolute;
        top: 0;
        left: 0;
        -webkit-transform-style: preserve-3d;
        transform-style: preserve-3d;
        transition: all 600ms ease-out;
    }

    .card-front,
    .card-back {
        width: 100%;
        height: 100%;
        background-color: #2a2b38;
        background-image: url('https://s3-us-west-2.amazonaws.com/s.cdpn.io/1462889/pat.svg');
        background-position: bottom center;
        background-repeat: no-repeat;
        background-size: 300%;
        position: absolute;
        border-radius: 6px;
        left: 0;
        top: 0;
        -webkit-transform-style: preserve-3d;
        transform-style: preserve-3d;
        -webkit-backface-visibility: hidden;
        -moz-backface-visibility: hidden;
        -o-backface-visibility: hidden;
        backface-visibility: hidden;
    }

    .card-back {
        transform: rotateY(180deg);
    }

    .checkbox:checked~.card-3d-wrap .card-3d-wrapper {
        transform: rotateY(180deg);
    }

    .center-wrap {
        position: absolute;
        width: 100%;
        padding: 0 35px;
        top: 50%;
        left: 0;
        transform: translate3d(0, -50%, 35px) perspective(100px);
        z-index: 20;
        display: block;
    }


    .form-group {
        position: relative;
        display: block;
        margin: 0;
        padding: 0;
    }

    .form-style {
        padding: 13px 20px;
        padding-left: 55px;
        height: 48px;
        width: 100%;
        font-weight: 500;
        border-radius: 4px;
        font-size: 14px;
        line-height: 22px;
        letter-spacing: 0.5px;
        outline: none;
        color: #c4c3ca;
        background-color: #1f2029;
        border: none;
        -webkit-transition: all 200ms linear;
        transition: all 200ms linear;
        box-shadow: 0 4px 8px 0 rgba(21, 21, 21, .2);
    }

    .form-style:focus,
    .form-style:active {
        border: none;
        outline: none;
        box-shadow: 0 4px 8px 0 rgba(21, 21, 21, .2);
    }

    .input-icon {
        position: absolute;
        top: 0;
        left: 18px;
        height: 48px;
        font-size: 24px;
        line-height: 48px;
        text-align: left;
        color: #ffeba7;
        -webkit-transition: all 200ms linear;
        transition: all 200ms linear;
    }

    .form-group input:-ms-input-placeholder {
        color: #c4c3ca;
        opacity: 0.7;
        -webkit-transition: all 200ms linear;
        transition: all 200ms linear;
    }

    .form-group input::-moz-placeholder {
        color: #c4c3ca;
        opacity: 0.7;
        -webkit-transition: all 200ms linear;
        transition: all 200ms linear;
    }

    .form-group input:-moz-placeholder {
        color: #c4c3ca;
        opacity: 0.7;
        -webkit-transition: all 200ms linear;
        transition: all 200ms linear;
    }

    .form-group input::-webkit-input-placeholder {
        color: #c4c3ca;
        opacity: 0.7;
        -webkit-transition: all 200ms linear;
        transition: all 200ms linear;
    }

    .form-group input:focus:-ms-input-placeholder {
        opacity: 0;
        -webkit-transition: all 200ms linear;
        transition: all 200ms linear;
    }

    .form-group input:focus::-moz-placeholder {
        opacity: 0;
        -webkit-transition: all 200ms linear;
        transition: all 200ms linear;
    }

    .form-group input:focus:-moz-placeholder {
        opacity: 0;
        -webkit-transition: all 200ms linear;
        transition: all 200ms linear;
    }

    .form-group input:focus::-webkit-input-placeholder {
        opacity: 0;
        -webkit-transition: all 200ms linear;
        transition: all 200ms linear;
    }

    .btn {
        border-radius: 4px;
        height: 44px;
        font-size: 13px;
        font-weight: 600;
        text-transform: uppercase;
        -webkit-transition: all 200ms linear;
        transition: all 200ms linear;
        padding: 0 30px;
        letter-spacing: 1px;
        display: -webkit-inline-flex;
        display: -ms-inline-flexbox;
        display: inline-flex;
        -webkit-align-items: center;
        -moz-align-items: center;
        -ms-align-items: center;
        align-items: center;
        -webkit-justify-content: center;
        -moz-justify-content: center;
        -ms-justify-content: center;
        justify-content: center;
        -ms-flex-pack: center;
        text-align: center;
        border: none;
        background-color: #ffeba7;
        color: #102770;
        box-shadow: 0 8px 24px 0 rgba(255, 235, 167, .2);
    }

    .btn:active,
    .btn:focus {
        background-color: #102770;
        color: #ffeba7;
        box-shadow: 0 8px 24px 0 rgba(16, 39, 112, .2);
    }

    .btn:hover {
        background-color: #102770;
        color: #ffeba7;
        box-shadow: 0 8px 24px 0 rgba(16, 39, 112, .2);
    }

    .logo {
        position: absolute;
        top: 30px;
        right: 30px;
        display: block;
        z-index: 100;
        transition: all 250ms linear;
    }

    .logo img {
        height: 26px;
        width: auto;
        display: block;
    }
</style>

<body>
    <% If Request.QueryString("signupsucess") = "1" Then %>
        <script>
            Toastify({
                text: "Đăng kí tài khoản thành công",
                duration: 3000,
                newWindow: true,
                close: true,
                gravity: "top",
                position: "right",
                backgroundColor: "linear-gradient(to right, #00b09b, #96c93d)",
                stopOnFocus: true,
            }).showToast();
        </script>
    <% End If %>
    <% If Request.QueryString("empty") = "1" Then %>
        <script>
            Toastify({
                text: "Hãy nhập tài khoản hoặc mật khẩu",
                duration: 3000,
                newWindow: true,
                close: true,
                gravity: "top",
                position: "right",
                backgroundColor: "linear-gradient(to right, #FF7171, #FFCE54)",
                stopOnFocus: true,
            }).showToast();
        </script>
    <% End If %>
    <% If Request.QueryString("loginfalse") = "1" Then %>
        <script>
            Toastify({
                text: "Sai tài khoản hoặc mật khẩu",
                duration: 3000,
                newWindow: true,
                close: true,
                gravity: "top",
                position: "right",
                backgroundColor: "linear-gradient(to right, #FF7171, #FFCE54)",
                stopOnFocus: true,
            }).showToast();
        </script>
    <% End If %>
    <!-- partial:index.partial.html -->
    <div class="section">
        <div class="container">
            <div class="row full-height justify-content-center">
                <div class="col-12 text-center align-self-center py-5">
                    <div class="section pb-5 pt-5 pt-sm-2 text-center">
                        <h6 class="mb-0 pb-3"><span>Đăng nhập</span><span>Đăng kí</span></h6>
                        <input class="checkbox" type="checkbox" id="reg-log" name="reg-log" />
                        <label for="reg-log"></label>
                        <div class="card-3d-wrap mx-auto">
                            <div class="card-3d-wrapper">
                                <div class="card-front">
                                    <div class="center-wrap">
                                        <div class="section text-center">
                                            <h4 class="mb-4 pb-3">Đăng nhập</h4>
                                            <form method="post" action="check/checklog.asp">
                                                <div class="form-group">
                                                    <input type="email" name="loginemail" class="form-style" placeholder="Nhập email" id="loginemail" autocomplete="off">
                                                    <i class="input-icon uil uil-at"></i>
                                                </div>
                                                <div class="form-group">
                                                    <input type="password" name="loginpass" class="form-style" placeholder="Nhập mật khẩu" id="loginpass" autocomplete="off">
                                                    <i class="input-icon uil uil-lock-alt"></i>
                                                </div>
                                                <button type="submit" class="btn mt-4">Đăng nhập</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-back">
                                    <div class="center-wrap">
                                        <div class="section text-center">
                                            <h4 class="mb-4 pb-3">Đăng kí</h4>
                                            <form method="post" action="check/checksign.asp" onsubmit="return validateForm()">
                                                <div class="form-group">
                                                    <input type="text" name="signname" class="form-style" placeholder="Nhập họ tên" id="signname" autocomplete="off">
                                                    <i class="input-icon uil uil-user"></i>
                                                    <span id="signname-error" class="error-message"></span>
                                                </div>

                                                <div class="form-group mt-2">
                                                    <input type="email" name="signemail" class="form-style" placeholder="Nhập email" id="signemail" autocomplete="off">
                                                    <i class="input-icon uil uil-at"></i>
                                                    <span id="signemail-error" class="error-message"></span>
                                                </div>

                                                <div class="form-group mt-2" style="display: flex; align-items: center;">
                                                    <input style="flex: 1;" type="password" name="signpass" class="form-style" placeholder="Nhập mật khẩu" id="signpass" autocomplete="off">
                                                    <i class="input-icon uil uil-lock-alt"></i>
                                                    <span class="password-toggle" onclick="togglePasswordVisibility('signpass')">
                                                        <i class="toggle-icon uil uil-eye"></i>
                                                    </span>
                                                    <span id="signpass-error" class="error-message"></span>
                                                </div>

                                                <div class="form-group mt-2" style="display: flex; align-items: center;">
                                                    <input style="flex: 1;" type="password" name="confirmpass" class="form-style" placeholder="Nhập lại mật khẩu" id="confirmpass" autocomplete="off">
                                                    <i class="input-icon uil uil-lock-alt"></i>
                                                    <span class="password-toggle" onclick="togglePasswordVisibility('confirmpass')">
                                                        <i class="toggle-icon uil uil-eye"></i>
                                                    </span>
                                                    <span id="confirmpass-error" class="error-message"></span>
                                                </div>

                                                <div class="form-group mt-2">
                                                    <input type="text" name="signnick" class="form-style" placeholder="Nhập nghệ danh" id="signnick" autocomplete="off">
                                                    <i class="input-icon uil uil-pen"></i>
                                                </div>

                                                <div class="form-group mt-2">
                                                    <select class="custom-select" style="background-color: #2a2b38; color: white;" name="role">
                                                        <option selected>Chọn vai trò</option>
                                                        <option value="2">Tác giả</option>
                                                        <option value="3">Người dùng</option>
                                                    </select>
                                                </div>

                                                <button type="submit" class="btn mt-4">Đăng kí</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- partial -->
<script>
    function togglePasswordVisibility(inputId) {
        var input = document.getElementById(inputId);
        var toggleIcon = input.nextElementSibling.querySelector('.toggle-icon');
        
        if (input.type === 'password') {
            input.type = 'text';
            toggleIcon.classList.remove('uil-eye');
            toggleIcon.classList.add('uil-eye-slash');
        } else {
            input.type = 'password';
            toggleIcon.classList.remove('uil-eye-slash');
            toggleIcon.classList.add('uil-eye');
        }
    }
    function validateForm() {
        var signname = document.getElementById("signname").value;
        var signemail = document.getElementById("signemail").value;
        var signpass = document.getElementById("signpass").value;
        var confirmpass = document.getElementById("confirmpass").value;
        
        var signnameError = document.getElementById("signname-error");
        var signemailError = document.getElementById("signemail-error");
        var signpassError = document.getElementById("signpass-error");
        var confirmpassError = document.getElementById("confirmpass-error");

        // Xóa thông báo lỗi hiện tại (nếu có)
        signnameError.textContent = "";
        signemailError.textContent = "";
        signpassError.textContent = "";
        confirmpassError.textContent = "";

        // Kiểm tra các trường không được bỏ trống
        var isValid = true;
        if (signname === "") {
            signnameError.textContent = "Vui lòng nhập họ tên.";
            isValid = false;
        }
        if (signemail === "") {
            signemailError.textContent = "Vui lòng nhập email.";
            isValid = false;
        }
        if (signpass === "") {
            signpassError.textContent = "Vui lòng nhập mật khẩu.";
            isValid = false;
        }
        if (confirmpass === "") {
            confirmpassError.textContent = "Vui lòng nhập lại mật khẩu.";
            isValid = false;
        }

        // Kiểm tra mật khẩu có giống nhau không
        if (signpass !== confirmpass) {
            confirmpassError.textContent = "Mật khẩu không khớp.";
            isValid = false;
        }

        return isValid;
    }
</script>
</body>

</html>