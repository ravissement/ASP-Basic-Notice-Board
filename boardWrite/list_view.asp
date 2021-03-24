<!--#include virtual ="/include/dbcon.asp"-->
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/style.css" type="text/css">
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet"> <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet"> <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

</head>
<body>
<%
idx = request("idx")
tableName = "test"

sql = "SELECT idx, title, context, user_id, state FROM "&tableName&" WHERE idx ="&idx

Set rs = dbcon.execute(sql)

If Not rs.BOF Then
	idx = rs("idx")
	title = rs("title")
	context = rs("context")
	user_id = rs("user_id")
	state = rs("state")
End If

%>



<div style="text-align:center;">
<h1>�Խñ� �ۼ�</h1>
</div>
<br><br><br>
<form name="aform" action="write_save.asp" method="post" >
<div class="wrap">
	<table class="tableContent">
		<thead>

			<tr>
				<th class="th1"><span class="aBtn">�۾���</span></th>
				<th class="th2"><%=user_id%></th>
				<th class="th1"><span class="aBtn">������</span></th>
				<th style="width:60%"><%=title%></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th colspan="4" style="padding:20px;"><%=context%></th>
			</tr>
		</tbody>
	</table>
	</form>
	<table>
		<tr>
		<td>
			<a id="listBtn" href="#" class="aBtn">���</a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<%
			If state = 0 Then
				response.write "<a id='writeBtn' href='#' class='aBtn'>�亯</a>"
			End If
			%>
		</td>
		</tr>
	</table>
</div>
</body>


<script>
$(document).ready(function() {
	$('#summernote').summernote({
        placeholder: '�����Ӱ� �Է����ּ���.',
        height: 400,
	   width: 700,
        lang: 'ko-KR'
      });
});


$('#listBtn').click(function() {
	location.href="list.asp"
});

$('#writeBtn').click(function() {
	location.href="write.asp?idx=<%=idx%>&user_id=<%=user_id%>"
});

</script>

</html>