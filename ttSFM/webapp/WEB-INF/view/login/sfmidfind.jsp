<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

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
<style>

  body {
    min-height: 100vh;

    background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c));
    background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
    background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
    background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
    background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%);
  }

  .input-form {
    max-width: 680px;

    margin-top: 80px;
    padding: 32px;

    background: #fff;
    -webkit-border-radius: 10px;
    -moz-border-radius: 10px;
    border-radius: 10px;
    -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
    -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
    box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
  }
  
  .table td, .table th {
    padding: 0.75rem;
    vertical-align: middle;
    border-top: 1px solid #dee2e6;
}
</style>

</head>
<body>


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

 <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
<br>
<h3><b>아이디 찾기</b><br></h3>
<br>
<p>본인확인 이메일 주소와  입력한 이메일 주소가 같아야, 인증번호를 받을 수 있습니다.<p>
<form name="idForm" id="idForm">
<table class="table">
<tr>
<td>이름</td>
<td><input style="width: 40%;" class="form-control" type="text" name="memname" id="memname" value='<%= memname%>'  style="width:200px;"></td>
</tr>
<tr>
<td>이메일 주소</td>
<td>
	<input style="width: 40%;float:left" class="form-control" type="text" name="mememail" id="mememail" value='<%= mememail%>'  placeholder=""><input style="float:left; margin-left:10px" type="button" class="btn btn-primary" value="인증번호 받기" id="mcomfirm"/>
</td>
</tr>
<tr>
<td>인증번호</td>
<td>
<input style="width:40%;" class="form-control" type="text" name="authcertification" id="authcertification" value='<%= authcertification%>' 
       placeholder="인증번호  6자리 숫자 입력"></td>
</tr>
<tr>
<td colspan="2" align="right">
<input style="width:15%;" type="button" class="btn btn-primary" value="다음" id="idbtn"/>
</td>
</tr>
</table> 
</form>
</div>
</div>
</div>
</body>
</html>