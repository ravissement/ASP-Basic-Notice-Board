<!--#include virtual ="/include/dbcon.asp"-->
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/style.css" type="text/css">
</head><br>
<body>
<div style="text-align: center;">
	<h1>�Խñ� ����Ʈ</h1>
	<br><br><br>
	<a href="/boardWrite/write.asp" class="aBtn">�۾���</a>
</div>
<br/><br/><br/>
<div class="wrap">
	<table>
		<thead>
			<tr>
				<th class="th1">��ȣ</th>
				<th class="th6">����</th>
				<th class="th1">�亯����</th>
				<th>�ۼ���</th>
				<th>�����</th>
			</tr>
		</thead>
		<tbody>
			<%
			tableName = "test"
			sql =";with "&_
			" tmp_a as (select row_number() over (order by pos ASC, depth DESC, Regist_date DESC) AS [RowNum], "&_
			" idx, depth, pos, title, user_id, read_id, regist_date, state, isUse "&_
			" from "& tableName &" as e "& whereStr &" ) "&_
			" SELECT a.* from tmp_a as a "&_
			" order by  rownum DESC "
			'response.write sql

			Set rs = dbcon.execute(sql)
			If rs.BOF Or rs.EOF Then

			Else
				Do until rs.EOF

				If rs("depth") = 1 Then
				viewpath = "list_view.asp?idx=" & rs("pos")
				%>
				<tr>
					<td><%=rs("RowNum")%></td>
					<td style="text-align: left;"><a href="<%=viewpath%>"><span style="background-color: #FAF58C">��  <%=rs("title")%></span></a></td>
					<td><p style='background-color: #FFB4FF;'>�亯�Ϸ�</p></td>
					<td><%=rs("user_id")%></td>
					<td><%=left(rs("regist_date"), 10)%></td>
				</tr>
				<%
				Else
				viewpath = "list_view.asp?idx=" & rs("idx")
				%>
				<tr>
					<td><%=rs("RowNum")%></td>
					<td style="text-align: left;">
						<a href="<%=viewpath%>"><%=rs("title")%></a>
					</td>
					<td>
					<%
					If rs("state") = "0" Then
						response.write "<p style='background-color:#A2E9FF'>�亯���</p>"
					Else
						response.write "<p style='background-color: #FFB4FF;'>�亯�Ϸ�</p>"
					End If
					%>
					</td>
					<td><%=rs("user_id")%></td>
					<td><%=left(rs("regist_date"), 10)%></td>
				</tr>
			<%
				End If

				rs.movenext
				loop
			End If
			Set rs = Nothing
			dbcon.close
			%>
		</tbody>
	</table>
</div>
</body>
</html>