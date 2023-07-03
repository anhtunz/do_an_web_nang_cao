
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
    <div class="content">
      <div class="content-trai">
        <%                 
          Dim id_the_loai
          id_the_loai = Request.QueryString("id_the_loai")
          Set conn = Server.CreateObject("ADODB.Connection")
          conn.Open "Provider=SQLOLEDB.1;Data Source=VIET\MSSQLSERVER01;Database=Web_doc_truyen;User Id=sa;Password=123456"
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
          conn.Open "Provider=SQLOLEDB.1;Data Source=VIET\MSSQLSERVER01;Database=Web_doc_truyen;User Id=sa;Password=123456"
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
  
    

 