<!-- #include file="connect.asp" -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chương truyện</title>
    <link rel="icon" type="image/x-icon" href="/Anh/logo1.ico">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
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
        margin-bottom: 20px;
        padding-bottom: 10px;
        font-size: 18px;
        font-weight: bold;
        text-align: center;

    }
    .chapter {
        font-size: 20px;
        font-family: inherit;
        margin-bottom: 10px;
    }
    .dark-mode {
    background-color: #222;
    color: #fff;
    }

    .dark-mode button {
        background-color: #444;
        color: #fff;
    }
    #dark-mode-toggle {
        position: fixed;
        bottom: 20px;
        right: 20px;
    }
    .line-icon-btn {
    font-family: 'Material Symbols Outlined', sans-serif;
    font-size: 24px;
    vertical-align: middle;
    }

    .line-icon {
    font-size: 48px; 
    fill: currentColor;
    }

    .material-symbols-outlined {
    font-variation-settings:
    'FILL' 1,
    'wght' 400,
    'GRAD' 0,
    'opsz' 48
    }
</style>
</head>
<body>
    <!-- Phần navbar -->
        <!-- #include file="navbar.asp" -->
    
    <% 
        Dim id_chuong 
        id_chuong=Request.QueryString("id_chuong") 
        Dim conn 
        Set conn=Server.CreateObject("ADODB.Connection")
        conn.Open "Provider=SQLOLEDB.1;Data Source=TUNZTUNZ\SQLEXPRESS;Database=Web_doc_truyen;User Id=sa;Password=123456;"
    %>
    <% 
        Dim id_truyen
        id_truyen = Request.QueryString("id_truyen")
    %>
    <div class="context">
        <span id="dark-mode-toggle" class="material-symbols-outlined line-icon-btn" onclick="toggleDarkMode()">dark_mode</span>
        <script>
            function setTheme() {
                var isDarkMode = localStorage.getItem("darkMode") === "true";
                var body = document.body;
                body.classList.toggle("dark-mode", isDarkMode);
            }
            function toggleDarkMode() {
                var body = document.body;
                var isDarkMode = body.classList.toggle("dark-mode");
                localStorage.setItem("darkMode", isDarkMode);
                var darkModeToggle = document.getElementById("dark-mode-toggle");
                darkModeToggle.textContent = isDarkMode ? "light_mode" : "dark_mode";
            }
            setTheme();
        </script>
    
        <div class="breadcrumb">
            <a href="index.asp"><b> Trang chủ </b> <a>/
            <%
                If id_truyen <> "" And id_chuong <> "" Then
                    Dim strSQLTitle
                    strSQLTitle = "SELECT t.ten_truyen, c.ten_chuong, t.id_truyen FROM truyen AS t INNER JOIN chuong AS c ON t.id_truyen = c.id_truyen WHERE t.id_truyen = " & id_truyen & " AND c.id_chuong = " & id_chuong
                    
                    Set conn = Server.CreateObject("ADODB.Connection")
                    conn.Open "Provider=SQLOLEDB.1;Data Source=TUNZTUNZ\SQLEXPRESS;Database=Web_doc_truyen;User Id=sa;Password=123456;"
                    
                    Set rs = conn.Execute(strSQLTitle)
            
                    If Not rs.EOF Then
                        Dim ten_truyen
                        Dim ten_chuong
                        Dim trang_truyen_link
                        
                        Response.Cookies("id_chuong") = id_chuong
                        ten_truyen = rs("ten_truyen")
                        ten_chuong = rs("ten_chuong")
                        trang_truyen_link = "TrangTruyen.asp?id_truyen=" & rs("id_truyen") 
                        Response.Write "<a href=""" & trang_truyen_link & """>" &ten_truyen & "</a>/" 
                        Response.Write " " & ten_chuong 
                    End If 
                    rs.Close 
                    conn.Close 
                    Set rs=Nothing 
                    Set conn=Nothing 
                End If 
            %>
        </div>
        <div class="title">
            <% 
                If id_truyen <> "" And id_chuong <> "" Then
                    Dim strSQLeee
                    strSQLeee = "SELECT t.ten_truyen, c.ten_chuong, c.chuong_thoi_gian " & _
                        "FROM truyen AS t " & _
                        "INNER JOIN chuong AS c ON t.id_truyen = c.id_truyen " & _
                        "WHERE t.id_truyen = " & id_truyen & " AND c.id_chuong = " & id_chuong
                    Set conn = Server.CreateObject("ADODB.Connection")
                    conn.Open "Provider=SQLOLEDB.1;Data Source=TUNZTUNZ\SQLEXPRESS;Database=Web_doc_truyen;User Id=sa;Password=123456;"
                    Set rs = conn.Execute(strSQLeee)
                    If Not rs.EOF Then
                        Dim chuong_thoi_gian
                        ten_truyen = rs("ten_truyen")
                        ten_chuong = rs("ten_chuong")
                        chuong_thoi_gian = rs("chuong_thoi_gian")
                        Response.Write "<h2>" & ten_truyen & "</h2>"
                        Response.Write "<div class='chapter'>" & ten_chuong & "</div>"
                        Response.Write "<div class='time'>" & chuong_thoi_gian & "</div>"
                    End If
                    rs.Close
                    conn.Close
                    Set rs = Nothing
                    Set conn = Nothing
                End If
            %>
        </div>
        <div id="buttom" style= "text-align: center;">
            <% If id_truyen <> "" Then
                Dim strSQLPrev
                strSQLPrev = "SELECT TOP 1 * FROM chuong WHERE id_truyen = " & id_truyen & " AND id_chuong< " & id_chuong & " ORDER BY id_chuong DESC" 
                Set conn=Server.CreateObject("ADODB.Connection")
                conn.Open "Provider=SQLOLEDB.1;Data Source=TUNZTUNZ\SQLEXPRESS;Database=Web_doc_truyen;User Id=sa;Password=123456;"
                Set rs=conn.Execute(strSQLPrev) 
                If Not rs.EOF Then 
            %>
                <button class="buttons">   <a href="ChuongTruyen.asp?id_chuong=<%= rs("id_chuong") %>&id_truyen=<%= id_truyen %>"> <b>< Trước </b> </a>  </button>
            <%
                End If
                End If
            %>   
            <button>
                <a href="TrangTruyen.asp?id_truyen=<%= id_truyen %>"><b> Mục lục </b></a>
            </button>
            <%
                If id_truyen <> "" Then
                    strSQLNext="SELECT TOP 1 * FROM chuong WHERE id_truyen = " & id_truyen & " AND id_chuong > " &id_chuong & " ORDER BY id_chuong ASC" 
                    Set conn=Server.CreateObject("ADODB.Connection")
                    conn.Open "Provider=SQLOLEDB.1;Data Source=TUNZTUNZ\SQLEXPRESS;Database=Web_doc_truyen;User Id=sa;Password=123456;"
                    Set rs=conn.Execute(strSQLNext) 
                    If Not rs.EOF Then 
            %>
            <button class="buttons">
                <a href="ChuongTruyen.asp?id_chuong=<%= rs("id_chuong") %>&id_truyen=<%= id_truyen %>"> <b> Sau ></b> </a>    
            </button>
            <%
                End If
                End If
            %>
                
        </div>
        <br> 
        <div id= "ndungchuong" style= "font-family: Palatino Linotype, 'sans-serif';font-size: 22px;line-height: 160%;text-align: justify;">
            <%
                Dim rs
                Set rs = Server.CreateObject("ADODB.Recordset")
                Dim strSQL
                strSQL = "SELECT * FROM chuong WHERE chuong.id_chuong =" &id_chuong 
                rs.Open strSQL, conn
                If Not rs.EOF Then
                    Do While Not rs.EOF
                        Response.Write  (rs("ndung_chuong") & "<br>")
                        rs.MoveNext
                    Loop
                End If
            %>
        </div>
        <br>  
        <div class="button" style= "text-align: center;">
            <%            
                If id_truyen <> "" Then
                    strSQLPrevi="SELECT TOP 1 * FROM chuong WHERE id_truyen = " & id_truyen & " AND id_chuong < " &id_chuong & " ORDER BY id_chuong DESC" 
                    Set conn=Server.CreateObject("ADODB.Connection")
                    conn.Open "Provider=SQLOLEDB.1;Data Source=TUNZTUNZ\SQLEXPRESS;Database=Web_doc_truyen;User Id=sa;Password=123456;"
                    Set rs=conn.Execute(strSQLPrevi) 
                    If Not rs.EOF Then 
            %>
                <button>   
                    <a href="ChuongTruyen.asp?id_chuong=<%= rs("id_chuong") %>&id_truyen=<%= id_truyen %>"><b> Chương Trước </b></a>  
                </button>
            <%
                    End If
                End If
            %>
                <button>
                    <a href="TrangTruyen.asp?id_truyen=<%= id_truyen %>"><b> Mục lục </b></a>
                </button>
            <%
                If id_truyen <> "" Then
                    strSQLNextChapter="SELECT TOP 1 * FROM chuong WHERE id_truyen = " & id_truyen& " AND id_chuong > " & id_chuong & " ORDER BY id_chuong ASC" 
                    Set conn=Server.CreateObject("ADODB.Connection")
                    conn.Open "Provider=SQLOLEDB.1;Data Source=TUNZTUNZ\SQLEXPRESS;Database=Web_doc_truyen;User Id=sa;Password=123456;"
                    Set rs=conn.Execute(strSQLNextChapter) 
                    If Not rs.EOF Then
            %>
            <button>
                <a href="ChuongTruyen.asp?id_chuong=<%= rs("id_chuong") %>&id_truyen=<%= id_truyen %>"><b> Chương Sau </b> </a>    
            </button>
    
            <%
                    End If
                End If
            %>
        </div>
        <div id="comment-section">
            <!-- #include file="XemBinhLuan.asp" -->
        </div>
    </div>
    <%
        Set rs = Nothing
    %>
  
  </div>
<!-- Phần footer -->
    <!-- #include file="footer.asp" -->

</body>
</html>
    
 


   