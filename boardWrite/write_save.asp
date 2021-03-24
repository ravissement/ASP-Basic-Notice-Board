<!--#include virtual ="/include/dbcon.asp"-->
<%
ridx = request("ridx")
ruser_id = request("ruser_id")
title = request("title")
context = request("context")
writer = request("writer")


'state ->  1 : answer state O,    0 : answer state X
tableName = "test"


If ridx <> "" Then
	sql = "INSERT INTO "&tableName&" (depth, pos, title, context, user_id, read_id, regist_date, state, isUse) "&_
							" VALUES  "&_
							" (1, "&_
							" "&ridx&", "&_
							" '"&title&"', "&_
							" '"&context&"', "&_
							" '"&writer&"', "&_
							" '"&ruser_id&"', "&_
							" getDate(), "&_
							" 1, "&_
							" 1) "
	dbcon.execute(sql), Result
	If Result = 1 Then
		sql = " UPDATE "&tableName&" SET state=1 WHERE idx ="&ridx
		dbcon.execute(sql)

		msg = "정상적으로 저장되었습니다."
		url = "location.href = 'list.asp'"

	Else
		msg = "다시시도하시기 바랍니다."
		url = "history.back(-1);"

	End If
Else
	sql = "INSERT INTO "&tableName&" (depth, pos, title, context, user_id, regist_date, state, isUse, read_id) "&_
								"VALUES ( "&_
								" 0 ,"&_
								" IDENT_CURRENT('"&tableName&"'),"&_
								" '"&title&"' ,"&_
								" '"&context&"' ,"&_
								" '"&writer&"' ,"&_
								" getDate() ,"&_
								" 0,"&_
								" 1,"&_
								" '"&writer&"' "&_
								")"

	dbcon.execute(sql), Result
	If Result > 0 Then
		msg = "정상적으로 저장되었습니다."
		url = "location.href = 'list.asp'"
	Else
		msg = "다시시도하시기 바랍니다."
		url = "history.back(-1);"
	End If

End If

Set rs = Nothing
dbcon.close



response.write "<script type='text/javascript'>" & vbCrLf
response.write " alert('"&msg&"'); " & vbCrLf
response.write url & vbCrLf
response.write "</script>"

%>