<!-- #include file="connect.asp" -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chỉnh sửa truyện</title>
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
        height: 700px;
        width: 80%;
        margin-top: 10px;
        
    }
    .field-name,
    .field-value {
        font-size: 20px;
    }

    .TenTruyen {
        font-size: 20px;
        padding: 20px;
        width: 300px;
        height: 60px;
    }

    #preview-container {
        display: flex;
        flex-wrap: wrap;
    }

    .preview-image {
        width: 200px;
        height: auto;
        margin: 10px;
    }

    .left-div {
        display: flex;
        width: 45%;
        
    }
    .card-title,
    .card-footer {
        display: flex;
        justify-content: center;
        align-items: center;
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
            <% 
                If (isnull(Session("email")) OR TRIM(Session("email")) = "") Then
                    Response.redirect("/login.asp")
                End If
                Dim email
                email = Session("email")
                Dim id_truyen,page,id_nguoi_dung
                id_truyen = Request.QueryString("id_truyen") 
                page = Request.QueryString("page")
                id_nguoi_dung = Request.QueryString("id_nguoi_dung")
                Set conn = Server.CreateObject("ADODB.Connection")
                conn.Open "Provider=SQLOLEDB.1;Data Source=TUNZTUNZ\SQLEXPRESS;Database=Web_doc_truyen;User Id=sa;Password=123456;"
                sql = "SELECT * FROM truyen WHERE id_truyen= " & id_truyen
                Set rs = conn.Execute(sql)
                Dim tinh_trang
                tinh_trang = rs("tinh_trang")
                Dim the_loai
                the_loai = rs("id_the_loai")
            %>
            <div class="card card-primary" style="width: 100%;">
                <div class="card-header">
                    <h2 class="card-title" style=" color: blue">Sửa truyện <%= rs("ten_truyen") %> </h2>
                </div>
                    <form id="myForm" method="post" action="/check/sua_truyen_base.asp">
                        <div  style="display: none;">
                            <strong for="ID_USER">Id nguoi dung:</strong>
                            <input type="text" class="ID_USER" name="ID_USER" value="<%= id_nguoi_dung %>" placeholder="">
                        </div>
                        <div  style="display: none;">
                            <strong for="ID_COMIC">ID_COMIC:</strong>
                            <input type="text" class="ID_COMIC" name="ID_COMIC" value="<%= id_truyen %>" placeholder="">
                        </div>
                        <div  style="display: none;">
                            <strong for="page">Page:</strong>
                            <input type="text" class="page" name="page" value="<%= page %>" placeholder="">
                        </div>
                        <div>
                            <strong for="TenTruyen">Tên truyện:</strong>
                            <input type="text" class="TenTruyen" name="TenTruyen" value="<%= rs("ten_truyen") %>" placeholder="Nhập Tên truyện">
                            
                        </div>
                        <div class="SoChuong">
                            <strong for="SoChuong">Số chương</strong>
                            <input type="text" class="form-control" name="SoChuong" value="<%= rs("so_chuong") %>" placeholder="Số chương truyện">
                        </div>
                        <div class="NamXB">
                            <strong for="NamXB">Năm xuất bản</strong>
                            <input type="date" class="form-control" name="NamXB" value="<%= rs("nam_xb") %>" placeholder="Định dang yy-mm-dd">
                        </div>
                        <div class="Anhtruyen">
                            <strong for="Anhtruyen">Ảnh truyện</strong>
                            <input type="text" class="form-control" name="Anhtruyen" value="<%= rs("anh_truyen") %>" placeholder="Vui lòng điền link ảnh">
                        </div>
                        <div class="divflex">
                            <div class="left-div">
                                <strong> Tình trạng :</strong>
                                <div class="form-check">
                                    <input <% If tinh_trang = "Full" Then Response.Write("checked") %> class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" value="Full" style="display: flex; margin:2px;">
                                    <label class="form-check-label" for="flexRadioDefault1">
                                        Full
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input <% If tinh_trang = "NotFull" Then Response.Write("checked") %> class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" value="NotFull" style="display: flex; margin:2px; ">
                                    <label class="form-check-label" for="flexRadioDefault2">
                                        Chưa Full
                                    </label>
                                </div>
                            </div>
                            <div class="TheLoai" style="display: flex;">
                                <strong>Thể Loại: </strong>
                                <div class="form-check">
                                    <input <% If the_loai = 1 Then Response.Write("checked") %> class="form-check-input" type="radio" name="flexRadioDefault1" value="1"
                                    id="flexRadioDefault1" style=" margin-left:2px; ">
                                    <label class="form-check-label" for="flexRadioDefault1">
                                        Kiếm hiệp
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input <% If the_loai = 2 Then Response.Write("checked") %> class="form-check-input" type="radio" name="flexRadioDefault1" value="2" style=" margin-left:2px; ">
                                    <label class="form-check-label">
                                        Truyện teen
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input <% If the_loai = 3 Then Response.Write("checked") %> class="form-check-input" type="radio" name="flexRadioDefault1" value="3" style=" margin-left:2px; ">
                                    <label class="form-check-label" >
                                        Ngôn tình
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input <% If the_loai = 4 Then Response.Write("checked") %> class="form-check-input" type="radio" name="flexRadioDefault1" value="4" style=" margin-left:2px; ">
                                    <label class="form-check-label">
                                        Truyện cười
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input <% If the_loai = 5 Then Response.Write("checked") %> class="form-check-input" type="radio" name="flexRadioDefault1" value="5" style=" margin-left:2px; ">
                                    <label class="form-check-label" >
                                        Tiểu thuyết
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input <% If the_loai = 6 Then Response.Write("checked") %> class="form-check-input" type="radio" name="flexRadioDefault1" value="5" style=" margin-left:2px; ">
                                    <label class="form-check-label" >
                                        Truyện ma
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="mb-3">
                            <strong for="gioithieu" class="form-label">Mô tả truyện</strong>
                            <textarea class="form-control" id="gioithieu" name="gioithieu" rows="8"> <%= rs("mo_ta_ndung") %></textarea>
                        </div>
                        <div class="card-footer">
                            <button type="submit" class="btn btn-primary" value="Đăng truyện">Sửa truyện</button>
                            <a type="button" class="btn btn-default float-right" href= "qli_truyen.asp?id_nguoi_dung=<%= id_nguoi_dung %>">Hủy bỏ</a>
                        </div>
                    </form>
                    
                </div>     
            </div>
        </div>
    </div>
    <div class="footer">
      <!-- #include file="footer.asp" -->
    </div>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>