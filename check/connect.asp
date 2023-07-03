<%@LANGUAGE="VBSCRIPT" CODEPAGE = "65001"%>
<%
    Dim connDB
    set connDB = Server.CreateObject("ADODB.Connection")
    Dim strConnection
    strConnection = "Provider=SQLOLEDB.1;Data Source=TUNZTUNZ\SQLEXPRESS;Database=Web_doc_truyen;User Id=sa;Password=123456;"
    connDB.ConnectionString = strConnection
    Response.ContentType = "text/html"
    Response.AddHeader "Content-Type", "text/html;charset=UTF-8"
    Response.CodePage = 65001
    Response.CharSet = "UTF-8"
%>