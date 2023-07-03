<!-- #include file="connect.asp" -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Web đọc truyện</title>
    <link rel="icon" type="image/x-icon" href="/Anh/logo1.ico">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">
</head>
<style>
  /* Phần content */
    .content{
        height: 2000px;
        width: 70%;
        margin: 0 auto;
        box-sizing: border-box; 
    } 
    /* Phần content trái */ 
    .content .content-trai{
        width: 70%;
        height: fit-content;
        float: left;
        display: flex;
        flex-direction: column;
    }
    .content .content-trai .main-col #story-detail {
      display: flex;
      width: 70%px;
      background: #fff;
      padding: 10px;
      border: 1px solid #ddd;
      margin-bottom: 15px;
    }
    .content .content-trai .main-col #story-detail .cot1 {
    width: 25%;
    flex-shrink: 0;
    margin-right: 20px;
  }
        .content .content-trai .main-col #story-detail .cot2 {
    width: 75%;
  }
    .content .content-trai .main-col #story-detail .title {
      text-transform: uppercase;
      color: #df1a0c;
      font-size: 22px;
      font-weight: 700;
      text-align: center;
    }

    .content .content-trai .main-col #story-detail .mota {
      text-align: center;
      margin-bottom: 15px;
    }

    /* End content trái */

    /* Phần content giữa */
    .content .content-giua{
        float: left;
        width: 5%;
        height: 100%;
    }
    /* Phần content phải */
    .content .content-phai{
        width: 25%;
        height: 100%;
        float: left;
        margin-top:8px;
    }
    .content .content-phai .tieude-content-trai1-child{
      background: #fff;
      margin-bottom: 12px;
      border-top: 1px solid #e5e6e9;
      border-bottom: 1px solid #e5e6e9;
    }
    .content .content-phai .tieude-content-trai1-child .header{
      padding: 8px 10px;
      border-bottom: 1px solid #e5e6e9;
      color: #2F52B2;
      font-size: 18px;
      line-height: 18px;
      font-weight: 600;
      letter-spacing: -2px;
      text-transform: uppercase;
    }

    /* End content phải */
</style>
<body style="background-color: #EEEEEE;">
  <!-- Phần navbar -->
    <!-- #include file="navbar.asp" -->
  <!-- Phần content -->

    <div class="content">
      <div class="content-trai">
      <div class="main-col"> 
      <div class="breadcrumb">
          <a href="index.asp">Trang Chủ</a> /
          <%
          id_truyen = Request.QueryString("id_truyen")
          Dim conn
          Set conn = Server.CreateObject("ADODB.Connection")
          conn.Open "Provider=SQLOLEDB.1;Data Source=VIET\MSSQLSERVER01;Database=Web_doc_truyen;User Id=sa;Password=123456;"
          Dim sql
          sql = "SELECT * FROM truyen WHERE id_truyen = '" & id_truyen & "'"
          Dim rs
          Set rs = conn.Execute(sql)
          
          If Not rs.EOF Then
              Dim ten_truyen
              ten_truyen = rs("ten_truyen")
              Response.Write "<a href='TrangTruyen.asp?id_truyen=" & id_truyen & "'>" & ten_truyen & "</a>"
          End If
          
          rs.Close
          Set rs = Nothing
          conn.Close
          Set conn = Nothing
          %>
      </div>
      <span>
          <div>
          <!-- Phần story -->
            <div id="story-detail" data-type="2">
              <%
                id_truyen = Request.QueryString("id_truyen")

                If id_truyen <> "" Then
                    Set conn = Server.CreateObject("ADODB.Connection")
                    conn.Open "Provider=SQLOLEDB.1;Data Source=VIET\MSSQLSERVER01;Database=Web_doc_truyen;User Id=sa;Password=123456;"
                    sql = "SELECT truyen.*, nguoi_dung.ho_ten, the_loai.ten_the_loai, chuong.id_chuong " & _
                          "FROM truyen " & _
                          "INNER JOIN nguoi_dung ON truyen.id_nguoi_dung = nguoi_dung.id_nguoi_dung " & _
                          "INNER JOIN the_loai ON truyen.id_the_loai = the_loai.id_the_loai " & _
                          "INNER JOIN chuong ON truyen.id_truyen = chuong.id_truyen " & _
                          "WHERE truyen.id_truyen = " & id_truyen

                    Set rs = conn.Execute(sql)
                    If Not rs.EOF Then
                        idchuong=rs("id_chuong")
                        anh_truyen = rs("anh_truyen")
                        ten_truyen= rs("ten_truyen")
                        mo_ta_ndung= rs("mo_ta_ndung")
                        ho_ten = rs("ho_ten")
                        the_loai= rs("ten_the_loai")
                        tinh_trang= rs("tinh_trang")
                        Dim tinhtrang1
                        If tinh_trang = "Full" Then
                            tinhtrang1 = "Đã hoàn thiện"
                        ElseIf tinh_trang = "NotFull" Then
                            tinhtrang1= "Đang cập nhật"
                        Else
                            ' Trường hợp không khớp với bất kỳ giá trị nào khác
                            Response.Write "Tình trạng không xác định"
                        End If
                        nam_xb = rs("nam_xb")
                        formattednam_xb = FormatDateTime(nam_xb, vbShortDate)
                %>
                        <div class="cot1">
                          <% If anh_truyen <> "" Then %>
                            <img src="<%= anh_truyen %>" itemprop="image" class="cover" width="180px" alt="<%= ten_truyen %>">
                          <% Else %>
                            <img src="/Quanlythongtin/upload/truyen<%=id_truyen%>.png" itemprop="image" class="cover" width="180px" alt="<%= ten_truyen %>">                          <% End If %>                            
                          <div class="infos">
                            <br>
                            <p class="tacgia" style="color: #016eb2">Tác giả: <%= ho_ten %></p>
                            <p class="theloai" style="color: #016eb2">Thể loại: <%= the_loai %></p>
                            <p class="tinhtrang">Trạng thái hiện tại: <%= tinhtrang1 %></p>
                            <p class="nxb">Ngày cập nhật: <%= formattednam_xb %></p>
                          </div>
                        </div>
                <%
                    Else
                        Response.Write "Không tìm thấy truyện với id_truyen: " & id_truyen
                    End If
                    rs.Close
                    Set rs = Nothing
                    conn.Close
                    Set conn = Nothing
                Else
                    Response.Write "Không nhận được id_truyen từ URL"
                End If
                %>
              <div class="mid" ></div>
              <div class="cot2" style="width: 610px;">
                <h1 itemprop="name" class="title"><%= ten_truyen %></h1>
                <div class="mota">
                  <a class="danhsachchuong" href="#chapters">
                    <button type="button" class="btn btn-primary">Danh sách chương</button></a>
                  <a id="doctruyen" href="ChuongTruyen.asp?id_truyen=<%= id_truyen %>&id_chuong=<%= idchuong %>">
                    <button type="button" class="btn btn-danger">Đọc truyện</button></a>
                  <hr>
                </div>
                <div class="description" itemprop="description" style="text-align: justify;">
                <%= mo_ta_ndung %>
                </div>
              </div>
            </div>
          <!-- Phần card -->
          <div class="card-box">
            <header>
              <h5><i class="fa-list-bullet"></i> 3 CHƯƠNG TRUYỆN MỚI NHẤT</h5>
            </header>
            <%
              Set conn = Server.CreateObject("ADODB.Connection")
              conn.Open "Provider=SQLOLEDB.1;Data Source=VIET\MSSQLSERVER01;Database=Web_doc_truyen;User Id=sa;Password=123456;"
              sql = "SELECT TOP 3 * FROM chuong WHERE chuong.id_truyen = " & id_truyen & " ORDER BY id_chuong DESC"
              Set rs = conn.Execute(sql)
              Do While Not rs.EOF
              %>
              <li class="newChapters">
                  <a href="ChuongTruyen.asp?id_truyen=<%= id_truyen %>&id_chuong=<%= rs("id_chuong")%>"  title="<%= rs("ten_chuong") %>"><%= rs("ten_chuong") %></a>              </li>
              <%
                rs.MoveNext
              Loop
              rs.Close
              conn.Close
              Set rs = Nothing
              Set conn = Nothing
              %>

          </div><br>
            
            <div class="card-box" id="chapters">
              <header>
                <h5><i class="fa-list-bullet"></i> DANH SÁCH CÁC CHƯƠNG TRUYỆN</h5>
              </header>
              <%
                Dim pageSize
                pageSize = 5
                Set conn = Server.CreateObject("ADODB.Connection")
                conn.Open "Provider=SQLOLEDB.1;Data Source=VIET\MSSQLSERVER01;Database=Web_doc_truyen;User Id=sa;Password=123456;"
                sqlCount = "SELECT COUNT(*) AS TotalChapters FROM chuong WHERE chuong.id_truyen = " & id_truyen
                Set rsCount = conn.Execute(sqlCount)
                totalChapters = rsCount("TotalChapters")
                rsCount.Close
                totalPages = Int((totalChapters - 1) / pageSize) + 1
                currentPage = CInt(Request.QueryString("page"))
                If currentPage = 0 Then
                  currentPage = 1
                End If
                startIndex = (currentPage - 1) * pageSize
                sql = "SELECT * FROM chuong WHERE chuong.id_truyen = " & id_truyen & " ORDER BY id_chuong ASC " _
                      & "OFFSET " & startIndex & " ROWS FETCH NEXT " & pageSize & " ROWS ONLY"
                Set rs = conn.Execute(sql)
                Do While Not rs.EOF
                %>
                <li class="Chapters">
                  <a href="ChuongTruyen.asp?id_truyen=<%= id_truyen %>&id_chuong=<%= rs("id_chuong")%>"  title="<%= rs("ten_chuong") %>"><%= rs("ten_chuong") %></a> 
                </li>
                <%
                  rs.MoveNext
                Loop
                For i = 1 To totalPages
                %>
                    <a  href="TrangTruyen.asp?id_truyen=<%= id_truyen %>&page=<%= i %>#chapters"><%= i %></a>
                <%
                Next
                rs.Close
                conn.Close
                Set rs = Nothing
                Set conn = Nothing
                %>
            </div>
          </div>
          <!-- #include file="XemBinhLuan.asp" -->
      </div>
      </div>
    </div>

      <div class="content-giua">

      </div>
      <div class="content-phai">
        <div class="tieude-content-trai1-child">
        <header style="
            font-size: 19px;
            font-weight: 649;
            background-color: #EEEEEE;
        ">THỂ LOẠI TRUYỆN</header>            
              <%
                Set conn = Server.CreateObject("ADODB.Connection")
                conn.Open "Provider=SQLOLEDB.1;Data Source=VIET\MSSQLSERVER01;Database=Web_doc_truyen;User Id=sa;Password=123456;"
                sql = "SELECT *  FROM the_loai "
                Set rs = conn.Execute(sql)
                Dim dem
                dem = 0
                Do While Not rs.EOF
                If dem Mod 2 = 0 Then 
                id_chuong = rs("id_the_loai")
              %>
              <ul class="list-group list-group-horizontal">
                <a href="the_loai_truyen.asp?id_the_loai=<%=rs("id_the_loai")%>" class="list-group-item list-group-item-action"><%=rs("ten_the_loai")%></a>
                <%
                  Else 
                %>
                <a href="the_loai_truyen.asp?id_the_loai=<%=rs("id_the_loai")%>" class="list-group-item list-group-item-action"><%=rs("ten_the_loai")%></a>
              </ul>
              <%
                End If
                dem = dem + 1
                rs.MoveNext
                Loop
                rs.Close
                conn.Close
                Set rs = Nothing
                Set conn = Nothing
              %>
            
        </div><br>
        <div class="tieude-content-trai1-child">
                  <header style="
            font-size: 19px;
            font-weight: 649;
            background-color: #EEEEEE;
        ">REVIEW TRUYỆN</header> 
            <div class="categories clearfix" name="ListReview">
              <ul class="list-group">
                  <% 
                  Dim connStr
                  connStr = "Provider=SQLOLEDB.1;Data Source=VIET\MSSQLSERVER01;Database=Web_doc_truyen;User Id=sa;Password=123456;"

                  Set conn = Server.CreateObject("ADODB.Connection")
                  conn.Open connStr

                  Set rs = Server.CreateObject("ADODB.Recordset")
                  rs.Open "SELECT * FROM reviewtruyen", conn

                  While Not rs.EOF
                  %>
                   <a href="ReviewTruyen.asp?id_the_loai=<%=rs("id_the_loai")%>" class="list-group-item list-group-item-action"><%= rs("tieude") %></a>
                  <%
                  rs.MoveNext
                  Wend

                  rs.Close
                  Set rs = Nothing

                  conn.Close
                  Set conn = Nothing
                  %>
              </ul>
          </div>
        </div><br>
        <!-- #include file="luuweb.asp" -->

    </div>
  </div>
<!-- #include file="footer.asp" -->


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>

</body>