<!-- #include file="connect.asp" -->
<%
    Dim id_chuong,id_truyen
    id_chuong = Request.QueryString("id_chuong")
    id_truyen = Request.QueryString("id_truyen")
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chỉnh sửa chương</title>
    <link rel="icon" type="image/x-icon" href="/Anh/logo1.ico">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" integrity="sha512-QzvsveSek0EUpu+K/ggG1B+UXpZcpvj3GvNiwuAQR6E79JQFZrQ4yaS5GfvsF8wz53nm2vUP0QGNEAI3SvlDhA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">
</head>
<style>
    /* Phần tổng */
    body{
        width: 100%;
        height: 750px;
        float: left;
    }
    .m40{
        margin:0 40px;
    }
    /* End tổng */
    /* Phần nacbar */
    .navbar{
        width: 100%;
        height: 50px;
        background-color: rgb(209, 198, 198);
        
    }
    /* End phần navbar */
    /* Phần sidebar */
    .sidebar{
        width: 20%;
        height: 700px;
        float: left;
    }
    
    .nav-item {
        display: flex;
        align-items: center;
    }

    .nav-link {
        display: flex;
        align-items: center;
        gap: 10px;
    }

    .material-symbols-outlined {
        display: flex;
        align-items: center;
    }
    /* End phần sidebar */

    /* Phần content */
    .content {
        display: flex;
        height: 700px;
        width: 80%;
        margin-top: 10px;
        
    }
    .field-name,
    .field-value {
        font-size: 20px;
    }

    .TenTruyen {
        font-size: 20px;
        padding: 20px;
        width: 300px;
        height: 60px;
    }

    #preview-container {
        display: flex;
        flex-wrap: wrap;
    }

    .preview-image {
        width: 200px;
        height: auto;
        margin: 10px;
    }

    .left-div {
        display: flex;
        width: 45%;
        
    }
    .card-title,
    .card-footer {
        display: flex;
        justify-content: center;
        align-items: center;
    }
    
</style>
<body>
    <div class="navbar">
       <!-- #include file="navbar.asp" -->
    </div>
    <div class="noidung">
        <div class="sidebar">
            <!-- #include file="sidebar.asp" -->
        </div>
        <div class="content">
            <% 
                If (isnull(Session("email")) OR TRIM(Session("email")) = "") Then
                    Response.redirect("/login.asp")
                End If
                Dim email
                email = Session("email")
                Set conn = Server.CreateObject("ADODB.Connection")
                conn.Open "Provider=SQLOLEDB.1;Data Source=TUNZTUNZ\SQLEXPRESS;Database=Web_doc_truyen;User Id=sa;Password=123456;"
                sql = "SELECT * FROM chuong WHERE id_chuong= " & id_chuong
                Set rs = conn.Execute(sql)
            %>
            <div class="card card-primary" style="width: 100%;">
                <div class="card-header">
                    <h2 class="card-title" style=" color: blue">Chỉnh sửa chương <%= rs("ten_chuong") %> </h2>
                </div>
                <div class="card-body">
                    <form id="myForm" method="post" action="sua_chuong_base.asp">
                        <div  style="display: none;">
                            <strong for="idchuong">Id chuong:</strong>
                            <input type="text" class="idchuong" name="idchuong" value="<%= id_chuong %>" placeholder="">
                        </div>
                        <div style="display: none;">
                            <strong for="idtruyen">idtruyen:</strong>
                            <input type="text" class="idtruyen" name="idtruyen" value="<%= id_truyen %>" placeholder="">
                        </div>
                        <div>
                            <strong for="tenchuong">Tên chương:</strong>
                            <input type="text" class="tenchuong" name="tenchuong" value="<%= rs("ten_chuong") %>" placeholder="Nhập Tên truyện"> 
                        </div>
                        <div class="mb-3">
                            <strong for="noidungchuong" class="form-label">Nội dung chương</strong>
                            <textarea class="form-control" id="noidungchuong" name="noidungchuong" rows="15"> <%= rs("ndung_chuong") %></textarea>
                        </div>
                        <div class="card-footer">
                            <button type="submit" class="btn btn-primary" value="Sửa chương">Sửa chương</button>
                            <a type="button" class="btn btn-default float-right" href= "">Hủy bỏ</a>
                        </div>
                    </form>
                </div>
            </div>      
        </div>
    </div>
    <div class="footer">
        <!-- #include file="footer.asp" -->
    </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>