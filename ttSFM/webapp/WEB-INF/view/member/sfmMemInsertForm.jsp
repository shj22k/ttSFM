<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원가입 화면 샘플 - Bootstrap</title>

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	
   <!-- 우편번호 찾기 다음api -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

	function kakaopost(){
		   new daum.Postcode({
		      oncomplete: function(data) {
		          document.querySelector("#memzonecode").value = data.zonecode;
		          document.querySelector("#memjibunaddress").value =  data.address
		        }
	  	 }).open();
	};	
	
	$(document).ready(function(){
		$(document).on("click", "#idCheck", function(){
			// idCheck.sfm 은 따로 jsp파일이 존재하지 않고, @ResponseBody로서 컨트롤러에 존재한다.
			// memid: $("#memid").val() -> input text의 memid에 값이 들어온 것이 전달된다.
			let idCheckURL = "sfmIdCheck.sfm";
			let reqType = "POST";
			let dataParam = { memid: $("#memid").val(), };
			
			$.ajax({
				url: idCheckURL,
				type: reqType,								
				data: dataParam,	            
				success: whenSuccess,
				error: whenError
			});
			
			function whenSuccess(resData){	
				
				var id = $("#memid").val();
				if ("ID_YES" == resData){
					if(id == ''){
						alert("아이디를 입력해 주세요.");
						$("#memid").focus();
						return false;
					}
					alert("사용가능한 아이디 입니다.");														
					$("#memid").css('background-color','gray');	
					$("#memid").focus();	
				}else if ("ID_NO" == resData){
					alert("아이디가 사용중입니다. 다른 아이디를 입력해 주세요.");
					$("#memid").val('');
					$("#memid").focus();
				};				
			}
			function whenError(e){
				alert("e >>> : " + e.responseText);
			}
		});
			
		// 비밀번호 체크
		$("#pwCheck").click(function(){
			console.log("pwCheck >>> : ");

			var pw = $("#mempw").val();
			var pw_r = $("#mempw_r").val();
			if(pw == pw_r) {
				if(pw == '' || pw_r == ''){
					alert("빈칸에 비밀번호를 입력해 주세요.");
					$("#mempw").val('');
					$("#mempw_r").val('');			
					$("#mempw").focus();	
					return false;
				}
				alert("비밀번호가 같습니다.");
				$("#mememail").focus();						
				return true;
			}else {
				alert("비밀번호가 다릅니다.");
				$("#mempw").val('');
				$("#mempw_r").val('');			
				$("#mempw").focus();							
				return false;
			}
		});
		
		$('#meminsert').on('click', function(){
			$('#memform').attr({
				'action':'sfmMemInsert.sfm',
				'method':'POST',
				'enctype':'multipart/form-data'
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
</style>
</head>
<body>
  <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <br>
        <h4 class="mb-3"><b>회원가입</b></h4>
        <br>
        <form class="validation-form" id="memform" name="memform" novalidate>
            <div class="mb-3">
              <label for="name"><b>이름</b></label>
              <input type="text" class="form-control" id="memname" name="memname" placeholder="" value="" required>
              <div class="invalid-feedback">
                이름을 입력해주세요.
              </div>
            </div>
          
           <!-- 성별  --> 
        <div class="mb-3">
		  <div class="custom-control custom-radio custom-control-inline">
		  <input type="radio" id="memgender" name="memgender" class="custom-control-input" value="M" checked>
		  <label class="custom-control-label" for="M">남자</label>
		</div>
		<div class="custom-control custom-radio custom-control-inline">
		  <input type="radio" id="memgender" name="memgender" class="custom-control-input" value="F">
		  <label class="custom-control-label" for="F">여자</label>
		</div>
        </div>
         
         <!-- 아이디 -->
          <div class="mb-3">
              <label for="id"><b>아이디</b></label>
              <input type="text" class="form-control" id="memid" name="memid" placeholder="" value="" required>
              <div class="invalid-feedback">
                아이디를 입력해주세요.
              </div>
               <div class="mb-3">
			    <button type="submit" class="btn btn-primary mb-3" id="idCheck">아이디 중복체크</button>
			  </div>
            </div>
            
         <!-- 비밀번호 -->
          <div class="mb-3">
            <label for="pw"><b>비밀번호</b></label>
            <input type="text" class="form-control" id="mempw" name="mempw" placeholder="****" required>
             <input type="text" class="form-control" id="mempw_r" name="mempw_r" placeholder="****" required>
             <input type="button" class="btn btn-primary" value="비밀번호확인" id="pwCheck"/>            
             <div class="invalid-feedback">
                 비밀번호를 입력해주세요.
            </div>
          </div>
             <!-- 회원사진 -->
            <div class="mb-3">
             <label for="memphoto"><b>사진업로드</b></label>
             <input class="form-control" type="file" id="memphoto" name="memphoto">
              
            </div>
           <div class="mb-3">
           <label for="email"><b>이메일</b></label>
           <input type="email" class="form-control" id="mememail" name="mememail" placeholder="tikitaka@example.com" required>
           <div class="invalid-feedback">
                 이메일을 입력해주세요.
          </div>
          </div> 
          
          <div class="row">
          <div class="col-md-3 mb-3">
              <label for="root"><b>전화번호</b></label>
              <select class="custom-select d-block w-100" id="memhp" name="memhp">
                <option value=""></option>
                <option value="010" selected>010</option>
                <option value="011">011</option>
                <option value="016">016</option>
                <option value="017">017</option>
              </select>
              <div class="invalid-feedback">
                 전화번호를 입력해주세요.
              </div>
            </div>
          <div class="col-md-3 mb-3">
          <label for="root"><b>&nbsp;</b></label>
           <input type="text" class="form-control" id="memhp1" name="memhp1" placeholder="1111" maxlangth="4" required>
           <div class="invalid-feedback">
                 전화번호를 입력해주세요.
          </div>
          </div>
          <div class="col-md-3 mb-3">
          <label for="root"><b>&nbsp;</b></label>
           <input type="text" class="form-control" id="memhp2" name="memhp2" placeholder="2222" required>
           <div class="invalid-feedback">
                 전화번호를 입력해주세요.
          </div>
          </div> 
           
          </div>
            
          <div class="row">  
          <div class="col-md-6 mb-3">
            <label for="zonecode"><b>우편번호</b></label>
            <input type="text" class="form-control" id="memzonecode" name="memzonecode" placeholder="우편번호" required>
			<div class="invalid-feedback">
                  우편번호를 입력해주세요.
            </div>
            </div>
            <div class="col-md-6 mb-3">
            <label for="email"> &nbsp;</label><br>
            <input type="button" class="btn btn-primary"  value="우편번호 찾기" onclick="kakaopost()">
            </div>
            </div>

          <div class="mb-3">
            <label for="address"><b>주소</b></label>
            <input type="text" class="form-control" id="memjibunaddress" name="memjibunaddress" placeholder="서울특별시 강남구" required>
            <div class="invalid-feedback">
              주소를 입력해주세요.
            </div>
          </div>

          <div class="mb-3">
            <label for="address2"><b>상세 주소</b><span class="text-muted">&nbsp;(필수 아님)</span></label>
            <input type="text" class="form-control" id="memjibunaddressdetail" name="memjibunaddressdetail" placeholder="상세주소를 입력해주세요.">
          </div>

          <div class="row">
            <div class="col-md-6 mb-3">
              <label for="root"><b>포지션</b></label>
              <select class="custom-select d-block w-100" id="memposition" name="memposition">
                <option value=""></option>
                <option value="공격수">공격수</option>
                <option value="미드필더">미드필더</option>
                <option value="수비수">수비수</option>
                <option value="골키퍼">골키퍼</option>
                <option value="상관없음" selected>상관없음</option>
              </select>
              <div class="invalid-feedback">
                포지션을 선택해주세요.
              </div>
            </div>
            <div class="col-md-6 mb-3">
              <label for="root"><b>선호 지역</b></label>
              <select class="custom-select d-block w-100" id="mempreferredarea" name="mempreferredarea">
                <option value=""></option>
                <option value="서울" selected>서울</option>
                <option value="경기">경기</option>
                <option value="인천">인천</option>
              </select>
              <div class="invalid-feedback">
                선호지역을 선택해주세요.
              </div>
            </div>
            </div>
            
          <hr class="mb-4">
          <div class="custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" id="aggrement" required>
            <label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
          </div>
          <div class="mb-4"></div>
          	<input type="hidden" id="memhp" name="memhp" value="" />
          <button class="btn btn-primary btn-lg btn-block" type="submit" id="meminsert" name="meminsert">가입 완료</button>
        </form>
      </div>
    </div>
    <footer class="my-3 text-center text-small">
      <p class="mb-1">&copy; TIKI TAKA</p>
    </footer>
  </div>
  <script>
  </script>
</body>

</html>