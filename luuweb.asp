<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<style>   
  .card-header {
    position: relative;
    padding-right: 25px; 
  }

  .close-btn {
    position: absolute;
    top: 0;
    right: 0;
    padding: 7px;
    cursor: pointer;
    font-weight: bold;
    padding-right: 10px;
    border: none; 
    background: none; 
    font-size: inherit; 
  }  
</style>
<body>
  <%
    Response.ContentType = "text/html"
    Response.AddHeader "Content-Type", "text/html;charset=UTF-8"
    Response.CodePage = 65001
    Response.CharSet = "UTF-8"
    Dim id_chuong
    id_chuong = Request.Cookies("id_chuong")
    If id_chuong <> "" Then
        Set conn = Server.CreateObject("ADODB.Connection")
        conn.Open "Provider=SQLOLEDB.1;Data Source=TUNZTUNZ\SQLEXPRESS;Database=Web_doc_truyen;User Id=sa;Password=123456"
        sql = "SELECT chuong.ten_chuong, truyen.ten_truyen,truyen.id_truyen FROM chuong JOIN truyen ON chuong.id_truyen = truyen.id_truyen WHERE chuong.id_chuong = " & id_chuong
        Set rs = conn.Execute(sql)
  %>

  <div class="card text-center" id="div_id_chuong">
    <div class="card-header">
      <h5>Truyện đang đọc dở</h5>
      <button class="close-btn" onclick="deleteCookie('id_chuong')"><i class="bi bi-x-square-fill"></i>
</button>
    </div>
    <div class="card-body">
      <h5 class="card-title"><%= rs("ten_truyen") %></h5>
      <p class="card-text"><%= rs("ten_chuong") %></p>
      <a href="ChuongTruyen.asp?id_truyen=<%=rs("id_truyen") %>&id_chuong=<%=id_chuong%>" class="btn btn-primary">Đọc tiếp</a>
    </div>
  </div>

  <%
      rs.Close
      Set rs = Nothing
      conn.Close
      Set conn = Nothing
    End If
  %>


  <script>
      function deleteCookie(cookieName) {
      document.cookie = cookieName + "=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
      var divIdChuong = document.getElementById('div_id_chuong');
      divIdChuong.remove();
    }
  </script>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>