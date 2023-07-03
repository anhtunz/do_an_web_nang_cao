<!-- #include file="connect.asp" -->
<%
    Dim email
    email = Request.Form("loginemail")
    Dim password
    password = Request.Form("loginpass")
    If (NOT isnull(email) AND NOT isnull(password) AND TRIM(email)<>"" AND TRIM(password)<>"" ) Then
        Dim sql
        sql = "select * from nguoi_dung where email= ?  and mat_khau= ?"
        Dim cmdPrep
        set cmdPrep = Server.CreateObject("ADODB.Command")
        connDB.Open()
        cmdPrep.ActiveConnection = connDB
        cmdPrep.CommandType=1
        cmdPrep.Prepared=true
        cmdPrep.CommandText = sql
        cmdPrep.Parameters(0)=email
        cmdPrep.Parameters(1)=password
        Dim result
        set result = cmdPrep.execute()
        If not result.EOF Then
            Session("email")=result("email")
            Response.Redirect("/index.asp")
        Else
            Response.Redirect("/login.asp?loginfalse=1")
        End if
        result.Close()
        connDB.Close()
        Else
            Session("Error")="Hãy nhập email hoặc mật khẩu."
            Response.Redirect("/login.asp?empty=1")
    End if
%>
    

