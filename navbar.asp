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
                            <a class="nav-link active" aria-current="page" href="index.asp" style="color: black">Trang chủ</a>
                        </li>
                        
                        <li class="nav-item">
                            <a class="nav-link" href="danh_sach_truyen.asp" style="color: black" >Danh sách truyện</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                                data-bs-toggle="dropdown" aria-expanded="false" style="color: black">
                                <i class="bi bi-tags"></i>Thể loại
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
                        <li class="nav-item" style="background-color:orange; border-radius: 5px;">
                            <a class="nav-link" style="color:black;" href="/Quanlythongtin/them_truyen.asp">Đăng truyện</a>
                        </li>
                    </ul>
                    <form class="d-flex m20" method="get" action="/find.asp">
                        <input class="form-control me-2" type="search" placeholder="Tìm truyện, tác giả..." aria-label="Search" name ="searchInput">
                        <button class="btn btn-outline-success" type="submit"><i class="bi bi-search"></i></button>
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
                    <span class="navbar-text"> Xin chào                
                        <a href="/Quanlythongtin/info.asp?id_nguoi_dung=<%= rs("id_nguoi_dung") %>" style="color: blue;"><b><%= rs("nghe_danh") %></b></a>
                    </span>
                
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
