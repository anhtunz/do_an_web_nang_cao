<!-- #include file="connect.asp" -->
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Web đọc truyện</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">

</head>
<style>
    .context {
        margin-top: 50px;
        border: 1px solid #a5a2a2d1;
        padding: 20px;
        max-width: 1000px;
        margin: 0 auto;
    }

    .title {
        border-bottom: 1px solid #ccc;
        margin-bottom: 10px;
        padding-bottom: 10px;
        font-size: 18px;
        font-weight: bold;
        text-align: left;

    }
    </style>

<body>
    <!-- #include file="navbar.asp" -->
    <div class="context">
        <div class="breadcrumb">
            <a href="index.asp">Trang Chủ</a> /
        </div>
        <div class="title"></div> 
        <div id= "ndungReview">
            <%
                Dim connStr
                connStr = "Provider=SQLOLEDB.1;Data Source=VIET\MSSQLSERVER01;Database=Web_doc_truyen;User Id=sa;Password=123456;"
                Dim conn
                Set conn = Server.CreateObject("ADODB.Connection")
                conn.Open connStr
                Dim id_the_loai
                id_the_loai = Request.QueryString("id_the_loai")
                Dim rs
                Set rs = Server.CreateObject("ADODB.Recordset")
                rs.Open "SELECT * FROM truyen WHERE id_the_loai = " & id_the_loai & " AND duyet='True'", conn
                While Not rs.EOF
            %>
            <li class="list-group-item">
                <div>
                    <h4><%= rs("ten_truyen") %></h4>
                    <% 
                            Dim rsNguoiDung
                            Set rsNguoiDung = Server.CreateObject("ADODB.Recordset")
                            rsNguoiDung.Open "SELECT ho_ten FROM nguoi_dung WHERE id_nguoi_dung = " & rs("id_nguoi_dung"), conn
                            If Not rsNguoiDung.EOF Then
                                %>
                                <p><b>Tác giả:</b> <%= rsNguoiDung("ho_ten") %></p>
                                <%
                            End If
                            rsNguoiDung.Close
                            Set rsNguoiDung = Nothing
                        %>
                        <% 
                            Dim nam_xb
                            nam_xb = rs("nam_xb")
                            If Not IsNull(nam_xb) Then
                                Dim formattedNamXB
                                formattedNamXB = FormatDateTime(nam_xb, 2) 
                                %>
                                <p><b>Năm xuất bản:</b> <%= formattedNamXB %></p>
                                <%
                            End If
                        %>
                    <p><b>Số chương hiện tại:</b> <%= rs("so_chuong") %></p>
                    <div style="text-align: center;">
                        <img src="<%= rs("anh_truyen") %>" alt="Ảnh truyện" width="500" height="600">
                    </div>
                    <br>
                    <p style="text-align: justify;"><%= rs("mo_ta_ndung") %></p>
                </div>
            </li>
                <%
                    rs.MoveNext
                    Wend
                    rs.Close
                    Set rs = Nothing
                    conn.Close
                    Set conn = Nothing
                %>
        </div>  
    </div>
    <!-- #include file="footer.asp" -->
</body>
</html>
   