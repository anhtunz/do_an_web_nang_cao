<!-- #include file="connect.asp" -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sửa thông tin người dùng</title>
    <link rel="shortcut icon" type="image/x-icon" href="/Anh/logo1.ico">
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
    /* Phần navbar */
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
        justify-content: center;
        align-items: center;
        height: 700px;
        width: 80%;
    }
    .personal-info {
        display: flex;
        flex-direction: column;
        align-items: flex-start;
        gap: 10px;
    }

    .personal-info strong {
        display: inline-block;
        width: 120px;
    }

    .personal-info input,
    .personal-info select {
        width: 200px;
    }

    .personal-info .card-footer {
        display: flex;
        align-items: center;
        justify-content:center;
    }
    .mb5{
        margin-bottom: 10px;
    }
    
</style>
<%
    Response.CodePage = 65001
    Response.CharSet = "UTF-8"
    Dim id_nguoi_sua
    id_nguoi_sua = Request.QueryString("id_nguoi_sua") 
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=SQLOLEDB.1;Data Source=VIET\MSSQLSERVER01;Database=Web_doc_truyen;User Id=sa;Password=123456;"
    sql = "SELECT * FROM nguoi_dung WHERE id_nguoi_dung = "&id_nguoi_sua
    Set rs = conn.Execute(sql)
    Dim idnguoidung,hoten,email,matkhau,vaitro,nghedanh,ngaysinh,gioitinh,gioithieu
    idnguoidung = rs("id_nguoi_dung")
    ho_ten = rs("ho_ten")
    email_sua = rs("email")
    matkhau = rs("mat_khau")
    vaitro = rs("vai_tro")
    nghedanh = rs("nghe_danh")
    ngaysinh = rs("ngay_sinh")
    gioitinh = rs("gioi_tinh")
    gioithieu = rs("gioi_thieu")
    If Not rs.EOF Then
        If IsNull(ngaysinh) Then
            ngay_sinh = "Chưa có"
        Else
            ngay_sinh = FormatDateTime(ngaysinh, 1) 
        End If
%>
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
                <h2>Chỉnh sửa người dùng <%= ho_ten %></h2>
                <div class="personal-info">
                    <div class="card-body">
                        <form method="post" action="/check/admin_checkupdateinfo.asp">
                            <div class="mb5" style="display: none;">
                                <strong for="ID_Nguoi_dung">Id nguoi dung:</strong>
                                <input type="text" class="ID_Nguoi_dung" name="ID_Nguoi_dung" value="<%= idnguoidung %>" placeholder="">
                            </div>
                            <div class="mb5">
                                <strong for="hoten">Họ tên:</strong>
                                <input type="text" class="hoten" name="hoten" placeholder="Nhập họ tên" value="<%=ho_ten%>">
                            </div>
                            <div class="mb5">
                                <strong for="email">Email:</strong>
                                <input class="text" type="text" name="email" value="<%=email_sua%>" aria-label="readonly input example">
                            </div>
                            <div class="mb5">
                                <strong for="matkhau">Mật khẩu:</strong>
                                <input type="text" class="text" name="matkhau" value="<%=matkhau%>" placeholder="Định dạng yy-mm-dd">
                            </div>
                            <div class="mb5" style="float:left;">
                                <strong for="vaitro" style="float:left;">Vai trò:</strong>
                                <select style="float:left;" class="form-select" name="vaitro" aria-label="Default select example">
                                    <option <% If vaitro = "1" Then Response.Write("selected") %> value="1">Admin</option>
                                    <option <% If vaitro = "2" Then Response.Write("selected") %> value="2">Tác giả</option>
                                    <option <% If vaitro = "3" Then Response.Write("selected") %> value="3">Người dùng</option>
                                </select>
                            </div>
                            <div class="mb5">
                                <strong for="nghedanh">Nghệ danh:</strong>
                                <input type="text" class="text" name="nghedanh" value="<%=nghedanh%>" placeholder="Nhập nghệ danh">
                            </div>
                            <div class="mb5">
                                <strong for="ngaysinh">Ngày sinh:</strong>
                                <input type="date" class="text" name="ngaysinh" value="<%=ngaysinh%>" placeholder="Định dạng yy-mm-dd">
                            </div>
                            <div class="form-group mt-2 mb5">
                                <strong for="nghedanh">Giới tính:</strong>
                                <select class="custom-select" name="gioitinh"> 
                                    <option <% If gioitinh = "Nam" Then Response.Write("selected") %> value="Nam">Nam</option>
                                    <option <% If gioitinh = "Nu" Then Response.Write("selected") %> value="Nu">Nữ</option>
                                </select>
                            </div>
                            <div class="mb-3 mb5 text-center" style="display:contents;">
                                <strong for="gioithieu" class="form-label" >Giới thiệu:</strong>
                                <textarea class="text" id="gioithieu" name="gioithieu" rows="5" placeholder="Giới thiệu bản thân bạn" style="width: 200px;"><%=gioithieu%></textarea></div>  
                            <div class="card-footer">
                                <button type="submit" class="btn btn-primary" value="Sửa thông tin">Lưu thông tin</button>
                                <a type="button" class="btn btn-default float-right" href="admin_qli_nguoi_dung.asp?id_nguoi_dung=<%= id_nguoi_dung %>">Hủy bỏ</a>
                            </div>
                        </form>
                    </div>   
                    <%
                        
                        End If
                        rs.Close
                        Set rs = Nothing
                        conn.Close
                        Set conn = Nothing
                    %>
                </div>
            </div>
        </div>
    </div>
    <div class="footer">
        <!-- #include file="footer.asp" -->
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
