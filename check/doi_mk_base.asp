<!-- #include file="connect.asp" -->

<%
    Dim id_nguoi_dung, matkhaucu,matkhaumoi,xacnhanmatkhaumoi
    id_nguoi_dung = Request.Form("ID_Nguoi_dung")
    matkhaucu = Request.Form("matkhaucu")
    matkhaumoi = Request.Form("matkhaumoi")
    xacnhanmatkhaumoi = Request.Form("xacnhanmatkhaumoi")
    Dim strSQL
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=SQLOLEDB.1;Data Source=VIET\MSSQLSERVER01;Database=Web_doc_truyen;User Id=sa;Password=123456"
    strSQL = "UPDATE nguoi_dung SET mat_khau=N'" & matkhaumoi & "'WHERE id_nguoi_dung='" & id_nguoi_dung & "'"
    conn.Execute strSQL
    conn.Close
    Set conn = Nothing
    Response.Write("<script>")
    Response.Write("window.location.href = '/Quanlythongtin/info.asp?id_nguoi_dung=" & id_nguoi_dung & "&doimatkhau=1';")
    Response.Write("</script>")
%>