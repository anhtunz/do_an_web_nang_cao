<!-- #include file="connect.asp" -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách theo thể loại</title>
    <link rel="icon" type="image/x-icon" href="/Anh/logo1.ico">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">

    
</head>
<style>
  /* Phần content */
    .content{
        height: 800px;
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

    /* End content phải */
  /* End content*/

    .center{
        display:flex;
        justify-content:center;
        align-items: center;
    }
    .right{
        margin : auto;  
    }

</style>
<!-- #include file="phantrang.asp" -->
<body style="background-color: #EEEEEE;">
  <!-- Phần navbar -->
    <!-- #include file="navbar.asp" -->
    
    <div class="content">
      <div class="content-trai">
        <h4 class = "center">Danh sách tất cả truyện</h4>
        <%
            Set cmdPrep = Server.CreateObject("ADODB.Command")
            cmdPrep.ActiveConnection = connDB
            cmdPrep.CommandType = 1
            cmdPrep.Prepared = True
            cmdPrep.CommandText = "SELECT truyen.id_truyen, truyen.ten_truyen, nguoi_dung.nghe_danh, truyen.so_chuong FROM truyen INNER JOIN nguoi_dung ON truyen.id_nguoi_dung = nguoi_dung.id_nguoi_dung WHERE truyen.duyet = 1 ORDER BY truyen.id_truyen OFFSET ? ROWS FETCH NEXT ? ROWS ONLY"
            cmdPrep.parameters.Append cmdPrep.createParameter("offset",3,1, ,offset)
            cmdPrep.parameters.Append cmdPrep.createParameter("limit",3,1, , limit)
            Set Result = cmdPrep.execute
            do while not Result.EOF
        %>
        <a href="TrangTruyen.asp?id_truyen=<%=Result("id_truyen")%>" class="list-group-item list-group-item-action flex-column align-items-start">
            <div class="d-flex justify-content-start">
                <h5 class="mb-1"><%=Result("ten_truyen")%></h5>
                <span class="badge badge-primary badge-pill" style="color: blue; border-radius: 40% ">Dịch</span>
            </div>
            <div class="d-flex w-100 justify-content-between">
                <small>Tác giả: <%=Result("nghe_danh")%></small>
                <small>Số chương: <%=Result("so_chuong")%></small>
            </div>
        </a>
        <%
            Result.MoveNext
            loop
            Result.Close
            Set Result = Nothing
            Set conn = Nothing
        %>
        <nav class= "right" aria-label="Page Navigation">
            <ul class="pagination pagination-sm">
                <% if (pages>1) then 
                    for i= 1 to pages
                %>
                    <li class="page-item <%=checkPage(Clng(i)=Clng(page),"active")%>"><a class="page-link" href="danh_sach_truyen.asp?page=<%=i%>"><%=i%></a></li>
                <%
                    next
                    end if
                %>
            </ul>
        </nav>
      </div>
      <div class="content-giua">
      </div>
      <div class="content-phai">
        <div class="tieude content-trai1-child">
            <h4 class = "center" >THỂ LOẠI TRUYỆN</h4>
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
  <!-- Phần footer -->
    <!-- #include file="footer.asp" -->

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