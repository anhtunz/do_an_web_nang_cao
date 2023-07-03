<!-- #include file="connect.asp" -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đổi mật khẩu</title>
    <link rel="icon" type="image/x-icon" href="/Anh/logo1.ico">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" integrity="sha512-QzvsveSek0EUpu+K/ggG1B+UXpZcpvj3GvNiwuAQR6E79JQFZrQ4yaS5GfvsF8wz53nm2vUP0QGNEAI3SvlDhA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">
</head>
<style>
    /* Phần tổng */
    body{
        width: 100%;
        height: 750px;
        float: left;
    }
    .m40{
        margin:0 40px;
    }
    /* End tổng */
    /* Phần nacbar */
    .navbar{
        width: 100%;
        height: 50px;
        background-color: rgb(209, 198, 198);
        
    }
    /* End phần navbar */
    /* Phần sidebar */
    .sidebar{
        width: 20%;
        height: 700px;
        float: left;
    }

    .nav-link {
        display: flex;
        align-items: center;
        gap: 10px;
    }

    .material-symbols-outlined {
        display: flex;
        align-items: center;
    }
    /* End phần sidebar */

    /* Phần content */
    .content {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 700px;
        width: 80%;
    }
    .thongtin{
        width:60%;
    }
    .form-control{
    width: 95%;
    float: left;
    }

    .icon{
        border: none;
        height: 100%;
        background: white;
    }
</style>
<body>
    <div class="navbar">
       <!-- #include file="navbar.asp" -->
    </div>
    <div class="noidung">
        <div class="sidebar">
            <!-- #include file="sidebar.asp" -->
        </div>
        <div class="content">   
            <div class="thongtin">
                <%
                    Dim id_nguoi_dung
                    id_nguoi_dung = Request.QueryString("id_nguoi_dung")
                    ' Kết nối đến cơ sở dữ liệu
                    Set conn = Server.CreateObject("ADODB.Connection")
                    conn.Open "Provider=SQLOLEDB.1;Data Source=TUNZTUNZ\SQLEXPRESS;Database=Web_doc_truyen;User Id=sa;Password=123456;"
                    ' Truy vấn dữ liệu từ bảng nguoi_dung với id_nguoi_dung = 1
                    sql = "SELECT * FROM nguoi_dung WHERE id_nguoi_dung = "&id_nguoi_dung
                    Set rs = conn.Execute(sql)
                %>
                <div class="container mt-3">
                    <h1 style="text-align: center;">Đổi mật khẩu</h1>
                    <form id="changePasswordForm" method="post" action="/check/doi_mk_base.asp">
                        <div class="mb5" style="display: none;">
                            <strong for="ID_Nguoi_dung">Id nguoi dung:</strong>
                            <input type="text" class="ID_Nguoi_dung" name="ID_Nguoi_dung" value="<%= id_nguoi_dung %>" placeholder="">
                        </div>
                        <div class="mb-3">
                            <label for="currentPassword" class="form-label">Mật khẩu hiện tại:</label>
                            <div class="input-group">
                                <div class="input" style="width: 100%; float: left;">
                                    <input type="password" class="form-control" id="currentPassword" value="<%= rs("mat_khau") %>" name="matkhaucu"
                                            placeholder="Nhập mật khẩu cũ" readonly required>
                                    <button type="button" class="icon" id="toggleCurrentPassword">
                                        <span class="material-symbols-outlined">
                                                visibility
                                        </span>
                                    </button>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="newPassword" class="form-label">Mật khẩu mới:</label>
                                <div class="input-group">
                                    <div class="input" style="width: 100%; float: left;">
                                        <input type="password" class="form-control" name="matkhaumoi" id="newPassword"
                                            placeholder="Nhập mật khẩu mới" required>
                                        <button type="button" class="icon" id="toggleNewPassword">
                                            <span class="material-symbols-outlined">
                                            visibility
                                        </span></button>
                                    </div>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="confirmPassword" class="form-label">Xác nhận mật khẩu mới:</label>
                                <div class="input-group">
                                    <div class="input" style="width: 100%; float: left;">
                                        <input type="password" class="form-control" name="xacnhanmatkhaumoi" id="confirmPassword" 
                                        placeholder="Xác nhận mật khẩu" required>
                                        <button type="button" class="icon" id="toggleConfirmPassword">
                                            <span class="material-symbols-outlined">
                                                visibility
                                            </span></button>
                                    </div>
                                </div>
                            </div>
                        <div id="passwordMismatch" class="alert alert-danger d-none">Mật khẩu không khớp!</div>
                        <button type="submit" class="btn btn-primary">Xác nhận</button>
                        <a type="button" class="btn btn-dark " href="info.asp?id_nguoi_dung=<%= rs("id_nguoi_dung") %>">Hủy bỏ</a>
                    </form>
                </div>
                <%
                    rs.Close
                    Set rs = Nothing
                    conn.Close
                    Set conn = Nothing
                %>  
            </div>
        </div>
    </div>
    <div class="footer">
      <!-- #include file="footer.asp" -->
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.2/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#toggleCurrentPassword").click(function () {
                var newPasswordInput = $("#currentPassword");
                var newPasswordType = newPasswordInput.attr("type");
                var visibilityIcon = $(this).find(".material-symbols-outlined");

                if (newPasswordType === "password") {
                    newPasswordInput.attr("type", "text");
                    visibilityIcon.html("visibility_off");
                } else {
                    newPasswordInput.attr("type", "password");
                    visibilityIcon.html("visibility");
                }
            });
            $("#toggleNewPassword").click(function () {
                var newPasswordInput = $("#newPassword");
                var newPasswordType = newPasswordInput.attr("type");
                var visibilityIcon = $(this).find(".material-symbols-outlined");

                if (newPasswordType === "password") {
                    newPasswordInput.attr("type", "text");
                    visibilityIcon.html("visibility_off");
                } else {
                    newPasswordInput.attr("type", "password");
                    visibilityIcon.html("visibility");
                }
            });
            $("#toggleConfirmPassword").click(function () {
                var newPasswordInput = $("#confirmPassword");
                var newPasswordType = newPasswordInput.attr("type");
                var visibilityIcon = $(this).find(".material-symbols-outlined");

                if (newPasswordType === "password") {
                    newPasswordInput.attr("type", "text");
                    visibilityIcon.html("visibility_off");
                } else {
                    newPasswordInput.attr("type", "password");
                    visibilityIcon.html("visibility");
                }
            });
            $("#changePasswordForm").submit(function (event) {
                event.preventDefault();
                var newPassword = $("#newPassword").val();
                var confirmPassword = $("#confirmPassword").val();

                if (newPassword !== confirmPassword) {
                    $("#passwordMismatch").removeClass("d-none");
                } else {
                    this.submit();
                }
            });
        });
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>