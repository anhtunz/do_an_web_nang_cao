<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    
</head>
<style>
    /* Thanh nav-bar */
    .nav-bar{
        justify-content:center;
        height: 50px;
        background-color: rgb(87, 234, 87);
        margin-bottom: 30px;
    }
    .m20{
        margin-right: 20px;
    }
    /* End nav-bar */
    .nav-bar img {
        display: block;
        max-width: 3.5%;
        max-height: 3.5%;
        margin: auto;
    }

</style>
<%
    Dim email
    email = Session("email")
%>

<body>
    <div class="nav-bar">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <img src="/Anh/logo1.png" style="width:100%" class="img-thumbnail" href="index.asp" alt="...">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="index.asp">Trang chủ</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/Quanlythongtin/them_truyen.asp">Đăng truyện</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="danh_sach_truyen.asp">Danh sách truyện</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                                data-bs-toggle="dropdown" aria-expanded="false">
                                Thể loại
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <%
                                    Set conn = Server.CreateObject("ADODB.Connection")
                                    conn.Open "Provider=SQLOLEDB.1;Data Source=TUNZTUNZ\SQLEXPRESS;Database=Web_doc_truyen;User Id=sa;Password=123456"
                                    sql = "SELECT *  FROM the_loai "
                                    Set rs = conn.Execute(sql)
                                    Do While Not rs.EOF
                                    
                                %>
                                    <li><a class="dropdown-item" href="the_loai_truyen.asp?id_the_loai=<%=rs("id_the_loai")%>"><%=rs("ten_the_loai")%></a></li>
                                <%
                                    rs.MoveNext
                                    Loop                                
                                %>   
                            </ul>
                            <%
                                rs.Close
                                conn.Close
                                Set rs = Nothing
                                Set conn = Nothing 
                            %>
                        </li>
                    </ul>
                    <form class="d-flex m20" method="get" action="/find.asp">
                        <input class="form-control me-2" type="search" placeholder="Tìm truyện, tác giả..." aria-label="Search" name ="searchInput">
                        <button class="btn btn-outline-success" type="submit">Tìm</button>
                    </form>
                    <% 
                    searchInput = Request.QueryString("searchInput")
                    %>
                <div>
                <%
                If (NOT isnull(Session("email"))) AND (TRIM(Session("email"))<>"") Then
                Set conn = Server.CreateObject("ADODB.Connection")
                conn.Open "Provider=SQLOLEDB.1;Data Source=TUNZTUNZ\SQLEXPRESS;Database=Web_doc_truyen;User Id=sa;Password=123456"
                sql = "SELECT * FROM nguoi_dung WHERE email='" & email & "'"
                Set rs = conn.Execute(sql)
                %>
                <span class="navbar-text">Xin chào <%= rs("nghe_danh")%>!</span>
                <a type="button"  href="logout.asp" class="btn btn-danger ms-3">Đăng xuất</a>
                <%                        
                Else
                %>                
                <a href="/login.asp" class="btn btn-primary">Đăng nhập</a>
                <%
                End If
                %>
            </div>
        </nav>
    </div>

    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    -->  
</body>
</html>