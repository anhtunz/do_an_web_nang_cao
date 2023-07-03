<!-- #include file="connect.asp" -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý người dùng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" integrity="sha512-QzvsveSek0EUpu+K/ggG1B+UXpZcpvj3GvNiwuAQR6E79JQFZrQ4yaS5GfvsF8wz53nm2vUP0QGNEAI3SvlDhA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">
    <link rel="icon" type="image/x-icon" href="/Anh/logo1.ico">
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
        text-align: center;
        height: 700px;
        width: 80%;
        
    }
    .eooo{
        margin-bottom: 20px;
    }
    .field-name,
    .field-value{
        font-size: 20px;
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
                <h2>THÔNG TIN NGƯỜI DÙNG</h2>
            </div>
            <div class="thongtin">
                <div class="personal-info">
                <%
                    Dim id_nguoi_dung 
                    id_nguoi_dung = Request.QueryString("id_nguoi_dung")
                    Set conn = Server.CreateObject("ADODB.Connection")
                    conn.Open "Provider=SQLOLEDB.1;Data Source=VIET\MSSQLSERVER01;Database=Web_doc_truyen;User Id=sa;Password=123456;"
                    sql = "SELECT * FROM nguoi_dung WHERE id_nguoi_dung = "&id_nguoi_dung
                    Set rs = conn.Execute(sql)
                    If Not rs.EOF Then
                        If IsNull(rs("ngay_sinh")) Then
                            ngay_sinh = "Null"
                        Else
                            ngay_sinh = FormatDateTime(rs("ngay_sinh"), 1) ' 1: Hiển thị ngày tháng năm
                    End If
                %>
                <div class="info-row">
                    <span class="field-name">Tên:</span>
                    <span class="field-value fw-bold"><%=rs("ho_ten")%></span>
                </div>
                <div class="info-row">
                    <span class="field-name">Email:</span>
                    <span class="field-value"><%=rs("email")%></span>
                </div>
                <div class="info-row">
                    <span class="field-name">Mật khẩu:</span>
                    <span class="field-value"><%=rs("mat_khau")%></span>
                </div>
                <div class="info-row">
                    <span class="field-name">Vai trò:</span>
                    <span class="field-value">
                        <%
                            Dim vaitro
                            vaitro = rs("vai_tro")
                            If vaitro = 1 Then
                        %>
                            <td class="text-center">Admin</td>
                        <%
                            ElseIf vaitro = 2 Then
                        %>
                            <td class="text-center">Tác giả</td>
                        <%
                            ElseIf vaitro = 3 Then
                        %>
                            <td class="text-center">Người đọc</td>
                        <%
                            end If
                        %>     
                    </span>
                </div>
                <div class="info-row">
                    <span class="field-name">Nghệ danh:</span>
                    <span class="field-value fw-bold"><%=rs("nghe_danh")%></span>
                </div>
                <div class="info-row">
                    <span class="field-name">Ngày sinh:</span>
                    <span class="field-value"><%=ngay_sinh%></span>
                </div>
                <div class="info-row">
                    <span class="field-name">Giới tính:</span>
                    <span class="field-value">
                        <%
                            Dim gioitinh
                            gioitinh = rs("gioi_tinh")
                        %>
                        <%
                            If gioitinh = "Nam" Then
                        %>
                        Nam
                        <%
                            ElseIf gioitinh = "Nu" Then
                        %>
                        Nữ
                        <%
                            End If
                        %>
                    </span>
                </div>
                <div class="info-row m40">
                    <span class="field-name">Giới thiệu:</span>
                    <span class="field-value">
                        <%=rs("gioi_thieu")%>
                    </span>
                    <%
                        Dim id_nguoi_sua
                        id_nguoi_sua = rs("id_nguoi_dung")
                        Else
                            Response.Write "Không tìm thấy thông tin người dùng."
                        End If
                        rs.Close
                        Set rs = Nothing
                        conn.Close
                        Set conn = Nothing
                    %>
                </div>
            </div>
        </div>
        <div class="nutthem" style="margin-top: 40px;">
            <form method="post" action="admin_sua_nguoi_dung.asp?id_nguoi_sua=<%= id_nguoi_sua %>">
                <button type="submit" class="btn btn-success btn-lg">Sửa thông tin người dùng</button>
            </form>
            <a type="button"  href="qli_nguoi_dung.asp?id_nguoi_dung=5" class="btn btn-primary btn-lg m5">Quay lại</a>
        </div>
    </div>
    <div class="footer">
      <!-- #include file="footer.asp" -->
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>