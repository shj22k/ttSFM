<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="java.util.List"%> 
<%@ page import="main.sfm.member.vo.SfmMemVO"%> 

<%
	String memnum = "";

	Object obj = request.getAttribute("listLogin");
	List<SfmMemVO> list = (List<SfmMemVO>)obj;	
	
	memnum = list.get(0).getMemnum();
	System.out.print("memnum >>> : " + memnum);

	session.setAttribute("memnum", memnum);
%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>티키타카</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
 <!-- ------------------css 선언 시작 -------------------------------------------- -->
  <!--  케러셀 컨테이너 색상정하기  -->
  <style>
  
    .carousel-inner > .carousel-item > img{
       width: 700px;
      height: 500px;
    }
    
    #searchbar{
	margin-left: 36px;
	margin-left: 2.250rem;
	height: 34px;
	height: 2.125rem;
	padding: 15px 0;
	padding: 1em 0;
}

/* 상단바 버튼 영역 */
#btnarea{
	text-align: right;
	padding-bottom:15px;
	padding-bottom:1rem;
}

/* 상단바 메뉴영역 */
#naviarea{
	background-color: #EAEAEA;
}

#naviarea ul:after{
	content: "";
	display: block;
	clear: both;
}

#naviarea ul{
	padding: 0;
}

/* 메뉴 버튼 */
#naviarea ul > li{
	list-style: none;
	float: left;
	width: 25%;
}

/* 메뉴버튼 */
#naviarea ul > li .nav_btn{
	width: 100%;
	text-align: center;
	padding: 10px 0;
	padding: 1.3rem 0;
	font-size: 135%;
}

/* 메뉴버튼에 마우스를 올렸을때 */
#naviarea ul > li .nav_btn:hover{
	background-color: #D1D1D1;
}

#naviarea ul a{
	text-decoration: none;
	font-weight:bold;
	color: black;
}
<!---------------------------------------------------->
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
      background: linear-gradient(to top right, #ffffff 0%, #000000 100%);
    }

    .input-form {
      max-width: 1300px;

      margin-top: -22px;
      padding: 32px;

      background: #fff;
      
      -webkit-border-radius: 10px;
      
      -moz-border-radius: 10px;
      border-radius: 10px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      z-index: 1;
    }
  </style>
</head>
<!-- ------------------css 선언 끝 -------------------------------------------- -->
<body>

  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
    crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
    integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
    crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
    integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
    crossorigin="anonymous"></script>
  <script>
    $('.carousel').carousel({
      interval: 2000 //기본 5초
    })
    
  </script>

<!-- ---------------------------시작-------------------------------------------------------------- -->
<!-- 전체 양 옆 여백 조절하기 -->
<div style="padding:0px 400px 0px 400px;">
<!-- 상단 로고 -->
<div class="container"><img src="/ttSFM/img/fb/tikilogo.png" width="100px"><h2 style="color: white;">Tiki Taka 관리자 페이지</h2></div>
<!------------------------------ 메뉴 2 ----------------------------->


<!------------------------------ 메뉴 2 ------------->

 <!--------------  슬라이드 ---------------------------------------------------------------- -->		
 <div class="carousel--container">
 <div id="demo" class="carousel slide" data-ride="carousel">
    <div class="carousel-inner">
      <!-- 슬라이드 쇼 -->
      <div class="carousel-item active">
        <!--가로-->
        <img class="d-block w-100" 
          src="/ttSFM/img/fb/fb1.jpg"
          alt="First slide">
          <div class="carousel-caption d-none d-md-block">
              <h5>서울 대공원</h5>
              <p>구장 사진</p>
        </div>
      </div>
      <div class="carousel-item">
        <img class="d-block w-100"
          src="/ttSFM/img/fb/fb2.jpg"
          alt="Second slide">
      </div>
      <div class="carousel-item">
        <img class="d-block w-100"
          src="/ttSFM/img/fb/fb3.jpg"
          alt="Third slide">
      </div>

    <!-- 왼쪽 오른쪽 화살표 버튼 -->
    <a class="carousel-control-prev" href="#demo" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <!-- <span>Previous</span> -->
    </a>
    <a class="carousel-control-next" href="#demo" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <!-- <span>Next</span> -->
    </a>
    <!-- / 화살표 버튼 끝 -->
    
    <!-- 인디케이터 -->
    <ul class="carousel-indicators">
      <li data-target="#demo" data-slide-to="0" class="active"></li> <!--0번부터시작-->
      <li data-target="#demo" data-slide-to="1"></li>
      <li data-target="#demo" data-slide-to="2"></li>
    </ul>
    <!-- 인디케이터 끝 -->
  </div>
</div>
</div>
<!--------------  슬라이드 끝 ---------------------------------------------------------------- -->	
<!-- -------------------------- 메뉴--------------------------------------------------------- --> 
  <div id="naviarea">
		<header id="topbar">
			<ul class="wrapper">
				<!-- 메뉴버튼들 ----------------------->
				<li>
					<a href="sfmMatchInsertForm.sfm" onfocus="this.blur()">
						<div class="nav_btn">
							구장등록
						</div>
					</a>
				</li>
				<li>
					<a href="stadiuminsertform.sfm" onfocus="this.blur()">
						<div class="nav_btn">
							회원수정
						</div>
					</a>
				</li>
				<li>
	               <a href="sfmNoticeInsertForm.sfm?memnum=<%=memnum%>"onfocus="this.blur()">
	                  <div class="nav_btn">
	                     	공지사항
	                  </div>
	               </a>
	            </li>
				<li>
					<a href="stadiuminsertform.sfm" onfocus="this.blur()">
						<div class="nav_btn">
							이벤트
						</div>
					</a>
				</li>
			</ul>
			</header>
			
		</div>
 <!-- ------------ 메뉴 끝--------------------------------------------------------- -->
 <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <br>
        <h4 class="mb-3"><b>관리자 페이지</b></h4>
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
          
           <!-- 구장설명 -->
           <div class="mb-3">
			  <label for="minfo" class="form-label"><b>구장설명</b></label>
			  <textarea class="form-control" id="minfo" rows="5"></textarea>
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
</div>	
		
</body>
</html>