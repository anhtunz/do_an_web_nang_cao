<%
    id_nguoi_dung = Request.QueryString("id_nguoi_dung")
    id_truyen = Request.QueryString("id_truyen")
    page = Request.QueryString("page")
    Dim strSQL
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=SQLOLEDB.1;Data Source=VIET\MSSQLSERVER01;Database=Web_doc_truyen;User Id=sa;Password=123456"
    strSQL = "DELETE FROM truyen WHERE id_truyen = "&id_truyen
    conn.Execute strSQL
    conn.Close
    Set conn = Nothing
    Response.Write("<script>")
    Response.Write("window.location.href = '/Quanlythongtin/qli_truyen.asp?id_nguoi_dung=" & id_nguoi_dung & "&page="& page &"&successxoa=1';")
    Response.Write("</script>")
%>