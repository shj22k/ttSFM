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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

	function kakaopost(){
		   new daum.Postcode({
		      oncomplete: function(data) {
		          document.querySelector("#zonecode").value = data.zonecode;
		          document.querySelector("#address").value =  data.address
		        }
	  	 }).open();
	};	

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
        <h4 class="mb-3"><b>회원수정</b></h4>
        <br>
        <form class="validation-form" id="memberinsertform" novalidate>
            <div class="mb-3">
              <label for="name"><b>이름</b></label>
              <input type="text" class="form-control" id="name" placeholder="" value="" required readonly>
              <div class="invalid-feedback">
                이름을 입력해주세요.
              </div>
          </div>
          
           <!-- 성별  --> 
          <div class="mb-3">
		  <div class="custom-control custom-radio custom-control-inline">
		  <input type="radio" id="M" name="mgender" class="custom-control-input" checked>
		  <label class="custom-control-label" for="M">남자</label>
		</div>
		<div class="custom-control custom-radio custom-control-inline">
		  <input type="radio" id="F" name="mgender" class="custom-control-input">
		  <label class="custom-control-label" for="F">여자</label>
		</div>
         </div>
         
         <!-- 아이디 -->
          <div class="mb-3">
              <label for="memid"><b>아이디</b></label>
              <input type="text" class="form-control" id="memid" placeholder="tikitaka123" value="" required readonly>
              <div class="invalid-feedback">
                아이디를 입력해주세요.
              </div>
          </div>
            
         <!-- 비밀번호 -->
          <div class="mb-3">
            <label for="mempw"><b>비밀번호</b></label>
            <input type="text" class="form-control" id="mempw" placeholder="****" required>
             <input type="text" class="form-control" id="mempw_r" name="mempw_r" placeholder="****" required>
             <input type="button" class="btn btn-primary" value="비밀번호확인" id="pwCheck"/>            
             <div class="invalid-feedback">
                 비밀번호를 입력해주세요.
            </div>
          </div>
            
           <div class="mb-3">
           <label for="mememail"><b>이메일</b></label>
           <input type="text" class="form-control" id="mememail" placeholder="tikitaka@example.com" required>
           <div class="invalid-feedback">
                 이메일을 입력해주세요.
          </div>
          </div> 
            
          <div class="row">  
          <div class="col-md-6 mb-3">
            <label for="memzonecode"><b>우편번호</b></label>
            <input type="text" class="form-control" id="memzonecode" placeholder="우편번호" required>
			<div class="invalid-feedback">
                  우편번호를 입력해주세요.
            </div>
            </div>
            <div class="col-md-6 mb-3">
            <label for="memzonecode"> &nbsp;</label><br>
            <input type="button" class="btn btn-primary"  value="우편번호 찾기" onclick="kakaopost()">
            </div>
            
            </div>
          

          <div class="mb-3">
            <label for="memjibunaddress"><b>주소</b></label>
            <input type="text" class="form-control" id="address" placeholder="서울특별시 강남구" required>
            <div class="invalid-feedback">
              주소를 입력해주세요.
            </div>
          </div>

          <div class="mb-3">
            <label for="memroadaddress"><b>상세 주소</b><span class="text-muted">&nbsp;(필수 아님)</span></label>
            <input type="text" class="form-control" id="memroadaddress" placeholder="상세주소를 입력해주세요.">
          </div>

          <div class="row">
            <div class="col-md-6 mb-3">
              <label for="root"><b>선호 포지션</b></label>
              <select class="custom-select d-block w-100" id="memposition">
                <option value=""></option>
                <option>공격수</option>
                <option>미드필더</option>
                <option>수비수</option>
                <option>골키퍼</option>
                <option selected>상관없음</option>
              </select>
              <div class="invalid-feedback">
                포지션을 선택해주세요.
              </div>
            </div>
            <div class="col-md-6 mb-3">
              <label for="root"><b>선호 지역</b></label>
              <select class="custom-select d-block w-100" id="memaddr">
                <option value=""></option>
                <option selected>서울</option>
                <option>경기</option>
                <option>인천</option>
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
          <button class="btn btn-primary btn-lg btn-block" type="submit" id="loginformgo" onclick="">가입 완료</button>
        </form>
      </div>
    </div>
    <footer class="my-3 text-center text-small">
      <p class="mb-1">&copy; 2023 TIKI TAKA</p>
    </footer>
  </div>
  <script>
  </script>
</body>

</html>