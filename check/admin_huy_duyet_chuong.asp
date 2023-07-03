<%
    id_nguoi_dung = Request.QueryString("id_nguoi_dung")
    id_truyen = Request.QueryString("id_truyen")
    id_chuong = Request.QueryString("id_chuong")
    page = Request.QueryString("page")
    Dim strSQL
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=SQLOLEDB.1;Data Source=VIET\MSSQLSERVER01;Database=Web_doc_truyen;User Id=sa;Password=123456"
    strSQL = "DELETE FROM chuong WHERE id_chuong = "& id_chuong
    conn.Execute strSQL
    conn.Close
    Set conn = Nothing
    Response.Write("<script>")
    If page = 0 Then
        Response.Redirect("/Quanlythongtin/Quantrivien/admin_duyet_chuong.asp?id_truyen=" & id_truyen & "&id_nguoi_dung=" & id_nguoi_dung & "&id_chuong=" & id_chuong & "&xoachuong=1")
    Else
        Response.Redirect("/Quanlythongtin/Quantrivien/admin_duyet_chuong.asp?id_truyen=" & id_truyen & "&id_nguoi_dung=" & id_nguoi_dung & "&id_chuong=" & id_chuong & "&page=" & page & "&xoachuong=1")
    End If
    Response.Write("</script>")
%>