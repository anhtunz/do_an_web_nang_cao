<!-- #include file="connect.asp" -->
<%
    Dim id_nguoi_dung, id_truyen, page
    page = Request.QueryString("page")
    id_nguoi_dung = Request.QueryString("id_nguoi_dung")
    id_truyen = Request.QueryString("id_truyen")
    Dim strSQL
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=SQLOLEDB.1;Data Source=VIET\MSSQLSERVER01;Database=Web_doc_truyen;User Id=sa;Password=123456"
    strSQL = "UPDATE truyen SET duyet = 1 WHERE id_truyen = " & id_truyen
    conn.Execute strSQL
    conn.Close
    Set conn = Nothing
    Response.Write("<script>")
    Response.Write("window.location.href = '/Quanlythongtin/Quantrivien/admin_duyet_truyen.asp?id_nguoi_dung=" & id_nguoi_dung & "&page=" & page & "&duyettruyen=1';")
    Response.Write("</script>")
%>