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

<%
idx = request("idx")
user_id = request("user_id")
%>


<body>
<div style="text-align:center;">
<h1>�Խñ� �ۼ�</h1>
</div>
<br><br><br>
<form name="aform" action="write_save.asp" method="post" >
<input type="hidden" name="ridx" value="<%=idx%>" />
<input type="hidden" name="ruser_id" value="<%=user_id%>" />
<div class="wrap">
	<table class="tableContent">
		<thead>

			<tr>
				<th class="th1"><span class="aBtn">�۾���</span></th>
				<th class="th2"><input type="text" name="writer" maxlength="20" style="width:98%"/></th>
				<th class="th1"><span class="aBtn">������</span></th>
				<th style="width:60%"><input type="text" name="title" maxlength="90" style="width:100%;"></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="context" colspan="4" style="text-align:left;">
					<textarea id="summernote" class=="summernote" name="context" ></textarea>
				</td>
			</tr>
		</tbody>
	</table>
	</form>
	<table>
		<tr>
		<td>
			<a id="submitBtn" href="#" class="aBtn">����</a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a id="cancleBtn" href="#" class="aBtn">���</a>
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

$('#submitBtn').click(function() {
	if(!$('input[name=writer]').val()){
		alert("�۾��̸� �Է����ּ���.");
		$('input[name=writer').focus();
		return false;
	};
	if(!$('input[name=title]').val()){
		alert("������ �Է����ּ���.");
		$('input[name=title').focus();
		return false;
	};

	if(!$('textarea[name=context').val()){
		alert("������ �Է����ּ���.");
		$('input[name=context').focus();
		return false;
	};

	if(!confirm("�����Ͻðڽ��ϱ�?")){
		return false;
	};

	$('form[name=aform]').submit();

});


$('#cancleBtn').click(function() {
	if(!confirm("����Ͻðڽ��ϱ�?")){
		return false;
	};

	location.href="list.asp"
});

</script>

</html>