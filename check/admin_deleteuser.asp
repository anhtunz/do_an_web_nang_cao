<%
    id_nguoi_dung = Request.QueryString("id_nguoi_dung")
    Dim strSQL
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=SQLOLEDB.1;Data Source=TUNZTUNZ\SQLEXPRESS;Database=Web_doc_truyen;User Id=sa;Password=123456"
    strSQL = "DELETE FROM nguoi_dung WHERE id_nguoi_dung = "&id_nguoi_dung
     conn.Execute strSQL
    conn.Close
    Set conn = Nothing
    Response.Write("<script>")
    Response.Write("window.location.href = '/Quanlythongtin/Quantrivien/qli_nguoi_dung.asp?id_nguoi_dung=" & ID_Nguoi_dung & "&successxoa=1';")  ' Thêm dấu nháy đơn đóng vào cuối dòng này
    Response.Write("</script>")
%>