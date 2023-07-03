<%
    Response.ContentType = "text/html"
    Response.AddHeader "Content-Type", "text/html;charset=UTF-8"
    Response.CodePage = 65001
    Response.CharSet = "UTF-8"
    Dim id_truyen
    Dim ndung_binh_luan, id_nguoi_dung
    Dim id_chuong
    If Request.ServerVariables("REQUEST_METHOD") = "POST" Then
        ndung_binh_luan = Trim(Request.Form("comment"))
        id_nguoi_dung = Trim(Request.Form("idusername"))
        id_truyen = Trim(Request.Form("id_truyen"))
        id_chuong = Trim(Request.Form("id_chuong"))
        If ndung_binh_luan <> "" Then
            Dim conn
            Set conn = Server.CreateObject("ADODB.Connection")
            conn.Open "Provider=SQLOLEDB.1;Data Source=VIET\MSSQLSERVER01;Database=Web_doc_truyen;User Id=sa;Password=123456;"
            Dim sql
            sql = "INSERT INTO binh_luan (id_truyen, id_nguoi_dung, ndung_binh_luan) VALUES ('" & id_truyen & "','" & id_nguoi_dung & "', N'" & ndung_binh_luan & "')"
            conn.Execute sql
            conn.Close
            Set conn = Nothing
            If id_chuong <> "" Then
                Response.Redirect "ChuongTruyen.asp?id_chuong=" & id_chuong & "&id_truyen=" & id_truyen 
            Else
                Response.Redirect "TrangTruyen.asp?id_truyen=" & id_truyen
            End If
        End If
    End If
%>
