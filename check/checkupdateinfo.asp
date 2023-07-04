<!-- #include file="connect.asp" -->
<%
    Response.ContentType = "text/html"
    Response.AddHeader "Content-Type", "text/html;charset=UTF-8"
    Response.CodePage = 65001
    Response.CharSet = "UTF-8"
%>
<%
    Dim ID_Nguoi_dung
    ID_Nguoi_dung = Request.Form("ID_Nguoi_dung")
    Dim hoten
    hoten = Request.Form("hoten")
    Dim ngaysinh
    ngaysinh = Request.Form("ngaysinh")
    Dim nghedanh
    nghedanh = Request.Form("nghedanh")
    Dim gioitinh
    gioitinh = Request.Form("gioitinh")
    Dim gioithieu
    gioithieu = Request.Form("gioithieu")
    Dim strSQL
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=SQLOLEDB.1;Data Source=TUNZTUNZ\SQLEXPRESS;Database=Web_doc_truyen;User Id=sa;Password=123456"
    strSQL = "UPDATE nguoi_dung SET ho_ten=N'" & hoten & "', ngay_sinh='" & ngaysinh & "', nghe_danh=N'" & nghedanh & "', gioi_tinh=N'" & gioitinh & "', gioi_thieu=N'" & gioithieu & "' WHERE id_nguoi_dung='" & ID_Nguoi_dung & "'"
    conn.Execute strSQL
    conn.Close
    Set conn = Nothing
    Response.Write("<script>")
    Response.Write(" window.location.href = '/Quanlythongtin/info.asp?id_nguoi_dung=" & ID_Nguoi_dung & "&suathongtin=1';") 
    Response.Write("</script>")
%>
