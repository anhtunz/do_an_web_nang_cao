<!-- #include file="connect.asp" -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý truyện</title>
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
        margin-top: 8px;
        
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
        connDB.Open()
    %>
    <div class="navbar">
        <!-- #include file="navbar.asp" -->
    </div>
    <div class="noidung">
        <div class="sidebar">
            <!-- #include file="sidebar.asp" -->
        </div>
        <div class="content">
            <%
                Dim strSQLVaiTro
                strSQLVaiTro = "SELECT vai_tro FROM nguoi_dung WHERE id_nguoi_dung = " & id_nguoi_dung
                Set rsVaiTro = connDB.Execute(strSQLVaiTro)
                vai_tro = rsVaiTro("vai_tro")
                rsVaiTro.Close
                Dim strSQL
                If vai_tro = 1 Then
                    strSQL = "SELECT * FROM truyen"
                ElseIf vai_tro = 2 Then
                    strSQL = "SELECT * FROM truyen WHERE id_nguoi_dung = " & id_nguoi_dung
                End If
                If vai_tro = 1 Or vai_tro = 2 Then
                strSQL = strSQL & " ORDER BY id_truyen OFFSET ? ROWS FETCH NEXT ? ROWS ONLY"
                Set cmdPrep = Server.CreateObject("ADODB.Command")
                cmdPrep.ActiveConnection = connDB
                cmdPrep.CommandType = 1
                cmdPrep.Prepared = True
                cmdPrep.CommandText = strSQL
                cmdPrep.Parameters.Append cmdPrep.CreateParameter("offset", 3, 1, , offset)
                cmdPrep.Parameters.Append cmdPrep.CreateParameter("limit", 3, 1, , limit)
                Set Result = cmdPrep.Execute
                Dim totalRows
                Dim strSQLCount
                If vai_tro = 1 Then
                    strSQLCount = "SELECT COUNT(id_truyen) AS count FROM truyen"
                ElseIf vai_tro = 2 Or vai_tro = 3 Then
                    strSQLCount = "SELECT COUNT(id_truyen) AS count FROM truyen WHERE id_nguoi_dung = " & id_nguoi_dung
                End If
                Set rsCount = connDB.Execute(strSQLCount)
                totalRows = rsCount("count")
                rsCount.Close
                Dim pages
                pages = Ceil(totalRows / limit)
                
            %>
            <div class="dan">
                <h2>DANH SÁCH TRUYỆN</h2>
            </div>
            <div class="dsach-truyen" style="width: 90%;">
                <table class="table table-striped">
                    <thead class="thead-dark">
                        <tr>
                        <th scope="col" class="text-center">STT</th>
                        <th scope="col" class="text-center">Tên truyện</th>
                        <th scope="col" class="text-center">Số chương</th>
                        <th scope="col" class="text-center">Nội dung</th>
                        <th scope="col" class="text-center">Duyệt</th>
                        <th scope="col" class="text-center">Xem</th>
                        <th scope="col" class="text-center">Thao tác</th>
                        </tr>
                    </thead>
                    <tbody>      
                        <%
                            do while not Result.EOF
                        %> 
                        <tr>
                            <th scope="row" class="text-center"><%=Result("id_truyen")%></th>
                            <td class="text-center"><%=Result("ten_truyen")%></td>
                            <td class="text-center"><%=Result("so_chuong")%></td>
                            <td class="text-center"><%=Result("mo_ta_ndung")%></td>
                            <td class="text-center">
                                <% if Result("duyet") = "True" then %>
                                    Đã duyệt
                                <% else %>
                                    Chưa duyệt
                                <% end if %>
                            </td>
                            <td class="text-center">
                                <button type="button" class="btn btn-primary" onclick = "redirectToTruyenDetail(<%=Result("id_truyen")%>)">Xem chương</button>
                            </td>
                            <td class="text-center">
                                <button type="button" class="btn btn-primary" onclick = "suaTruyen(<%=Result("id_truyen")%>,<%=page%>,<%=id_nguoi_dung%>)"> Sửa</button>
                                <button type="button" class="btn btn-danger" onclick = "XoaTruyen(<%=Result("id_truyen")%>, <%=page%>,<%=id_nguoi_dung%>)">Xóa</button>
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
                    <% 
                        If (vai_tro = 1 Or vai_tro = 2) And pages > 1 Then 
                        For i = 1 To pages
                    %>
                    <li class="page-item <%=checkPage(CLng(i) = CLng(page), "active")%>">
                        <a class="page-link" href="qli_truyen.asp?id_nguoi_dung=<%=id_nguoi_dung%>&page=<%=i%>"><%=i%></a>
                    </li>
                    <% 
                        Next
                        End If 
                        End If
                    %>
                </ul>
            </nav>
            <%
            If vai_tro = 3 Then
            %>
                <div>Bạn không có quyền xem </div>
            <%
                End If
            %>
        </div>
    </div>
    <div class="footer">
      <!-- #include file="footer.asp" -->
    </div>
        <script>
          function redirectToTruyenDetail(id) {
            window.location.href = "qli_chuong.asp?id_truyen=" + id;
          }
          function suaTruyen(id,page,id_nguoi_dung) {
            // Tạo URL đích và chuyển hướng sang trang sua_truyen.asp
            var url = "sua_truyen.asp?id_truyen=" + id + "&page=" + page + "&id_nguoi_dung=" + id_nguoi_dung;
            window.location.href = url;
          }
          function XoaTruyen(id, page,id_nguoi_dung) {
            // Tạo URL đích và chuyển hướng sang trang sua_truyen.asp
            var url = "/check/xoa_truyen.asp?id_truyen=" + id + "&page=" + page + "&id_nguoi_dung=" + id_nguoi_dung;
            window.location.href = url;
          }
        </script>
        <% If Request.QueryString("successthem") = "1" Then %>
        <script>
            Toastify({
                text: "Thêm truyện thành công",
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
                text: "Sửa truyện thành công",
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
                text: "Xóa truyện thành công!",
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