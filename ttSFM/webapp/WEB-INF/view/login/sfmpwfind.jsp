<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PWFIND</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	alert(">>> : ");
	
	$("#emailbtn").click(function(){
		alert("emailbtn >>> : ");
		
		let url = "pwFindAuthnum.sfm";			
		let memidVal = $("#memid").val();			
		let mememailVal = $("#mememail").val();
		
		$.get(url
			 ,{"memid": memidVal, "mememail": mememailVal}
			 ,function(data){	
				// alert(data);
				var sVal = $(data).find("result").text();	
				alert(sVal);
				
			 }
		);			
	});

	
	// 폼태그 데이터 콘트롤러에 보내기 
	$(document).on("click", "#pwbtn", function(){
		alert("pwbtn 버튼 블럭 진입 >>> : ");			
		console.log("pwbtn >>> : ");	
						
		$('#pwForm').attr({
			'action':'pwFindAuthnum.sfm',
			'method':'GET',
			'enctype':'application/x-www-form-urlencoded'
		}).submit();
	});		
});

</script>
</head>
<body>
PWFIND :: TEMPPW
<hr>
<form name="pwForm" id="pwForm">
<table border="1">
<tr>
<td>아이디</td>
<td><input type="text" name="memid" id="memid" style="width:200px;"></td>
</tr>
<tr>
<td>이메일</td>
<td>
	<input type="text" name="mememail" id="mememail" style="width:200px;">
	<button type="button" id="emailbtn">임시비밀번호 받기</button>
</td>
</tr>
<tr>
<td>임시비밀번호</td>
<td><input type="text" name="pwcertification" id="pwcertification" 
           placeholder="임시비밀번호  10자리 입력" style="width:200px;"></td>
</tr>
<tr>
<td colspan="2" align="center">
<button type="button" id="pwbtn">다음</button>
</td>
</tr>
</table> 
</form>
</body>
</html>