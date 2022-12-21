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
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<!-- 달력 -->

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/js/bootstrap.js"></script>
<!-- 달력 -->
<style>
<!-- 달력 -->
 body {
    color: #000;
    overflow-x: hidden;
    height: 100%;
    background-color: #C5CAE9 !important;
    background-repeat: no-repeat;
    padding: 0px !important;
}

.container-fluid {
    padding-top: 20px !important;
    padding-bottom: 20px !important;
}

.card {
  box-shadow: 0px 4px 8px 0px #7986CB;
}

input {
    writing-mode: horizontal-tb !important;
    font-style: ;
    font-variant-ligatures: ;
    font-variant-caps: ;
    font-variant-numeric: ;
    font-variant-east-asian: ;
    font-weight: ;
    font-stretch: ;
    font-size: ;
    font-family: ;
    text-rendering: auto;
    color: fieldtext;
    letter-spacing: normal;
    word-spacing: normal;
    line-height: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    display: inline-block;
    text-align: start;
    appearance: auto;
    -webkit-rtl-ordering: logical;
    cursor: text;
    background-color: field;
    margin: 0em;
    padding: 1px 2px;
    border-width: 2px;
    border-style: inset;
    border-color: -internal-light-dark(rgb(118, 118, 118), rgb(133, 133, 133));
    border-image: initial;
}

input:focus {
    -moz-box-shadow: none !important;
    -webkit-box-shadow: none !important;
    box-shadow: none !important;
    border: 1px solid #512DA8;
    outline-width: 0;
}

::placeholder {
    color: #fff;
    opacity: 1;
}

:-ms-input-placeholder {
    color: #fff;
}

::-ms-input-placeholder {
    color: #fff;
}

button:focus {
    -moz-box-shadow: none !important;
    -webkit-box-shadow: none !important;
    box-shadow: none !important;
    outline-width: 0;
}

.datepicker {
  background-color: #000 !important;
  color: #fff !important;
  border: none;
  padding: 10px !important;
} 

.datepicker-dropdown:after {
  border-bottom: 6px solid #000;
}

thead tr:nth-child(3) th {
  color: #fff !important;
  font-weight: bold;
  padding-top: 20px;
  padding-bottom: 10px;
}

.dow, .old-day, .day, .new-day {
  width: 40px !important;
  height: 40px !important;
  border-radius: 0px !important;
}

.old-day:hover, .day:hover, .new-day:hover, .month:hover, .year:hover, .decade:hover, .century:hover {
  border-radius: 6px !important;
  background-color: #eee;
  color: #000;
}

.active {
  border-radius: 6px !important;
  background-image: linear-gradient(#90CAF9, #64B5F6) !important;
  
  
  color: #000 !important;
}

.disabled {
  color: #616161 !important;
}

.prev, .next, .datepicker-switch {
  border-radius: 0 !important;
  padding: 20px 10px !important;
  text-transform: uppercase;
  font-size: 20px;
  color: #fff !important;
  opacity: 0.8;
}

.prev:hover, .next:hover, .datepicker-switch:hover {
  background-color: inherit !important;
  opacity: 1;
}

.cell {
  border: 1px solid #BDBDBD;
  margin: 2px;
  cursor: pointer;
}

.cell:hover {
  border: 1px solid #3D5AFE;
}

.cell.select {
  background-color: #3D5AFE;
  color: #fff;
}

.fa-calendar {
  color: #fff;
  font-size: 30px;
  padding-top: 8px;
  padding-left: 5px;
  cursor: pointer;
}
 
 <!----> 
  
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
<!-- 달력 자바스크립트 -->
<script type="text/javascript">
$(document).ready(function(){

	$('.datepicker').datepicker({
	    format: 'dd-mm-yyyy',
	    autoclose: true,
	    startDate: '0d'
	});

	$('.cell').click(function(){
	    $('.cell').removeClass('select');
	    $(this).addClass('select');
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
        <form class="validation-form" novalidate>
        
        <!-- 매치제목 -->
            <div class="mb-3">
              <label for="name"><b>매치 제목</b></label>
              <input type="text" class="form-control" id="name" placeholder="" value="" required>
              <div class="invalid-feedback">
                이름을 입력해주세요.
              </div>
          </div>
          
           <!-- 매치설명 -->
           <div class="mb-3">
			  <label for="minfo" class="form-label"><b>구장설명</b></label>
			  <textarea class="form-control" id="minfo" rows="5"></textarea>
		   </div>
          
            <!-- 우편번호 -->
          <div class="row">  
          <div class="col-md-6 mb-3">
            <label for="email"><b>우편번호</b></label>
            <input type="email" class="form-control" id="email" placeholder="우편번호" required>
			<div class="invalid-feedback">
                  우편번호를 입력해주세요.
            </div>
            </div>
            <div class="col-md-6 mb-3">
            <label for="email"> &nbsp;</label><br>
            <button type="button" class="btn btn-primary" id="midbtn">우편번호 찾기</button>
            </div>
            
            </div>
          
			<!-- 구장주소 -->
          <div class="mb-3">
            <label for="address"><b>구장 주소</b></label>
            <input type="text" class="form-control" id="address" placeholder="서울특별시 강남구" required>
            <div class="invalid-feedback">
              주소를 입력해주세요.
            </div>
          </div>
			<!-- 상세주소 -->
          <div class="mb-3">
            <label for="address2"><b>상세 주소</b><span class="text-muted">&nbsp;(필수 아님)</span></label>
            <input type="text" class="form-control" id="address2" placeholder="상세주소를 입력해주세요.">
          </div>


			<!-- 구장 주소 , 포지션  -->
          <div class="row">
            <div class="col-md-6 mb-3">
              <label for="root"><b>구장 지역</b></label>
             <select class="form-select" aria-label="Default select example">
                <option value=""></option>
                <option selected>서울</option>
                <option>경기</option>
                <option>인천</option>
              </select>
              <div class="invalid-feedback">
                구장지역을 선택해주세요.
              </div>
            </div>
            <div class="col-md-6 mb-3">
              <label for="root"><b>금액</b></label>
               <select class="form-select" aria-label="Default select example">
                <option value="10000"></option>
                <option selected>10000</option>
              </select>
              <div class="invalid-feedback">
                포지션을 선택해주세요.
              </div>
            </div>
            </div>
          <br>
          <!--  매치 포인트  -->
          <h4 class="mb-3"><b>매치 포인트</b></h4>
          <div class="row">
            <div class="col-md-6 mb-3">
              <label for="root"><b>레벨</b></label>
             <select class="form-select" aria-label="Default select example">
                <option value=""></option>
                <option>아마추어</option>
                <option>프로</option>
                <option selected>모든 레벨</option>
              </select>
              <div class="invalid-feedback">
                구장지역을 선택해주세요.
              </div>
            </div>
            
            <div class="col-md-6 mb-3">
              <label for="root"><b>성별</b></label>
               <select class="form-select" aria-label="Default select example">
                <option value=""></option>
                <option>남자만</option>
                <option>여자만</option>
                <option selected>남녀 모두</option>
              </select>
              <div class="invalid-feedback">
                포지션을 선택해주세요.
              </div>
            </div>
            </div>
            
            
     
          <!--  매치 포인트 끝  -->
          
          
          
            <!-- 구장 사진 첨부 -->
            <div class="mb-3">
			  <label for="formFileMultiple" class="form-label"><b>구장 사진 선택</b><span class="text-muted">&nbsp;(중복 가능)</span></label>
			  <input class="form-control" type="file" id="formFileMultiple" multiple>
			</div>
        
			<div class="container-fluid px-0 px-sm-4 mx-auto">
  <div class="row justify-content-center mx-0">
    <div class="col-lg-10">
      <div class="card border-0">
        <form autocomplete="off">
          <div class="card-header bg-dark">
            <div class="mx-0 mb-0 row justify-content-sm-center justify-content-start px-1">
              <input type="text" id="dp1" class="datepicker" placeholder="Pick Date" name="date" readonly><span class="fa fa-calendar"></span>
            </div>
          </div>
          <div class="card-body p-3 p-sm-5">
            <div class="row text-center mx-0">
              <div class="col-md-2 col-4 my-1 px-2"><div class="cell py-1">9:00AM</div></div>
              <div class="col-md-2 col-4 my-1 px-2"><div class="cell py-1">9:30AM</div></div>
              <div class="col-md-2 col-4 my-1 px-2"><div class="cell py-1">9:45AM</div></div>
              <div class="col-md-2 col-4 my-1 px-2"><div class="cell py-1">10:00AM</div></div>
              <div class="col-md-2 col-4 my-1 px-2"><div class="cell py-1">10:30AM</div></div>
              <div class="col-md-2 col-4 my-1 px-2"><div class="cell py-1">10:45AM</div></div>
            </div>
            <div class="row text-center mx-0">
              <div class="col-md-2 col-4 my-1 px-2"><div class="cell py-1">11:00AM</div></div>
              <div class="col-md-2 col-4 my-1 px-2"><div class="cell py-1">11:30AM</div></div>
              <div class="col-md-2 col-4 my-1 px-2"><div class="cell py-1">11:45AM</div></div>
              <div class="col-md-2 col-4 my-1 px-2"><div class="cell py-1">12:00PM</div></div>
              <div class="col-md-2 col-4 my-1 px-2"><div class="cell py-1">12:30PM</div></div>
              <div class="col-md-2 col-4 my-1 px-2"><div class="cell py-1">12:45PM</div></div>
            </div>
            <div class="row text-center mx-0">
              <div class="col-md-2 col-4 my-1 px-2"><div class="cell py-1">1:00PM</div></div>
              <div class="col-md-2 col-4 my-1 px-2"><div class="cell py-1">1:30PM</div></div>
              <div class="col-md-2 col-4 my-1 px-2"><div class="cell py-1">1:45PM</div></div>
              <div class="col-md-2 col-4 my-1 px-2"><div class="cell py-1">2:00PM</div></div>
              <div class="col-md-2 col-4 my-1 px-2"><div class="cell py-1">2:30PM</div></div>
              <div class="col-md-2 col-4 my-1 px-2"><div class="cell py-1">2:45PM</div></div>
            </div>
            <div class="row text-center mx-0">
              <div class="col-md-2 col-4 my-1 px-2"><div class="cell py-1">3:00PM</div></div>
              <div class="col-md-2 col-4 my-1 px-2"><div class="cell py-1">3:30PM</div></div>
              <div class="col-md-2 col-4 my-1 px-2"><div class="cell py-1">4:15PM</div></div>
              <div class="col-md-2 col-4 my-1 px-2"><div class="cell py-1">5:00PM</div></div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>        
        
        
        
        
        
           <!-- 동의 체크 -->
          <hr class="mb-4">
          <div class="custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" id="aggrement" required>
            <label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
          </div>
          <div class="mb-4"></div>
          <button class="btn btn-primary btn-lg btn-block" type="submit">가입 완료</button>
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