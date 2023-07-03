<%@ LANGUAGE="VBSCRIPT" CODEPAGE="1252" ENABLESESSIONSTATE="FALSE" LCID="1046" %>
<!--#include file="upload.lib.asp"-->
<% 
Dim id_nguoi_dung
id_nguoi_dung = Request.QueryString("id_nguoi_dung")
Response.Charset = "ISO-8859-1"

Dim Form : Set Form = New ASPForm
Server.ScriptTimeout = 1440 ' Limite de 24 minutos de execu��o de c�digo, o upload deve acontecer dentro deste tempo ou ent�o ocorre erro de limite de tempo.
Const MaxFileSize = 10240000 ' Bytes. Aqui est� configurado o limite de 100 MB por upload (inclui todos os tamanhos de arquivos e conte�dos dos formul�rios).
Response.write(Form.State)
If Form.State = 0 Then

	For each Key in Form.Texts.Keys
		Response.Write "Elemento: " & Key & " = " & Form.Texts.Item(Key) & "<br />"
		Response.write("loi2")
	Next
Response.write("loi3")
	For each Field in Form.Files.Items
		' # Field.Filename : Nome do Arquivo que chegou.
		' # Field.ByteArray : Dados bin�rios do arquivo, �til para subir em blobstore (MySQL).
		Field.SaveAs Server.MapPath(".") & "\upload\" & Field.FileName
		Response.write("loi4")
		Response.Redirect("them_truyen.asp?id_nguoi_dung="&id_nguoi_dung )
	Next
End If
Response.write("loi5")
%>
