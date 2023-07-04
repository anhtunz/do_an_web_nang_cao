<%@LANGUAGE="VBSCRIPT" CODEPAGE = "65001"%>
<%
    Response.CodePage = 65001
    Response.CharSet = "UTF-8"
%>
<%
    ID_COMIC = Request.Form("ID_COMIC")
    ID_USER = Request.Form("ID_USER")
    page = Request.Form("page")
    TenTruyen = Request.Form("TenTruyen")
    SoChuong = Request.Form("SoChuong")
    NamXuatBan = Request.Form("NamXB")
    AnhTruyen = Request.Form("Anhtruyen")
    TinhTrang = Request.Form("flexRadioDefault")
    TheLoai = Request.Form("flexRadioDefault1")
    MoTa = Request.Form("gioithieu")
    TenTruyen = Replace(Request.Form("TenTruyen"), "'", "''")
    SoChuong = Replace(Request.Form("SoChuong"), "'", "''")
    NamXuatBan = Replace(Request.Form("NamXB"), "'", "''")
    AnhTruyen = Replace(Request.Form("Anhtruyen"), "'", "''")
    TinhTrang = Replace(Request.Form("flexRadioDefault"), "'", "''")
    TheLoai = Replace(Request.Form("flexRadioDefault1"), "'", "''")
    MoTa = Replace(Request.Form("gioithieu"), "'", "''")
    Dim strSQL
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=SQLOLEDB.1;Data Source=TUNZTUNZ\SQLEXPRESS;Database=Web_doc_truyen;User Id=sa;Password=123456"
    strSQL = "UPDATE truyen SET ten_truyen=N'" & TenTruyen & "', id_the_loai='" & TheLoai & "', so_chuong='" & SoChuong & "', nam_xb='" & NamXuatBan & "', anh_truyen='" & AnhTruyen & "', tinh_trang='" & TinhTrang & "', mo_ta_ndung=N'" & MoTa & "' WHERE id_truyen='" & ID_COMIC & "'"
    conn.Execute strSQL
    conn.Close
    Set conn = Nothing
    Response.Write("<script>")
    Response.Write("window.location.href = '/Quanlythongtin/qli_truyen.asp?id_nguoi_dung=" & ID_USER & "&page="& page &"&successedit=1';")
    Response.Write("</script>")

%>
