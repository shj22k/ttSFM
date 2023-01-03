<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.ArrayList" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){	
	
		$("#mcomfirm").click(function(){			
			alert("mcomfirm >>> : ");
			
			let url = "idFindAuthnum.sfm";
			let memnameVal = $("#memname").val();			
			let mememailVal = $("#mememail").val();
			
			$.get(url
				 ,{"memname": memnameVal, "mememail": mememailVal}
				 ,function(data){	
					// alert(data);
					var sVal = $(data).find("result").text();	
					alert(sVal);
					
				 }
			);
		});
		
		// 폼태그 데이터 콘트롤러에 보내기 
		$(document).on("click", "#idbtn", function(){
			alert("idbtn 버튼 블럭 진입 >>> : ");			
			console.log("idbtn >>> : ");	
							
			$('#idForm').attr({
				'action':'idFind.sfm',
				'method':'GET',
				'enctype':'application/x-www-form-urlencoded'
			}).submit();
		});		
	});

</script>
</head>
<body>
IDFIND<br>
<hr>
<%
	Object obj = request.getAttribute("aList");
	String memname = "";
	String mememail = "";
	String authcertification = "";
	if (obj !=null){
		ArrayList<String> aList = (ArrayList)obj;
		System.out.println("aList.size() >>> : " + aList.size());
		memname = aList.get(0);
		mememail = aList.get(1);
		authcertification = aList.get(2);
		
		System.out.println("idEmailCheck memname >>> : " + memname);
		System.out.println("idEmailCheck mememail >>> : " + mememail);
		System.out.println("idEmailCheck authnum >>> : " + authcertification);
	}
	
%>
<h3>
본인확인 이메일 주소와  입력한 이메일 주소가 같아야, 인증번호를 받을 수 있습니다.
</h3>
<form name="idForm" id="idForm">
<table border="1">
<tr>
<td>이름</td>
<td><input type="text" name="memname" id="memname" value='<%= memname%>'  style="width:200px;"></td>
</tr>
<tr>
<td>이메일 주소</td>
<td>
	<input type="text" name="mememail" id="mememail" value='<%= mememail%>'  placeholder="" style="width:200px;">
	<button type="button" id="mcomfirm">인증번호받기</button>
</td>
</tr>
<tr>
<td>인증번호</td>
<td>
<input type="text" name="authcertification" id="authcertification" value='<%= authcertification%>' 
       placeholder="인증번호  6자리 숫자 입력" style="width:200px;"></td>
</tr>
<tr>
<td colspan="2" align="center">
<button type="button" id="idbtn">다음</button>
</td>
</tr>
</table> 
</form>
</body>
</html>