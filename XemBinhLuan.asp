<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Web đọc truyện</title>
    <link rel="stylesheet" href="style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">

    
</head>
<style>
   /* CSS cho phần bình luận */
  #comment-section {
    margin-top: 20px;
    border: 1px solid #BBBBBB;
  }
  #comment-section h2 {
    font-size: 18px;
    margin-bottom: 10px;
  }
  #comment-section form {
    margin-bottom: 10px;
  }
  #comment-section textarea {
    width: 100%;
    height: 100px;
    resize: none;
  }
  #comment-section button {
    padding: 5px 10px;
  }
  #comment-section .comment {
    margin-bottom: 10px;
  }
 #comment-section .comment .acts {
    float: right;
    text-align: right;
    font-size: 12px;
    line-height: 20px;
  }
  .dropdown-center:hover .dropdown-menu {
  display: block; / Hiển thị menu khi di chuột vào phần tử cha */
  }
</style>
<body>
<div id="comment-section" name= "binh-luan">
  <h5>Nhận xét của độc giả về truyện </h5>
  <%
  
  email = Session("email")
  Dim isLoggedIn
  isLoggedIn = False
  
  If Not email = "" Then
    isLoggedIn = True
    
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=SQLOLEDB.1;Data Source=VIET\MSSQLSERVER01;Database=Web_doc_truyen;User Id=sa;Password=123456;"

    sql = "SELECT * FROM nguoi_dung WHERE email = '" & email & "'"

    Set rs = conn.Execute(sql)
    Dim id_nguoi_bl, ten_nguoi_bl
    id_nguoi_bl = rs("id_nguoi_dung")
    ten_nguoi_bl = rs("nghe_danh")
    rs.Close
    Set rs = Nothing
    conn.Close
    Set conn = Nothing
  End If
  %>
  
  <%
  If isLoggedIn Then
  %>
    <form id="comment-form" method="post" action="BinhLuan.asp?id_truyen=<%= id_truyen %>">
      <div id="" style="display: none;">
        <input type="text" class="ID_Nguoi_dung" name="id_truyen" value="<%= id_truyen %>" placeholder="">
      </div>
      <div id="" style="display: none;">
        <input type="" name="idusername" placeholder="" value="<%= id_nguoi_bl %>"><br>
      </div>
      <div id="" style="display: none;">
        <input type="" name="id_chuong" placeholder="" value="<%= id_chuong %>"><br>
      </div>
      <textarea name="comment" placeholder="Nhập bình luận của bạn"></textarea><br>
      <button type="submit" class="btn btn-info">Gửi</button>
    </form>
  <%
  Else
  %>
    <form id="comment-form" method="post" action="BinhLuan.asp?id_truyen=<%= id_truyen %>" onsubmit="return checkForm()">
  <div id="" style="display: none;">
    <input type="text" class="ID_Nguoi_dung" name="id_truyen" value="<%= id_truyen %>" placeholder="">
  </div>
  <div id="" style="display: none;">
    <input type="" name="idusername" placeholder="" value="<%= id_nguoi_bl %>"><br>
  </div>
  <div id="" style="display: none;">
    <input type="" name="id_chuong" placeholder="" value="<%= id_chuong %>"><br>
  </div>
  <textarea name="comment" placeholder="Nhập bình luận của bạn"></textarea><br>
  <b id="login-message" style="display: none; color: red;">Bạn cần đăng nhập để có thể gửi bình luận!</b>
  <button type="submit" class="submit-button"><b>Gửi</b></button>
</form>

<script>
  function checkForm() {
    var email = "<%= email %>";
    var commentInput = document.querySelector('textarea[name="comment"]');
    var loginMessage = document.getElementById("login-message");

    if (email === "" || commentInput.value.trim() === "") {
      loginMessage.style.display = "block";
      return false; 
    }
    return true; 
  }
</script>


  <%
  End If
  %>

  <div id="comment-list">
    <%
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=SQLOLEDB.1;Data Source=VIET\MSSQLSERVER01;Database=Web_doc_truyen;User Id=sa;Password=123456;"
    Set rs = conn.Execute("SELECT binh_luan.*, nguoi_dung.* " & _
                          "FROM binh_luan INNER JOIN nguoi_dung ON binh_luan.id_nguoi_dung = nguoi_dung.id_nguoi_dung " & _
                          "WHERE binh_luan.id_truyen = " & id_truyen & _
                          "ORDER BY binh_luan.ngay_binh_luan DESC")
    Do While Not rs.EOF
        %>
        <div>
            <div class="acts ml-auto d-flex justify-content-between" style="display: flex">
                
                <small >
                      <div class="userinfo">
                          <img src="/Anh/meme camdao.jpg" alt="" width="32" height="32" class="rounded-circle me-2" style="margin-top: 7px;">
                          <strong style="font-size: 16px; color: blue"><%= rs("nghe_danh") %></strong>
                          <i class="fa fa-circle"></i> <%= rs("ngay_binh_luan") %>
                      </div>
                        <% If isLoggedIn And rs("id_nguoi_dung") = id_nguoi_bl Then %>
                      <div class="comment-actions">
                          <p id="comment-text-<%= rs("id_binh_luan") %>" style="margin-left: 40px; font-size: 16px;" rows="2"><%= rs("ndung_binh_luan") %></p>
                          <div id="edit-buttons-<%= rs("id_binh_luan") %>" style="display: none;">
                              <input type="text" id="edit-comment-<%= rs("id_binh_luan") %>" style="width: 100%;" value="<%= rs("ndung_binh_luan") %>">
                              <button onclick="cancelEditComment(<%= rs("id_binh_luan") %>)"><i class="bi bi-x-circle-fill"> </i>Hủy</button>
                              <button onclick="saveComment(<%= rs("id_binh_luan") %>)"><i class="bi bi-file-earmark-check-fill"> </i>Lưu</button>
                          </div>
                      </div>
                    <% Else %>
                    <p style="margin-left: 40px;font-size: 16px; "><%= rs("ndung_binh_luan") %></p>
                    <% End If %>
                </small>
                <div class="dropdown-center">
                  <% If isLoggedIn And rs("id_nguoi_dung") = id_nguoi_bl Then %>
                  <button class="btn btn-secondary btn-light" type="button" data-bs-toggle="dropdown" aria-expanded="false">...</button>
                  <ul class="dropdown-menu">
                    <li>
                        <button class="dropdown-item" onclick="editComment(<%= rs("id_binh_luan") %>)">
                            <i class="bi bi-pencil"></i> Sửa
                        </button>
                        <button id="save-comment-<%= rs("id_binh_luan") %>" class="dropdown-item" onclick="saveComment(<%= rs("id_binh_luan") %>)" style="display: none;">
                            <i class="bi bi-check"></i> Lưu
                        </button>
                    </li>
                    <div class="dropdown-divider"></div>
                    <li>
                        <button type="button" class="dropdown-item text-danger" onclick="window.location.href='XoaBinhLuan.asp?id_binh_luan=<%= rs("id_binh_luan") %>&id_truyen=<%= id_truyen %>&id_chuong=<%= id_chuong %>'">
                            <i class="bi bi-trash"></i> Xóa
                        </button>
                        <div id="" style="display: none;">
                            <input type="" name="id_chuong" placeholder="" value="<%= id_chuong %>">
                        </div>
                    </li>
                </ul>

                  <% End If %>
                </div>

            </div>
        </div>
        <script>
            function editComment(commentId) {
                var commentText = document.getElementById('comment-text-' + commentId);
                var editTextArea = document.getElementById('edit-comment-' + commentId);
                var editButtons = document.getElementById('edit-buttons-' + commentId);

                commentText.style.display = 'none';
                editTextArea.style.display = 'block';
                editTextArea.focus();
                editButtons.style.display = 'block';
            }

            function cancelEditComment(commentId) {
                var commentText = document.getElementById('comment-text-' + commentId);
                var editTextArea = document.getElementById('edit-comment-' + commentId);
                var editButtons = document.getElementById('edit-buttons-' + commentId);

                commentText.style.display = 'block';
                editTextArea.style.display = 'none';
                editButtons.style.display = 'none';
            }

            function saveComment(commentId) {
                var editTextArea = document.getElementById('edit-comment-' + commentId);
                var saveButton = document.getElementById('save-comment-' + commentId);

                var commentText = editTextArea.value;

                var xhr = new XMLHttpRequest();
                xhr.open('POST', 'CapNhatBinhLuan.asp', true);
                xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                xhr.onreadystatechange = function() {
                    if (xhr.readyState === 4 && xhr.status === 200) {
                        var response = xhr.responseText;
                        if (response === 'success') {
                            var commentTextElement = document.getElementById('comment-text-' + commentId);
                            commentTextElement.innerHTML = commentText;
                            commentTextElement.style.display = 'block';
                            editTextArea.style.display = 'none';
                            saveButton.style.display = 'none'; 

                            var editButtons = document.getElementById('edit-buttons-' + commentId);
                            editButtons.style.display = 'none'; 
                        } else {
                            alert('Đã xảy ra lỗi khi lưu comment.');
                        }
                    }
                };
                xhr.send('commentId=' + commentId + '&commentText=' + encodeURIComponent(commentText));
            }
        </script>

        <%
        rs.MoveNext
    Loop
    rs.Close
    Set rs = Nothing
    conn.Close
    Set conn = Nothing
    %>
</div>



    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


</body>