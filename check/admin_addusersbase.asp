<!-- #include file="connect.asp" -->
<%
    Response.ContentType = "text/html"
    Response.AddHeader "Content-Type", "text/html;charset=UTF-8"
    Response.CodePage = 65001
    Response.CharSet = "UTF-8"
    Dim hoten,email,matkhau,role,id
        id=Request.Form("id")
        hoten=Request.Form("hoten")
        email = Request.Form("email")
        matkhau = Request.Form("matkhau")
        role= Request.Form("role")
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=SQLOLEDB.1;Data Source=VIET\MSSQLSERVER01;Database=Web_doc_truyen;User Id=sa;Password=123456;"
    sql = "INSERT INTO nguoi_dung (ho_ten,email,mat_khau,vai_tro) VALUES (N'" & hoten & "','" & email & "', '" & matkhau & "', '" & role & "')"
    Set rs = conn.Execute(sql)
    Response.Write("<script>")
    Response.Write("window.location.href = '/Quanlythongtin/Quantrivien/qli_nguoi_dung.asp?id_nguoi_dung=" & id & "&successthem=1';")  ' Thêm dấu nháy đơn đóng vào cuối dòng này
    Response.Write("</script>")
%>
