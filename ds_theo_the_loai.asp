<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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

    /* End content phải */
  /* End content*/
  .center{
        display:flex;
        justify-content:center;
        align-items: center;
        margin-bottom: 20px;
    }
</style>
<body>
    <div class="content">
      <div class="content-trai">
        <%                 
          Dim id_the_loai
          id_the_loai = Request.QueryString("id_the_loai")
          Set conn = Server.CreateObject("ADODB.Connection")
          conn.Open "Provider=SQLOLEDB.1;Data Source=TUNZTUNZ\SQLEXPRESS;Database=Web_doc_truyen;User Id=sa;Password=123456"
          Set rs = conn.Execute ("SELECT truyen.id_truyen,truyen.ten_truyen, nguoi_dung.nghe_danh, truyen.so_chuong, the_loai.ten_the_loai FROM truyen JOIN nguoi_dung ON truyen.id_nguoi_dung = nguoi_dung.id_nguoi_dung JOIN the_loai ON truyen.id_the_loai = the_loai.id_the_loai WHERE the_loai.id_the_loai ="  & id_the_loai &"and duyet=1")
        %>
        <h4 class = "center">Danh sách truyện theo thể loại <%=rs("ten_the_loai") %> </h4>
        <%
        Do While Not rs.EOF
        %>
        <a href="TrangTruyen.asp?id_truyen=<%=rs("id_truyen")%>" class="list-group-item list-group-item-action flex-column align-items-start">
            <div class="d-flex justify-content-start">
                <h5 class="mb-1"><%=rs("ten_truyen")%></h5>
                <span class="badge badge-primary badge-pill" style="color: blue; border-radius: 40% ">Dịch</span>
            </div>
            <div class="d-flex w-100 justify-content-between">
                <small>Tác giả: <%=rs("nghe_danh")%></small>
                <small>Số chương: <%=rs("so_chuong")%></small>
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
      <div class="content-giua">

      </div>
      <div class="content-phai">
        <div class="tieude content-trai1-child">
          <h4>THỂ LOẠI TRUYỆN</h4>
        </div>
        <%
          Set conn = Server.CreateObject("ADODB.Connection")
          conn.Open "Provider=SQLOLEDB.1;Data Source=TUNZTUNZ\SQLEXPRESS;Database=Web_doc_truyen;User Id=sa;Password=123456"
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
      </div>
    </div>
  </div>
    

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