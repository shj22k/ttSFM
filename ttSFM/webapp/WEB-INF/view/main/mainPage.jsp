<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="org.apache.log4j.LogManager" %>  
<%@ page import="org.apache.log4j.Logger" %>   
<%@ page import="main.sfm.member.vo.SfmMemVO" %>
<%@ page import="java.util.List" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("MainPage.jsp 진입 >>> : ");	
	String memnum = "";
	String memid = "";
	Object obj = request.getAttribute("listLogin");
	List<SfmMemVO> list = (List<SfmMemVO>)obj;

	memnum = list.get(0).getMemnum();
	memid = list.get(0).getMemid();
	logger.info("memnum >>> : " + memnum);	
	logger.info("memid >>> : " + memid);	
	
	session.setAttribute("memnum", memnum);
	session.setAttribute("memid", memid);
	logger.info("세션에 담긴 값 memnum >>> : " + memnum);	
	logger.info("세션에 담긴 값 memid >>> : " + memid);	
%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  
  <title>TIKI TAKA</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="/ttSFM/include/mainPage.css">

 <!-- ------------------css 선언 시작 -------------------------------------------- -->
  <!--  케러셀 컨테이너 색상정하기  -->
  <!-- 맨위는 검색ㅂ -->
<script type='text/javascript'>

	function date(){
	    $('.input-group.date').datepicker({
	        calendarWeeks: false,
	        todayHighlight: true,
	        autoclose: true,
	        format: "yyyy/mm/dd",
	        language: "kr"
	    });
	};
	
	   function Open(){
		      window.open("sfmChat.sfm", "채팅", "top=100px, left=800px, height=700px, width=500px");
		   }

</script>
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
  <!-- 채팅 창 -->
<div style = "position:fixed; right:40px; bottom:40px;float:right;">
   <a class="active" target='_blank' onclick="Open()">
      <img src = "/ttSFM/img/fb/chatbot.png" width="100" height="100"/>
   </a>
</div>
<!-- 채팅 창 --><!-- 상단바 -->

<div style="padding:0px 400px 0px 400px;">
<div class="topnav">
  <a>
  <img src="/ttSFM/img/fb/tikilogo2.png" width="125px;"><a style="font-size:30px"></a>
  </a>
  	
  	<!-- 구장 예약 내역 아이콘 -->
  	<a href="calendar.sfm">
  		<img class="icon-margin2" align="right" src="/ttSFM/img/fb/date2.png" width="35px">
  	</a>
 	<!-- 구장 예약 내역 아이콘 -->
  
  
  	<!-- 마이 페이지 아이콘 -->
	<a href="myPage.sfm?memnum =<%= memnum %>" onfocus="this.blur()">
		<img class="icon-margin2" align="right" src="/ttSFM/img/fb/user.png" width="35px">
	</a>
  	<!-- 마이 페이지 아이콘 -->
  	
  	
      <div align="right" class="search-container">
    <form action="/action_page.php">
      <input type="text" style="width:250px; height:40px" placeholder="Search.." name="search">
      <button type="submit" style="width:40px; height:40px;"><i class="fa fa-search"></i></button>
    </form>
  </div>
  
</div>
<!-- 상단바 끝-->
<!-- ---------------------------시작-------------------------------------------------------------- -->
<!-- 전체 양 옆 여백 조절하기 -->

<!-- 상단 로고 -->
<!------------------------------ 메뉴 2 ----------------------------->

<div id="naviarea">
<header id="topbar">
	<ul class="wrapper mb">
		<!-- 메뉴버튼들 ----------------------->
		<li>
			<a href="mainIntro.sfm" onfocus="this.blur()">
            	<div class="nav_btn">					
            		소개
				</div>
			</a>
		</li>
		<li>
            <a href="sfmEventSelectAllUser.sfm" onfocus="this.blur()">
               <div class="nav_btn">
                  	이벤트
               </div>
         	</a>
        </li>
        <li>
			<a href="sfmNoticeSelectAllUI.sfm" onfocus="this.blur()">
				<div class="nav_btn">
					공지사항
				</div>
			</a>
		</li>
		<li>
			<a href="sfmCommunitySelectAll.sfm" onfocus="this.blur()">
				<div class="nav_btn">
					커뮤니티
				</div>
			</a>
		</li>
	</ul>
	</header>
</div>
<!------------------------------ 메뉴 2 ------------->

<!--------------  슬라이드 ---------------------------------------------------------------- -->		
 <div class="carousel--container">
 <div id="demo" class="carousel slide" data-ride="carousel">
    <div class="carousel-inner">
      <!-- 슬라이드 쇼 -->
      <div class="carousel-item active">
        <!--가로-->
        <img class="d-block w-100" 
          src="/ttSFM/img/fb/main.png"
          alt="First slide">
      </div>
      <div class="carousel-item">
        <img class="d-block w-100"
          src="/ttSFM/img/fb/intro.png"
          alt="Second slide">
      </div>
      <div class="carousel-item">
        <img class="d-block w-100"
          src="/ttSFM/img/fb/event.png"
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
<div class="container">
   <div class="input-form-backgroud row">
     <div class="input-form col-md-12 mx-auto">
       <form class="validation-form" novalidate>
       
      	<jsp:include page="/sfmMatchSelectAll.sfm" >
   			<jsp:param name="category" value="product1" />
		</jsp:include>
		<footer class="my-3 text-center text-small">
     		<p class="mb-1">&copy; 2022 YD</p>
   		</footer>
       </form>
      </div>
    </div>
  </div>
</div>	

<!--  하단바~~~~~~~~~~~~~~~~~~~~~ -->
<div class="topnav">
  <a class="active" href="#home"><img src="/ttSFM/img/fb/tikilogo2.png" width="150px"></a>
     <br>
     <br>
     <br>
     <br>
</div></body>
</html>