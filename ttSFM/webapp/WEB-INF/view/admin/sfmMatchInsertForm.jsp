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
  <!--------------------달력 ---------------- -->
  <link rel="stylesheet" href="//mugifly.github.io/jquery-simple-datetimepicker/jquery.simple-dtpicker.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="//mugifly.github.io/jquery-simple-datetimepicker/jquery.simple-dtpicker.js"></script>
<script>

	$(function(){
	    $('.datetimepicker').appendDtpicker({'locale':'ko'});
	});
	
</script>
<!-----------------------달력------------  -->
  <!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous"
      integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

	function kakaopost(){
		   new daum.Postcode({
		      oncomplete: function(data) {
		          document.querySelector("#matchzonecode").value = data.zonecode;
		          document.querySelector("#matchjibunaddress").value =  data.address
		        }
	  	 }).open();
	};
	
</script>
<style>
  
  	.p-3 {
    	padding: 1rem!important;
	}
  
  	.form-control {
	    display: block;
	    width: 100%;
	    padding: 0.375rem 0.75rem;
	    font-size: 1rem;
	    font-weight: 400;
	    line-height: 1.5;
	    color: #212529;
	    background-color: #fff;
	    background-clip: padding-box;
	    border: 1px solid #ced4da;
	    -webkit-appearance: none;
	    -moz-appearance: none;
	    appearance: none;
	    border-radius: 0.25rem;
	    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
	}
  
    body {
	      min-height: 100vh;
	
  background:url("/testServlet/img/img/fb/jandigu.jpg") no-repeat;
  background-repeat: no-repeat;
  background-size: cover;
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
<!-- 달력 자바스크립트 -->
<script type="text/javascript">

	$(document).ready(function(){
	
     	$(function() {
    		$('#matchtime').datepicker({
    		    format: 'yyyy-mm-dd',
    		    autoclose: true,
    		    startDate: '0d'
    		});
    	});
	
		$('.cell').click(function(){
		    $('.cell').removeClass('select');
		    $(this).addClass('select');
		});
		
		$('#btn').on('click', function(){
			alert("btn 버튼 클릭");
			console.log("btn 보내기 >>> : ");	

			var matchlv = $("#matchlv").val();
			var matchgender = $("#matchgender").val();
			var matchsuit = $("#matchsuit").val();
			var matchshose = $("#matchshose").val();
			var matchshower = $("#matchshower").val();
			var matchpersonnel = $("#matchpersonnel").val();
			var matchtime = $("#matchtime").val();

			$('#stadiuminsertform').attr({
				'action':'sfmMatchInsert.sfm',
				'method':'POST',
				'enctype':'multipart/form-data'
			}).submit();
		});

	});
	
</script>
<!-- 달력 자바스크립트 -->
<body>
  <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <br>
        <h4 class="mb-3"><b>구장 등록</b></h4>
        <br>
        <form class="validation-form" id="stadiuminsertform" novalidate>
        
        <!-- 매치제목 -->
            <div class="mb-3">
              <label for="name"><b>매치 제목</b></label>
              <input type="text" class="form-control" id="matchstadium" name="matchstadium" placeholder="" value="" required>
              <div class="invalid-feedback">
                이름을 입력해주세요.
              </div>
          </div>
          
           <!-- 우편번호 -->
          <div class="row">  
          <div class="col-md-6 mb-3">
            <label for="email"><b>우편번호</b></label>
            <input type="email" class="form-control" id="matchzonecode" name="matchzonecode" placeholder="우편번호" required>
			<div class="invalid-feedback">
                  우편번호를 입력해주세요.
            </div>
            </div>
            
            <div class="col-md-6 mb-3">
            <label for="text"> &nbsp;</label><br>
            <button type="button" class="btn btn-primary" id="matchzonecodebtn" onclick="kakaopost()">우편번호 찾기</button>
            </div>
           </div>
            
			<!-- 구장주소 -->
         <div class="row">
          <div class="col-md-6 mb-3">
            <label for="address"><b>구장 주소</b></label>
            <input type="text" class="form-control" id="matchjibunaddress" name="matchjibunaddress" placeholder="서울특별시 강남구" required>
            <div class="invalid-feedback">
              주소를 입력해주세요.
            </div>
          </div>
          
			<div class="col-md-6 mb-3">
              <label for="root"><b>구장 지역</b></label>
             <select class="form-select" aria-label="Default select example" id="mempreferredarea" name="mempreferredarea">
                <option value=""></option>
                <option value="서울" selected>서울</option>
                <option value="경기">경기</option>
                <option value="인천">인천</option>
              </select>
              <div class="invalid-feedback">
                구장지역을 선택해주세요.
              </div>
            </div>
			</div>

			<!-- 구장 주소 , 시간  -->
          <div class="row">
             <!---------------------- 달력 --------------------> 
           <div class="col-md-6 mb-3">
            <label for="root"><b>매치 시작 시간 </b></label>
          	 <input type="text" name="matchkickoff" id="matchkickoff" value="matchkickoff" class="datetimepicker form-control" />
           </div>
             <!---------------------- 달력 --------------------> 
            
           </div>
          <br>
          <!--  매치 포인트  -->
          <h4 class="mb-3"><b>매치 포인트</b></h4>
          <div class="row">
            <div class="col-md-6 mb-3">
              <label for="root"><b>매치 레벨</b></label>
             <select class="form-select" id="matchlv" name="matchlv" aria-label="Default select example">
                <option value=""></option>
                <option value="아마추어">아마추어</option>
                <option value="프로">프로</option>
                <option value="모든 레벨" selected>모든 레벨</option>
              </select>
              <div class="invalid-feedback">
                구장지역을 선택해주세요.
              </div>
            </div>
            
            <div class="col-md-6 mb-3">
              <label for="root"><b>성별</b></label>
               <select class="form-select" id="matchgender" name="matchgender" aria-label="Default select example">
                <option value=""></option>
                <option value="남자만">남자만</option>
                <option value="여자만">여자만</option>
                <option value="남녀 모두" selected>남녀 모두</option>
              </select>
              <div class="invalid-feedback">
                포지션을 선택해주세요.
              </div>
            </div>
           
              <div class="col-md-6 mb-3">
              <label for="root"><b>매치인원</b></label>
               <select class="form-select" id="matchpersonnel " name="matchpersonnel" aria-label="Default select example" >
       			<option selected>6vs6</option>
       			<option selected>7vs7</option>
       			<option selected>8vs8</option>
              </select>
              <div class="invalid-feedback">
              </div>
              </div>
              
            <div class="col-md-6 mb-3">
              <label for="root"><b>매치시간</b></label>
               <select class="form-select" id="matchtime" name="matchtime " aria-label="Default select example" >
       			<option selected>1시간 30분 매치</option>
       			<option selected>2시간 매치</option>
       			<option selected>3시간 매치</option>
              </select>
              <div class="invalid-feedback">
              </div>
              </div>
              </div>
          <!--  매치 포인트 끝  -------------------------->
          <br>
           <!------------------  경기장 정보  ----------------->
          <h4 class="mb-3"><b>경기장 정보</b></h4>
          <div class="row">
            <div class="col-md-6 mb-3">
              <label for="root"><b>주차</b></label>
             <select class="form-select" id="matchparking" name="matchparking" aria-label="Default select example">
                <option value=""></option>
                <option value="무료주차" selected>무료주차</option>
                <option value="유료주차">유료주차</option>
              </select>
              <div class="invalid-feedback">
                구장지역을 선택해주세요.
              </div>
            </div>
            
            <div class="col-md-6 mb-3">
              <label for="root"><b>샤워실</b></label>
               <select class="form-select" id="matchshower" name="matchshower" aria-label="Default select example">
                <option value=""></option>
                <option value="샤워실" selected>샤워실</option>
                <option value="샤워실 없음">샤워실 없음</option>
              </select>
              <div class="invalid-feedback">
                포지션을 선택해주세요.
              </div>
            </div>
            </div>
          <div class="row">
            <div class="col-md-6 mb-3">
              <label for="root"><b>풋살화 대여</b></label>
             <select class="form-select" id="matchshose" name="matchshose" aria-label="Default select example">
                <option value=""></option>
                <option value="풋살화 대여" selected>풋살화 대여</option>
                <option value="풋살화 대여 없음">풋살화 대여 없음</option>
              </select>
              <div class="invalid-feedback">
                구장지역을 선택해주세요.
              </div>
            </div>
            
            <div class="col-md-6 mb-3">
              <label for="root"><b>운동복 대여</b></label>
               <select class="form-select" id="matchsuit" name="matchsuit" aria-label="Default select example">
                <option value=""></option>
                <option value="운동복 대여" selected>운동복 대여</option>
                <option value="운동복 대여 없음">운동복 대여 없음</option>
              </select>
              <div class="invalid-feedback">
                선택해주세요.
              </div>
            </div>
            </div>
            
            <!-- 구장 사진 첨부 -->
            <div class="mb-3">
			  <label for="formFileMultiple" class="form-label"><b>구장 사진 선택</b><span class="text-muted">&nbsp;(중복 가능)</span></label>
			  <input class="form-control" type="file" id="matchfile" name="matchfile" multiple>
			</div>
        
           <!-- 동의 체크 -->
          <hr class="mb-4">
          <div class="custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" id="aggrement" required>
            <label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
          </div>
          <div class="mb-4"></div>
          <button class="btn btn-primary btn-lg btn-block" type="submit" id="btn">등록 완료</button>
        </form>
      </div>
    </div>
    <footer class="my-3 text-center text-small">
      <p class="mb-1">&copy; 2022 YD</p>
    </footer>
  </div>
  <script>
  </script>
</body>

</html>