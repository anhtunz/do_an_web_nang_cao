<!-- #include file="connect.asp" -->
<%
    Dim id_nguoi_dung 
    id_nguoi_dung = Request.QueryString("id_nguoi_dung")
%>
<%
    Dim id_admin
    id_admin = Request.QueryString("id_admin")   
%>  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Web đọc truyện</title>
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
    
    .nav-item {
        display: flex;
        align-items: center;
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
        flex-direction: column;
        justify-content: center;
        align-items: center;
        height: 700px;
        width: 80%;
        
    }
    .eooo{
        margin-bottom: 20px;
    }
    .thongtin{
        width:50%;
    }
    .m5{
        margin-top: 15px;
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
            <div class="eooo">
                <h2>Thêm người dùng mới</h2>
            </div>
            <div class="thongtin">
                <form id="form" method="post" action="/check/admin_addusersbase.asp">
                    <div class="mb-3" style="display:none;">
                        <label for="exampleFormControlInput1" class="form-label">Id_admin: </label>
                        <input type="text" class="form-control" name="id" id="id" value="<%= id_admin%>">
                        <div class="error"></div>
                    </div>
                    <div class="mb-3" >
                        <label for="exampleFormControlInput1" class="form-label">Họ tên người dùng: </label>
                        <input type="text" class="form-control" name="hoten" id="hoten" placeholder="Nhập họ tên người dùng">
                        <div class="error"></div>
                    </div>
                    <div class="mb-3">
                        <label for="exampleFormControlInput1" class="form-label">Email: </label>
                        <input type="email" class="form-control" name="email" id="email" placeholder="name@example.com">
                        <div class="error"></div>
                    </div>
                    <div class="mb-3">
                        <label for="exampleFormControlInput1" class="form-label">Mật khẩu:</label>
                        <input type="password" class="form-control" name="matkhau" id="matkhau" placeholder="Nhập mật khẩu">
                        <div class="error"></div>
                    </div>
                    <div class="mb-3">
                        <label for="exampleFormControlInput1" class="form-label">Vai trò:</label>
                        <select class="form-select" aria-label="Default select example" name="role" id="role">
                            <option selected>Chọn vai trò</option>
                            <option value="1">Admin</option>
                            <option value="2">Tác giả</option>
                            <option value="3">Người dùng</option>
                        </select>
                        <div class="error"></div>
                    </div>
                    <button type="submit" class="btn btn-primary">
                        Thêm
                    </button>
                </form>
            </div>
        </div>
    </div>
    <div class="footer">
      <!-- #include file="footer.asp" -->
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>