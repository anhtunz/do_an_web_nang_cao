<%
    Response.ContentType = "text/html"
    Response.AddHeader "Content-Type", "text/html;charset=UTF-8"
    Response.CodePage = 65001
    Response.CharSet = "UTF-8"
    Dim isLoggedIn
    isLoggedIn = False
    If Not IsEmpty(Session("email")) Then
        email = Session("email")
        isLoggedIn = True
    End If
    If isLoggedIn Then
        Set conn = Server.CreateObject("ADODB.Connection")
        conn.Open "Provider=SQLOLEDB.1;Data Source=VIET\MSSQLSERVER01;Database=Web_doc_truyen;User Id=sa;Password=123456"
        sql = "SELECT * FROM nguoi_dung WHERE email = '" & email & "'"
        Set rs = conn.Execute(sql)
%>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid" style="margin-bottom: 10px;">
        <a class="navbar-brand" href="/index.asp">Trang chủ</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent" style="float: right;margin-left: 600px;">                
            <form class="d-flex" role="search">
                <span class="navbar-text" style="margin-right: 650px;">Xin chào <%= rs("nghe_danh") %>!</span>
                 <a href="/logout.asp" class="btn btn-outline-primary">Đăng xuất</a>
            </form>
        </div>
    </div>
</nav>
<%
    rs.Close
    conn.Close
    Set rs = Nothing
    Set conn = Nothing
    Else
    Response.Redirect "/login.asp"
    End If
%>
