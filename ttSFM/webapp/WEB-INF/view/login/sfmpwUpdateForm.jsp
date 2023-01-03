<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String memid = request.getParameter("memid");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PW UPDATE</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	alert(">>> : ");
	
	
	// 폼태그 데이터 콘트롤러에 보내기 
	$(document).on("click", "#btn", function(){
		alert("btn 버튼 블럭 진입 >>> : ");
		console.log("btn >>> : ");	
					
		$('#pwUpdateForm').attr({
			'action':'pwUpdateForm.sfm',
			'method':'GET',
			'enctype':'application/x-www-form-urlencoded'
		}).submit();
	});		
});

</script>
</head>
<body>
PW UPDATE
<hr>
<form name="pwUpdateForm" id="pwUpdateForm">
<table border="1">
<tr>
<td>임시비밀번호</td>
<td><input type="text" name="pwcertification" id="pwcertification" style="width:200px;"></td>
</tr>
<tr>
<td>새비밀번호</td>
<td><input type="text" name="mempw" id="mempw" style="width:200px;"></td>
</tr>
<tr>
<td>새비밀번호  확인</td>
<td><input type="text" name="mempw_r" id="mempw_r" style="width:200px;"></td>
</tr>
<tr>
<td><input type="hidden" name="memid" id="memid" value="<%= memid %>"></td>
</tr>
<tr>
<td  colspan="2" align="center">
<button type="button" id="btn" style="background-color: yellow;">다음</button>
</td>
</tr>
</table> 
</form>

</body>
</html>