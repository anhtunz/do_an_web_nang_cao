<%
    Dim id_truyen,id_binh_luan
    Dim id_chuong
    id_truyen = Request.QueryString("id_truyen")
    id_binh_luan = Request.QueryString("id_binh_luan")
    id_chuong = Request.QueryString("id_chuong")

    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=SQLOLEDB.1;Data Source=VIET\MSSQLSERVER01;Database=Web_doc_truyen;User Id=sa;Password=123456;"

    If id_binh_luan <> "" Then
        sql = "DELETE FROM binh_luan WHERE id_binh_luan = " & id_binh_luan
        conn.Execute sql
    End If
    conn.Close
    Set conn = Nothing

    If id_chuong <> "" Then
        Response.Redirect "ChuongTruyen.asp?id_chuong=" & id_chuong & "&id_truyen=" & id_truyen 
    Else
        Response.Redirect "TrangTruyen.asp?id_truyen=" & id_truyen
    End If
%>
