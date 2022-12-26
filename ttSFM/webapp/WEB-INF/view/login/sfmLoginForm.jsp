<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="/ttSFM/include/Login.css">

<style type="text/css">
@import url("https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css");
@import url("https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css");
@import url("https://cdnjs.cloudflare.com/ajax/libs/hamburgers/0.9.3/hamburgers.min.css");
@import url("https://cdnjs.cloudflare.com/ajax/libs/select2-bootstrap-css/1.4.6/select2-bootstrap.min.css");

</style>
</head>
<body>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		alert("sfmLoginForm.jsp ready 함수 시작 ===");
		$("#memid").attr('placeholder', '아이디 ');
		$("#mempw").attr('placeholder', '비밀번호 ');
		
		$(document).on("click", "#loginbtn", function(){
			alert("springLoginForm.jsp 로그인 버튼 클릭");
			
			$("#Login").attr({
				"action":"sfmLogin.sfm",
				"method":"POST",
				'enctype':'application/x-www-form-urlencoded'
			}).submit();
		});
	});


</script>


<!------ Include the above in your HEAD tag ---------->
<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-pic js-tilt" data-tilt>
					<img src="/ttSFM/img/img/img_tt/LoginBall_1.jpg" style="width:450px; height:380px" alt="IMG">
				</div>

				<form class="login100-form validate-form" id="Login">
					<span class="login100-form-title">
					
					<img src="/ttSFM/img/img/img_tt/tg.jpg" style="width:60px">TIKI TAKA Login
					</span>

					<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
						<input class="input100" type="text" id="memid" name="memid" placeholder="ID">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input" data-validate = "Password is required">
						<input class="input100" type="password" id="mempw" name="mempw" placeholder="PASSWORD">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>

					<div class="container-login100-form-btn">
						<button class="login100-form-btn" id="loginbtn">
							Login
						</button>
					</div>
					<br>
					<div> 
						<a href="javascript:kakaoLoginApi()">
				         <img height="60" width="280" src="/ttSFM/img/img/img_tt/kakao.jpg" style="width:180px"/></a>			       
				         <img height="60" width="280" src="/ttSFM/img/img/img_tt/naver.png" style="width:180px"/></a>
				   </div>
					
					<div class="text-center p-t-12">
						<span class="txt1">
							Forgot
						</span>
						<a class="txt2" href="#">
							Username / Password?
						</a>
					</div>

					<div class="text-center p-t-136">
						<a class="txt2" href="sfmMemInsertForm.sfm">
							Create your Account
							<i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>
</html>