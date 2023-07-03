<!-- #include file="connect.asp" -->
<%
    Dim id_nguoi_dung, id_truyen,id_chuong, page
    page = Request.QueryString("page")
    id_nguoi_dung = Request.QueryString("id_nguoi_dung")
    id_truyen = Request.QueryString("id_truyen")
    id_chuong = Request.QueryString("id_chuong")

    If Request.ServerVariables("REQUEST_METHOD") = "POST" Then
        ' Dữ liệu được gửi từ form
        id_nguoi_dung = Request.Form("id_nguoi_dung")
        id_truyen = Request.Form("id_truyen")
        id_chuong = Request.Form("id_chuong")
        page = Request.Form("page")
    End If
    Dim strSQL
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=SQLOLEDB.1;Data Source=TUNZTUNZ\SQLEXPRESS;Database=Web_doc_truyen;User Id=sa;Password=123456"
    strSQL = "UPDATE chuong SET duyet = 1 WHERE id_chuong = " & id_chuong
    conn.Execute strSQL
    conn.Close
    Set conn = Nothing
    Response.Write("<script>")
    If page = 0 Then
        Response.Write("window.location.href = '/Quanlythongtin/Quantrivien/admin_duyet_chuong.asp?id_truyen=" & id_truyen & "&id_nguoi_dung=" & id_nguoi_dung & "&duyetchuong=1';")    
    Else
        Response.Write("window.location.href = '/Quanlythongtin/Quantrivien/admin_duyet_chuong.asp?id_truyen=" & id_truyen & "&id_nguoi_dung=" & id_nguoi_dung & "&page=" & page & "&duyetchuong=1';")    
    End If
    Response.Write("</script>")
%>