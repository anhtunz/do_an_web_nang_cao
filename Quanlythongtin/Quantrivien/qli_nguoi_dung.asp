<!-- #include file="connect.asp" -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý người dùng</title>
    <link rel="icon" type="image/x-icon" href="/Anh/logo1.ico">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" integrity="sha512-QzvsveSek0EUpu+K/ggG1B+UXpZcpvj3GvNiwuAQR6E79JQFZrQ4yaS5GfvsF8wz53nm2vUP0QGNEAI3SvlDhA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">
    <link rel="stylesheet" type="text/css" href="/node_modules/toastify-js/src/toastify.css">
    <script src="/node_modules/toastify-js/src/toastify.js"></script>
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
    .table {
    table-layout: fixed;
  }

  .table td.text-center {
    word-break: break-word;
    max-width: 200px; /* Điều chỉnh độ rộng tối đa của cột */
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
  }
    
</style>
<body>
    <%
        Dim id_nguoi_dung
        id_nguoi_dung = Request.QueryString("id_nguoi_dung")
        function Ceil(Number)
            Ceil = Int(Number)
            if Ceil<>Number Then
            Ceil = Ceil + 1
            end if
        end function
        function checkPage(cond, ret) 
            if cond=true then
                Response.write ret
            else
                Response.write ""
            end if
        end function
        page = Request.QueryString("page")
        limit = 10

        if (trim(page) = "") or (isnull(page)) then
            page = 1
        end if
        offset = (Clng(page) * Clng(limit)) - Clng(limit)
        strSQL = "SELECT COUNT(id_nguoi_dung) AS count FROM nguoi_dung"
        connDB.Open()
        Set CountResult = connDB.execute(strSQL)
        totalRows = CLng(CountResult("count"))
        Set CountResult = Nothing
        pages = Ceil(totalRows/limit)
    %>
    <div class="navbar">
       <!-- #include file="navbar.asp" -->
    </div>
    <div class="noidung">
        <div class="sidebar">
            <!-- #include file="sidebar.asp" -->
        </div>
        <div class="content">
            <div class="container">
                <div class="row">
                    <div class="col">
                    </div>
                    <div class="col">
                    <H2>DANH SÁCH NGƯỜI DÙNG</H2>
                    </div>
                    <div class="col">
                    <a type="button" class="btn btn-primary" href="admin_themusers.asp?id_admin=<%=id_nguoi_dung%>" >Thêm tài khoản</a>
                    </div>
                </div>
            </div>
            <%
                strSQL =  "SELECT * FROM nguoi_dung ORDER BY id_nguoi_dung OFFSET ? ROWS FETCH NEXT ? ROWS ONLY"
                Set cmdPrep = Server.CreateObject("ADODB.Command")
                cmdPrep.ActiveConnection = connDB
                cmdPrep.CommandType = 1
                cmdPrep.Prepared = True
                cmdPrep.CommandText = strSQL
                cmdPrep.Parameters.Append cmdPrep.CreateParameter("offset", 3, 1, , offset)
                cmdPrep.Parameters.Append cmdPrep.CreateParameter("limit", 3, 1, , limit)
                Set Result = cmdPrep.Execute
            %>
            <div class="dsach-truyen" style="width: 90%;">
                <table class="table table-striped">
                    <thead class="thead-dark">
                        <tr>
                        <th scope="col" class="text-center">STT</th>
                        <th scope="col" class="text-center">Họ tên</th>
                        <th scope="col" class="text-center">Email</th>
                        <th scope="col" class="text-center">Mật khẩu</th>
                        <th scope="col" class="text-center">Vai trò</th>
                        <th scope="col" class="text-center">Quản lí bình luận</th>
                        <th scope="col" class="text-center">Thao tác</th>
                        </tr>
                    </thead>
                    <tbody>           
                        <%
                            do while not Result.EOF
                        %>             
                        <tr>
                            <th scope="row" class="text-center"><%=Result("id_nguoi_dung")%></th>
                            <td class="text-center"><%=Result("ho_ten")%></td>
                            <td class="text-center"><%=Result("email")%></td>
                            <td class="text-center"><%=Result("mat_khau")%></td>
                            <%
                                Dim vaitro
                                vaitro = Result("vai_tro")
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
                            <td class="text-center">
                                <a type="button" class="btn btn-primary" href = "#">Xem bình luận</a>
                            </td>
                            <td class="text-center">
                                <a type="button" class="btn btn-primary" href = "admin_qli_nguoi_dung.asp?id_nguoi_dung=<%= Result("id_nguoi_dung") %>">Chi tiết</a>
                                <a type="button" class="btn btn-danger" href = "/check/admin_deleteuser.asp?id_nguoi_dung=<%= Result("id_nguoi_dung") %>">Xóa</a>
                            </td> 
                        </tr>
                    </tbody>
                    <%
                        Result.MoveNext
                        loop
                        Result.Close
                        Set Result = Nothing
                        Set conn = Nothing
                    %>
                </table>
            </div>
            <nav aria-label="Page Navigation">
                <ul class="pagination pagination-sm">
                    <% if (pages>1) then 
                        for i= 1 to pages
                    %>
                        <li class="page-item <%=checkPage(Clng(i)=Clng(page),"active")%>"><a class="page-link" href="index.asp?page=<%=i%>"><%=i%></a></li>
                    <%
                        next
                        end if
                    %>
                </ul>
            </nav>
        </div>
    </div>
    <div class="footer">
      <!-- #include file="footer.asp" -->
    </div>
    <% If Request.QueryString("successthem") = "1" Then %>
        <script>
            Toastify({
                text: "Thêm người dùng thành công",
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
    <% If Request.QueryString("successedit") = "1" Then %>
        <script>
            Toastify({
                text: "Sửa người dùng thành công",
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
    <% If Request.QueryString("successxoa") = "1" Then %>
        <script>
            Toastify({
                text: "Xóa người dùng thành công!",
                duration: 3000,
                newWindow: true,
                close: true,
                gravity: "top",
                position: "right",
                backgroundColor: "linear-gradient(to right, #FF7171, #FFCE54)",
                className: "toastify-error",
                stopOnFocus: true,
            }).showToast();
        </script>
    <% End If %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>