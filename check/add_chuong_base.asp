<!-- #include file="connect.asp" -->
<%
    Response.CodePage = 65001
    Response.CharSet = "UTF-8"
%>
<%
    Dim idtruyen, ten_chuong, noidungchuong
    idtruyen = Request.Form("id_truyen")
    ten_chuong = Request.Form("tenchuong")
    noidungchuong = Request.Form("noidungchuong")
    Dim strSQL
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=SQLOLEDB.1;Data Source=TUNZTUNZ\SQLEXPRESS;Database=Web_doc_truyen;User Id=sa;Password=123456"
    strSQL = "INSERT INTO chuong (ten_chuong, ndung_chuong, id_truyen,duyet) VALUES (N'" & ten_chuong & "',N'" & noidungchuong & "', '" & idtruyen & "',0 )"
    conn.Execute strSQL
    conn.Close
    Set conn = Nothing
    Response.Write("<script>")
    Response.Write("window.location.href = '/Quanlythongtin/qli_chuong.asp?id_truyen=" & idtruyen & "&successthem=1';")
    Response.Write("</script>")
%>