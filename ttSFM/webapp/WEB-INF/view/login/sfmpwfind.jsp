<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PWFIND</title>
  
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

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


<body>

 <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
<br>
<h3><b>비밀번호 찾기</b><br></h3>
<br>
<p>본인확인 이메일 주소와  입력한 이메일 주소가 같아야, 인증번호를 받을 수 있습니다.<p>
<form name="pwForm" id="pwForm">
<table class="table">
<tr>
<td>아이디</td>
<td><input style="width: 40%;" class="form-control" type="text" name="memid" id="memid" style="width:200px;"></td>
</tr>
<tr>
<td>이메일</td>
<td>
   <input style="width: 40%;float:left" class="form-control" type="text" name="mememail" id="mememail" placeholder="">
   <input style="float:left; margin-left:10px" type="button" class="btn btn-primary" value="임시비밀번호 받기" id="emailbtn"/>
</td>
</tr>
<tr>
<td>임시 비밀번호</td>
<td>
<input style="width:40%;" class="form-control" type="text" name="pwcertification" id="pwcertification" placeholder="임시비밀번호  10자리 입력"></td>
</tr>
<tr>
<td colspan="2" align="right">
<button type="button" class="btn btn-primary" id="pwbtn">다음</button>
</td>
</tr>
</table> 
</form>
</div>
</div>
</div>

</body>
</html>