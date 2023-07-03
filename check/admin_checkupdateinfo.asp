<!-- #include file="connect.asp" -->
<%
    Response.ContentType = "text/html"
    Response.AddHeader "Content-Type", "text/html;charset=UTF-8"
    Response.CodePage = 65001
    Response.CharSet = "UTF-8"
%>
<%
    Dim id_nguoi_dung
    id_nguoi_dung = Request.Form("ID_Nguoi_dung")
    Dim hoten
    hoten = Request.Form("hoten")
    Dim email
    email = Request.Form("email")
    Dim matkhau
    matkhau = Request.Form("matkhau")
    Dim vaitro
    vaitro = Request.Form("vaitro")
    Dim nghedanh
    nghedanh = Request.Form("nghedanh")
    Dim ngaysinh
    ngaysinh = Request.Form("ngaysinh")
    Dim gioitinh
    gioitinh = Request.Form("gioitinh")
    Dim gioithieu
    gioithieu = Request.Form("gioithieu")
    Dim strSQL
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=SQLOLEDB.1;Data Source=VIET\MSSQLSERVER01;Database=Web_doc_truyen;User Id=sa;Password=123456"
    strSQL = "UPDATE nguoi_dung SET ho_ten=N'" & hoten & "', email='" & email & "', mat_khau='" & matkhau & "',vai_tro='" & vaitro & "', nghe_danh=N'" & nghedanh & "', ngay_sinh='" & ngaysinh & "', gioi_tinh=N'" & gioitinh & "', gioi_thieu=N'" & gioithieu & "' WHERE id_nguoi_dung='" & ID_Nguoi_dung & "'"
    conn.Execute strSQL
    conn.Close
    Set conn = Nothing
    Response.Write("<script>")
    Response.Write("window.location.href = '/Quanlythongtin/Quantrivien/qli_nguoi_dung.asp?id_nguoi_dung=" & ID_Nguoi_dung & "&successedit=1';")  ' Thêm dấu nháy đơn đóng vào cuối dòng này
    Response.Write("</script>")
%>
