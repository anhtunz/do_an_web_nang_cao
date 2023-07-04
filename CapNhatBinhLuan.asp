<%
    Response.ContentType = "text/html"
    Response.AddHeader "Content-Type", "text/html;charset=UTF-8"
    Response.CodePage = 65001
    Response.CharSet = "UTF-8"
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=SQLOLEDB.1;Data Source=TUNZTUNZ\SQLEXPRESS;Database=Web_doc_truyen;User Id=sa;Password=123456;"
    If Request.Form("commentId") <> "" And Request.Form("commentText") <> "" Then
        Dim commentId, commentText
        commentId = Request.Form("commentId")
        commentText = Request.Form("commentText")
        conn.Execute("UPDATE binh_luan SET ndung_binh_luan = N'" & commentText & "' WHERE id_binh_luan = " & commentId)
        Response.Write "success"
    End If
    conn.Close
    Set conn = Nothing
%>
