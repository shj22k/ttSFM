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
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- 카카오 로그인 api  -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<script type="text/javascript">

	//카카오 로그인 ===================================================================================
	window.Kakao.init('237cf63d102ae9906251cdddc198259f'); // 사용하려는 앱의 JavaScript 키 입력
	function kakaoLoginApi() {
	   window.Kakao.Auth.login({
	      success: function(authObj){
	         // console.log( "authObj >>> : " + JSON.stringify(authObj));   
	         window.Kakao.API.request({
	            url: '/v2/user/me',
	            success : function(res) {
	               console.log( "res  >>> : " + JSON.stringify(res));                   
	                        
	                    let k_id = res.id;
	                    let k_email = res.kakao_account.email;
	                    
	                    $("#snsid").val(k_id);
	                    $("#snsemail").val(k_email);
	                    $("#snstype").val("01");
	                    console.log("k_id >>> : " + k_id);
	                    console.log("k_email >>> : " + k_email);
	                    
	                    kakaoLogin(k_id, k_email);                  
	            }
	         });            
	      }
	   });
	}
	
	function kakaoLogin(k_id, k_email) {
		   
		   $("#kakaologin").attr({
			      "action":"kakaoLogin.sfm",
			      "method":"POST",
			      'enctype':'application/x-www-form-urlencoded'
			}).submit();		   
		}
	//카카오 로그인 ===================================================================================

	$(document).ready(function(){
		$("#memid").attr('placeholder', '아이디 ');
		$("#mempw").attr('placeholder', '비밀번호 ');
		
		$(document).on("click", "#loginbtn", function(){
			
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
					<img src="/ttSFM/img/fb/tikilogo2.png" style="width:370px; height:170px" alt="IMG">
				</div>

				<form class="login100-form validate-form" id="Login">
					<span class="login100-form-title">
					Login
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
						
						<a class="txt2" href="sfmidfind.sfm">
							아이디 찾기
						</a>
						<span class="txt1">
							/
						</span>
						<a class="txt3" href="sfmpwfind.sfm">
							비밀번호 찾기
						</a>
					</div>
					<div class="text-center p-t-136">
						<a class="txt2" href="sfmMemInsertForm.sfm">
							회원가입
							<i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
						</a>
					</div>
				</form>
				<form id="kakaologin" name="kakaologin">
	               <tr>
	                  <td>
		                  <input type="hidden" id="snsid" name="snsid" value="k_id"/>
		                  <input type="hidden" id="snsemail" name="snsemail" value="k_email"/>
		                  <input type="hidden" id="snstype" name="snstype" value="01"/>
	                  </td>
	               </tr>
	            </form>
			</div>
		</div>
	</div>

</body>
</html>