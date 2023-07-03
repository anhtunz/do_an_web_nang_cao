<%
    function Ceil(Number)
        Ceil = Int(Number)
        if Ceil<>Number Then
            Ceil = Ceil + 1
        end if
    end function
    function checkPage(cond, ret) 
        if cond=true then
            Response.write ret
        else
            Response.write ""
        end if
    end function
    page = Request.QueryString("page")
    limit = 10
    if (trim(page) = "") or (isnull(page)) then
        page = 1
    end if
    offset = (Clng(page) * Clng(limit)) - Clng(limit)
    strSQL = "SELECT COUNT(id_truyen) AS count FROM truyen where duyet =1"
    connDB.Open()
    Set CountResult = connDB.execute(strSQL)
    totalRows = CLng(CountResult("count"))
    Set CountResult = Nothing
    pages = Ceil(totalRows/limit)
%>