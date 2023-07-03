
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nội dung</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">
</head>
<style>
  /* Phần content */
    .content{
        height: 3200px;
        width: 70%;
        margin: 0 auto;
        box-sizing: border-box;
        
    } 
    /* Phần content trái */ 
    .content .content-trai{
        width: 70%;
        height: 100%;
        float: left;
        display: flex;
        flex-direction: column;
    }
      /* Phần content trái 1 */ 
      .content .content-trai .content-trai1{  
          width: 100%;
          height: 400px;
          margin-bottom: 20px;
      } 

      /* End content trai 1 */
      /* Phần content trái 2 */ 
      .content .content-trai .content-trai2{  
          width:100%;
          height: 850px;  
          display: flex;
          flex-wrap: wrap;
      } 

      /* End content trai 2 */
      /* Phần content trái 3 */ 
      .content .content-trai .content-trai3{  
          width: 100%;
          height: 1000px;
          margin-bottom: 10px;
      }  

      /* End content trai 3 */

      /* Phần content trái 4 */ 
      .content .content-trai .content-trai4{  
          width: 100%;
          height: 620px;
      }

      /* End content trai 4 */
    /* End content trái */

    /* Phần content giữa */
    .content .content-giua{
        float: left;
        width: 5%;
        height: 100%;
    }

    /* End content giữa */

    /* Phần content phải */
    .content .content-phai{
        width: 25%;
        height: 100%;
        float: left;
    }
    .content .content-phai1{
        width: 100%;
        height: 200px;
        
    }


    /* End content phải */
  /* End content*/
  /* Chỉnh chi tiết các phần tử */
    .truyen-tong{
      width:100%;
      height: 100%;
      box-sizing: border-box;
    }
    .card {
      flex: 1 0 25%; /* Chia tỷ lệ cân đối cho 4 card trên cùng một dòng */
      height: 100%; /* Chiều cao của card bằng chiều cao của thẻ cha */
      width: 100%;
    }
    .card-body h5,
    .card-body p {
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
    }
  /* End chỉnh chi tiết các phần tử */

</style>
<body>
    <div class="content">
      <div class="content-trai">
        <div class="content-trai1">
          <!--#include file="slide.asp"-->
        </div>
        <div class="content-trai2">
          <div class="container mt-4 truyen-tong">
              <h4 >TRUYỆN DỊCH CHỌN LỌC</h4>
              <div class="row mt-4">
              <%
                Set conn = Server.CreateObject("ADODB.Connection")
                conn.Open "Provider=SQLOLEDB.1;Data Source=TUNZTUNZ\SQLEXPRESS;Database=Web_doc_truyen;User Id=sa;Password=123456"
                sql = "SELECT * FROM truyen WHERE id_truyen BETWEEN 4 AND 7"
                Set rs = conn.Execute(sql)
                ' Duyệt qua từng bản ghi trong kết quả truy vấn
                Do While Not rs.EOF
              %>
              <div class="col-md-3">
                <div class="card">
                  <img src="<%=rs("anh_truyen")%>" class="card-img-top" alt="...">
                  <div class="card-body">
                    <h5 class="card-title"><%=rs("ten_truyen")%></h5>
                    <p class="card-text"><%=rs("mo_ta_ndung")%></p>
                    <a href="TrangTruyen.asp?id_truyen=<%=rs("id_truyen")%>" class="btn btn-primary">Đọc truyện</a>
                  </div>
                </div>
              </div>
              <%
                rs.MoveNext
                Loop
                rs.Close
                conn.Close
                Set rs = Nothing
                Set conn = Nothing
              %>
            </div>
            <div class="row mt-4">
              <%         
                Set conn = Server.CreateObject("ADODB.Connection")
                conn.Open "Provider=SQLOLEDB.1;Data Source=TUNZTUNZ\SQLEXPRESS;Database=Web_doc_truyen;User Id=sa;Password=123456"
                sql = "SELECT * FROM truyen WHERE id_truyen BETWEEN 8 AND 11"
                Set rs = conn.Execute(sql)
                ' Duyệt qua từng bản ghi trong kết quả truy vấn
                Do While Not rs.EOF
              %>
              <div class="col-md-3">
                <div class="card">
                  <img src="<%=rs("anh_truyen")%>" class="card-img-top" alt="...">
                  <div class="card-body">
                    <h5 class="card-title"><%=rs("ten_truyen")%></h5>
                    <p class="card-text"><%=rs("mo_ta_ndung")%></p>
                    <a href="TrangTruyen.asp?id_truyen=<%=rs("id_truyen")%>" class="btn btn-primary">Đọc truyện</a>
                  </div>
                </div>
              </div>
              <%
                rs.MoveNext
                Loop
                rs.Close
                conn.Close
                Set rs = Nothing
                Set conn = Nothing
              %>
            </div>
          </div>
        </div>
        <div class="content-trai3">
          <div class="list-group">
            <h4>TRUYỆN MỚI CẬP NHẬT</h4>
            <%
              Set conn = Server.CreateObject("ADODB.Connection")
              conn.Open "Provider=SQLOLEDB.1;Data Source=TUNZTUNZ\SQLEXPRESS;Database=Web_doc_truyen;User Id=sa;Password=123456"
              sql = "SELECT TOP 15 chuong.id_chuong, chuong.ten_chuong, chuong.chuong_thoi_gian, truyen.ten_truyen FROM chuong INNER JOIN truyen ON chuong.id_truyen = truyen.id_truyen WHERE truyen.duyet = 1 ORDER BY chuong.id_chuong DESC"
              Set rs = conn.Execute(sql)
              ' Duyệt qua từng bản ghi trong kết quả truy vấn
              Do While Not rs.EOF
              id_chuong = rs("id_chuong")
            %>
              <a href="#?id_chuong=<%=rs("id_chuong")%>" class="list-group-item list-group-item-action flex-column align-items-start">
                <div class="d-flex justify-content-start">
                  <h5 class="mb-1"><%=rs("ten_truyen")%></h5>
                  <span class="badge badge-primary badge-pill" style="color: blue; border-radius: 40% ">Dịch</span>
                </div>
                <div class="d-flex w-100 justify-content-between">
                  <small><%=rs("ten_chuong")%></small>
                  <small>Cập nhật: <%=rs("chuong_thoi_gian")%></small>
                </div>
              </a>
              <%
                rs.MoveNext
                Loop
                rs.Close
                conn.Close
                Set rs = Nothing
                Set conn = Nothing
              %> 
          </div>
        </div>
        <div class="content-trai4">
          <div class="container mt-4">
            <h4>TRUYỆN FULL</h4>
              <div class="row mt-4">
                <%
                  Set conn = Server.CreateObject("ADODB.Connection")
                  conn.Open "Provider=SQLOLEDB.1;Data Source=TUNZTUNZ\SQLEXPRESS;Database=Web_doc_truyen;User Id=sa;Password=123456"
                  sql = "SELECT TOP 4 * FROM truyen WHERE tinh_trang = 'Full' ORDER BY id_truyen"
                  Set rs = conn.Execute(sql)
                  ' Duyệt qua từng bản ghi trong kết quả truy vấn
                  Do While Not rs.EOF
                %>
                <div class="col-md-3">
                  <div class="card">
                  <img src="<%=rs("anh_truyen")%>" class="card-img-top" alt="...">
                  <div class="card-body">
                    <h5 class="card-title"><%=rs("ten_truyen")%></h5>
                    <p class="card-text"><%=rs("mo_ta_ndung")%></p>
                      <a href="TrangTruyen.asp?id_truyen=<%=rs("id_truyen")%>" class="btn btn-primary">Đọc truyện</a>
                  </div>
                  </div>
                </div>
                <%
                  rs.MoveNext
                  Loop
                  rs.Close
                  conn.Close
                  Set rs = Nothing
                  Set conn = Nothing
                %>
              </div>
              <div class="row mt-4">
                <%
                  Set conn = Server.CreateObject("ADODB.Connection")
                  conn.Open "Provider=SQLOLEDB.1;Data Source=TUNZTUNZ\SQLEXPRESS;Database=Web_doc_truyen;User Id=sa;Password=123456"
                  sql = "SELECT TOP 4 * FROM truyen WHERE tinh_trang = 'Full' AND id_truyen > 18"
                  Set rs = conn.Execute(sql)
                  ' Duyệt qua từng bản ghi trong kết quả truy vấn
                  Do While Not rs.EOF
                %>
                <div class="col-md-3">
                  <div class="card">
                    <img src="<%=rs("anh_truyen")%>" class="card-img-top" alt="...">
                    <div class="card-body">
                      <h5 class="card-title"><%=rs("ten_truyen")%></h5>
                      <p class="card-text"><%=rs("mo_ta_ndung")%></p>
                      <a href="TrangTruyen.asp?id_truyen=<%=rs("id_truyen")%>" class="btn btn-primary">Đọc truyện</a>
                    </div>
                  </div>
                </div>
                <%
                  rs.MoveNext
                  Loop
                  rs.Close
                  conn.Close
                  Set rs = Nothing
                  Set conn = Nothing
                %>
              </div>    
            </div>
          </div>
      </div>
      <div class="content-giua">

      </div>
      <div class="content-phai">
        <div class="content-phai1">
          <div class="tieude content-trai1-child">
            <h4>THỂ LOẠI TRUYỆN</h4>
          </div>
          <%
            Set conn = Server.CreateObject("ADODB.Connection")
            conn.Open "Provider=SQLOLEDB.1;Data Source=TUNZTUNZ\SQLEXPRESS;Database=Web_doc_truyen;User Id=sa;Password=123456"
            sql = "SELECT *  FROM the_loai "
            Set rs = conn.Execute(sql)
            ' Duyệt qua từng bản ghi trong kết quả truy vấn
            Dim dem
            dem = 0
            Do While Not rs.EOF
            If dem Mod 2 = 0 Then ' Chỉ hiển thị cho thẻ a đầu tiên của mỗi cặp
            id_chuong = rs("id_the_loai")
          %>
          <ul class="list-group list-group-horizontal">
            <a href="the_loai_truyen.asp?id_the_loai=<%=rs("id_the_loai")%>" class="list-group-item list-group-item-action"><%=rs("ten_the_loai")%></a>
            <%
              Else ' Cho thẻ a thứ hai của mỗi cặp
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
        </div>
        <div class="content-phai2">
          <header>REVIEW TRUYỆN</header>
            <div class="categories clearfix" name="ListReview">
              <ul class="list-group">
                  <% 
                  Dim connStr
                  connStr = "Provider=SQLOLEDB.1;Data Source=TUNZTUNZ\SQLEXPRESS;Database=Web_doc_truyen;User Id=sa;Password=123456;"

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
        <div class="content-phai3">
          <!-- #include file="luuweb.asp" -->
        </div>
      </div>
    </div>
  <script>  
      window.addEventListener('DOMContentLoaded', function (event) {
        var id_truyen = localStorage.getItem('id_truyen');
        document.getElementById('id_truyen_value').textContent = 'Giá trị id_truyen: ' + id_truyen;
      });
  </script>
    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    -->
    


 
</body>