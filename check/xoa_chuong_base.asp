<!-- #include file="connect.asp" -->

<%
    Response.ContentType = "text/html"
    Response.AddHeader "Content-Type", "text/html;charset=UTF-8"
    Response.CodePage = 65001
    Response.CharSet = "UTF-8"
    Dim id_chuong,id_truyen
    id_chuong = Request.QueryString("id_chuong")
    id_truyen = Request.QueryString("id_truyen")
    Dim strSQL
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=SQLOLEDB.1;Data Source=TUNZTUNZ\SQLEXPRESS;Database=Web_doc_truyen;User Id=sa;Password=123456"
    strSQL = "DELETE FROM chuong WHERE id_chuong = "&id_chuong
    conn.Execute strSQL
    conn.Close
    Set conn = Nothing
    Response.Write("<script>")
    Response.Write("window.location.href = '/Quanlythongtin/qli_chuong.asp?id_truyen=" & id_truyen & "&successxoa=1';")
    Response.Write("</script>")
%>