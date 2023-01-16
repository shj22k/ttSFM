<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.apache.log4j.LogManager" %>  
<%@ page import="org.apache.log4j.Logger" %>   
<%@ page import="main.sfm.match.vo.SfmMatchVO" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>티키타카</title>
<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("sfmCommunitySelectCon.jsp >>> : ");
	
	String matchnum = request.getParameter("matchnum");
	session.setAttribute("matchnum", matchnum);
	
	Object obj = request.getAttribute("listS");
	if(obj==null) {return;}
	
	List<SfmMatchVO> list = (List<SfmMatchVO>)obj;
	SfmMatchVO mtvo = list.get(0);
	logger.info(mtvo.getMatchjibunaddress());
	logger.info(mtvo.getMatchstadium());

%>

<%
 	String memnum = request.getParameter("memnum");
 	session.getAttribute(memnum);
%> 
<link rel="stylesheet" type="text/css" href="/ttSFM/include/styles.css">
<link rel="stylesheet" type="text/css" href="/ttSFM/include/sfmMatchSelect.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
  	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://www.gstatic.com/charts/loader.js"></script>
<script type='text/javascript'>

	/*차트*/
	google.charts.load('current', {packages: ['corechart']});
	google.charts.setOnLoadCallback(drawChart);
	google.charts.setOnLoadCallback(drawChart1);

	function drawChart(){
		var a = $.ajax({
			url: "googlePieChartPos.sfm",
			dataType: "json",
			async: !1
		}).responseText,
		t = new google.visualization.DataTable(a);
		console.log("a >>> : " + a);
		
		var chart = new google.visualization.PieChart(document.getElementById("column_chart_div1")).draw(t, {
			width: 340,
			height: 340,
			is3D: false,
			title: "포지션 신청 현황",
			fontSize: 15,
			legend: {position: 'none'},
			titlePosition: "out",
		});
	}
	
	function drawChart1(){
		var b = $.ajax({
			url: "googlePieChartLv.sfm",
			dataType: "json",
			async: !1
		}).responseText,
		y = new google.visualization.DataTable(b);
		console.log("b >>> : " + b);
		
		var chart = new google.visualization.PieChart(document.getElementById("column_chart_div2")).draw(y, {
			width: 340,
			height: 340,
			is3D: false,
			title: "레벨 신청 현황",
			fontSize: 15,
			legend: {position: 'none'},
			titlePosition: "out"
		});
	}	
	
	/*차트*/

	function test(ths, thi){
		location.href="/ttSFM/sfmMatchMap.sfm?jibun="+ths+"&stadium="+thi;
	}

	function showmap() {
	    var togglemap = document.getElementById("toggleMap");
	    var stadmap = document.getElementById("stadMap");
	    if (stadmap.style.zIndex=== "0") {
	      stadmap.style.zIndex = "1";
	      togglemap.innerHTML = "지도 닫기";
	    } else {
	      stadmap.style.zIndex = "0";
	      togglemap.innerHTML = "지도 보기";
	    }
	  }

	$(document).ready(function(){
		
		$("#toggleMap").click(function(){
			
			$("#jibun").text();
			$("#matchnotice").attr({
				"method":"GET",
				"action":"sfmMatchMap.sfm",
			}).submit();
		});
		
		$("#paymentbtn").click(function(){
			
			$("#matchnotice").attr({
				"method":"GET",
				"action":"sfmPaymentForm.sfm",
			}).submit();
		});
		
		$("#maingo").on("click", function(){
		   $("#maindata").attr({
		      "action":"maingo.sfm",
		       "method":"POST",
		       'enctype':'application/x-www-form-urlencoded'
		   }).submit();
		});
	});

</script>
<style>
	p {
	    margin-top: 0;
	    margin-bottom: 0rem;
	}
	
	.info__list__wrapper .info__list .no {
	    opacity: 10.4;
	}
	
	
</style>
</head>
<!-- ------------------css 선언 끝 -------------------------------------------- -->
<body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
  integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
  crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
  integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
  crossorigin="anonymous"></script>
<script>

	$('.carousel').carousel({
	  interval: 1600 //기본 4초
	})
  
</script>
<div style="padding:0px 400px 0px 405px;">
<div class="container"></div>
<div class="topnav">
	<form id="maindata" name="maindata">
        <img id="maingo" src="/ttSFM/img/fb/tikilogo2.png" width="125px;">

	<!-- 구장 예약 내역 아이콘 -->
	<a href="https://www.plabfootball.com/mypage/myplab/">
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
		<input type="text" style="width:250px; height:40px;" placeholder="구장이름으로 검색하기" name="search">
		<button type="submit" style="width:40px; height:40px;"><i class="fa fa-search"></i></button>   
	</form>
</div>
</form>
</div>
<!-- ---------------------------시작-------------------------------------------------------------- -->
<!-- 전체 양 옆 여백 조절하기 -->
<!-- 상단 로고 -->

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
		<!-- <span>Previous</span> -->
		<span class="carousel-control-prev-icon" aria-hidden="true"></span>
	</a>
	<a class="carousel-control-next" href="#demo" data-slide="next">
		<!-- <span>Next</span> -->
		<span class="carousel-control-next-icon" aria-hidden="true"></span>
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
<div class="input-form6">
<div style="margin-left: 34px;"class="middle">
<div class="middle-left">
<form id="matchSelectCon" name="matchSelectCon" class="validation-form" novalidate>
<!-- 매치제목 -->

<section style="height:270px" class="section">
<div class="section__header">
	<div class="section__title">
		<h3>매치 포인트</h3>
	</div>
</div>
<div id="mnRule" class="info__list__wrapper double">
<ul>
	<li class="info__list">
	
		<img src="https://plab-football.s3.amazonaws.com/static/img/ic_info_level.svg" class="icon">
		<div>
			<p class=""><%= mtvo.getMatchlv() %></p>
		</div>
	</li>
	<li class="info__list">
		<img src="https://plab-football.s3.amazonaws.com/static/img/ic_info_gender.svg" class="icon">
		<div>
			<p><%= mtvo.getMatchgender() %></p>
		</div>
	</li>
	<li class="info__list">
		<img src="https://plab-football.s3.amazonaws.com/static/img/ic_info_stadium.svg" class="icon">
		<div>
			<p><%= mtvo.getMatchpersonnel() %></p>
		</div>
	</li>
	<li class="info__list">
		<img src="https://plab-football.s3.amazonaws.com/static/img/ic_info_max_player_cnt.svg" class="icon">
		<div>
			<p>10~18명</p>
		</div>
	</li>
	<li class="info__list">
		<img src="https://plab-football.s3.amazonaws.com/static/img/ic_info_shoes.svg" class="icon">
		<div>
		<p class="link"><%= mtvo.getMatchshose() %></p></div></li></ul></div> <div class="stadInner"><div class="info__list__wrapper"><ul><!----> <!----> <!----> <!----> <li class="info__list"> <div></div></li></ul> <!----></div></div></section>
</form>
</div>

<div class="container3">
	<div class="section">
	<div class="middle-right">
		<form class="validation-form" id="matchnotice" name="matchnotice" novalidate>
		<!-- 매치제목 -->
		<div class="input-form5">
			<!-- <section class="section right-div"> -->
				<div class="section__header">
					<div class="section__title">
						<h3>매치 정보</h3>
					</div>
				</div>
				<div style="width:470px" id="mnRule" class="info__list__wrapper double">
					<ul>
						<li class="info__list">
							<div>
							<%
								String date = mtvo.getMatchkickoff();
								String month = date.split("-")[1];
								String day = date.split("-")[2];
							%>
								<p class="" style="font-size:20px; font-weight:600; margin-left:0px;"><%= month+"월 "+day+"일 "+ mtvo.getMatchtime() %></p>
								<p2 class="" style="font-size:15px"><%= mtvo.getMatchstadium() %> </p2>
								<br>	
								<p3 class="" id="jibun" style="font-size:15px; width:400px"><%= mtvo.getMatchjibunaddress() %></p3>
									<input style="width:400px;" type="hidden" id="jibun" name="jibun" value="<%= mtvo.getMatchjibunaddress() %>" />
									<input style="width:400px;"  type="hidden" id="stadium" name="stadium" value="<%= mtvo.getMatchstadium() %>" />
								<br>
								<p4 id="copybtn1" style="text-decoration:underline;" title="주소 복사">주소 복사</span></p4>
								&nbsp;
								<p5 id="toggleMap" onclick="test('<%= mtvo.getMatchjibunaddress() %>', '<%= mtvo.getMatchstadium() %>');" style="text-decoration:underline;">지도 보기</span></p5>
							</div>
						</li>
					</ul>
					<div class="container-login100-form-btn">
						<input type="hidden" id="matchnum" name="matchnum" value="<%= mtvo.getMatchnum() %>" />
						<button class="login100-form-btn" id="paymentbtn" name="paymentbtn">신청하기</button>
					</div>
				</div>
			<!-- </section> -->
		</div>
		</form>
	</div>
	</div>
</div>
</div>
</div>

<!-- 그래프 -->
<div class="container2 ">
    <div class="input-form2-backgroud row">
      <div style="width:800px; padding:0px"class="input-form2">
	<div class="section__header">
		<div style="margin-left: 91px; padding-top:70px" class="section__title">
			<h3>매치 정보</h3>
		</div>
	</div>
	<div style="display: inline-block" id="column_chart_div1" ></div>
	<div style="display: inline-block" id="column_chart_div2" ></div>
<br>
<br>
</div>
</div>
</div>

<!-- 위에가 그래프 -->


<div class="container2">
    <div class="input-form2-backgroud row">
      <div class="input-form2 mx-auto">
		
		<form class="validation-form" novalidate>
        <!-- 매치제목 -->
			<section style="width:357px;" class="section">
				<div class="section__header">
				<div class="section__title">
					<h3>경기장 정보</h3>
				</div>
				</div>
			<div id="mnRule" class="info__list__wrapper double">
			<ul>
				<li style="width:47.5%" class="info__list">
					<img src="https://plab-football.s3.amazonaws.com/static/img/ic_info_stadium.svg" class="icon">
					<div>
						<p class="">40x20</p>
					</div>
				</li>
				<li style="width:47.5%" class="info__list">
					<img src="https://plab-football.s3.amazonaws.com/static/img/ic_info_shower.svg" class="icon no">
					<div>
						<p><%= mtvo.getMatchshower() %></p>
					</div>
				</li>
				<br>
				<li style="width:47.5%" class="info__list">
					<img src="https://plab-football.s3.amazonaws.com/static/img/ic_info_park.svg" alt="유료주차" class="icon">
					<div>
						<p><%= mtvo.getMatchparking() %></p>
					</div>
				</li>
				<li style="width:50%" class="info__list">
					<img src="https://plab-football.s3.amazonaws.com/static/img/ic_info_shoes.svg" class="icon">
					<div>
						<p><%= mtvo.getMatchshose() %></p>
					</div>
				</li>
			</div> 
			<div class="stadInner"><div class="info__list__wrapper">
			<ul><!----> <!----> <!----> <!----> 
			<li class="info__list"> <div></div></li></ul> <!----></div></div></section>
		</form>
		
<br>
<br>		
		      	▶ 구장 특이사항
<br>
<br>		      	
*네비 검색 시 : 마리오아울렛 3관 주차장으로 검색하시기 바랍니다
<br>
<br>
■ 참가자분들께서는 저녁 시간에는 꼭 소음에 주의하여 매치 참여 부탁 드리겠습니다.
<br>
<br>
■ 주차
- 매치 신청 신청할 때 사전 등록 시 무료(아울렛 3관 지하 2층 주차장 이용)
<br>
- 꼭 마리오아울렛 3관 지하 2층에 주차해주세요. (그렇지 않을 경우 주차비용이 발생할 수 있으며 영업시간 이후 차량이 출차가 불가할 수 있습니다)
<br>
- 이륜차는 별도의 주차 등록 없이 주차 가능
<br>
<br>
■ 구장 찾아가는 길
<br>
- 가산 마리오아울렛 3관 4층
<br>
- 3관 지하 2층 206번 기둥 옆 비상 엘리베이터를 통해 풋살장(4층)으로 진입 가능
<br>
- 2관 지하주차장을 통해 차량 출차
<br>
<br>
■ 흡연: 시설 내 절대 금연 CCTV 촬영 중(흡연 적발 시 과태료가 부과됩니다)
<br><br>
■ 화장실: 영업 시간(10시 30분 이전, 21시 이후) 외 11층 이용
<br><br>
■ 기타
- 영업 시간(10시 30분 이전, 21시 이후) 3관 지하 2층 주차장으로만 퇴장 가능합니다
<br>
<br>
<br>
	</div>
	</div>
	</div>


<div class="container2">
    <div class="input-form2-backgroud row">
      <div class="input-form2 mx-auto">
		
        <!-- 매치제목 -->
<br>
<br>		
■ 매치 규칙<br>
- 모든 파울은 사이드라인에서 킥인<br><br>
- 골키퍼에게 백패스 가능. 손으로는 잡으면 안돼요<br><br>
- 사람을 향한 태클 금지<br><br>
■ 진행 방식<br><br>
- 풋살화와 개인 음료만 준비하세요<br><br>
- 매니저가 경기 진행을 도와드려요<br><br>
- 골키퍼와 휴식을 공평하게 돌아가면서 해요<br><br>
- 레벨 데이터를 기준으로 팀을 나눠요<br><br>
- 친구끼리 와도 팀 실력이 맞지 않으면 다른 팀이 될 수 있어요<br><br>
■ 알아두면 좋아요<br><br>
- 서로 존중하고 격려하며 함께 즐겨요<br><br>
- 플랩 평균 레벨은 아마추어2예요<br><br>
- 플랩에서는 하루 평균 180경기가 진행되고 있어요<br><br>
- 매일 3,000여명이 팀 없이도 풋살을 즐기고 있어요<br><br>
■ 일반 취소 규정<br><br>
- 매치 시작 1시간 30분 전까지 최소 인원이 모이지 않으면 매치를 취소해요.<br><br>
- 매치가 취소되면 카카오톡 혹은 LMS를 통해 안내드리고 캐시는 전부 돌려드려요.<br><br>
- 특수 취소 규정(우천)<br><br>
- 다수의 인원이 취소하거나, 구장 상태가 좋지 않아 진행이 어렵다면 매치 시작 1시간 30분 이내라도 매치를 취소해요.<br><br>
- 현장에서 매치가 취소되거나 중단되면 진행하지 못한 시간만큼 캐시로 돌려드려요.<br><br>

<br>
<br>
</div>
</div>
</div>
   <script>
   
	function copyToClipboard(val) {
	    var t = document.createElement("textarea");
	    document.body.appendChild(t);
	    t.value = val;
	    t.select();
	    document.execCommand('copy');
	    document.body.removeChild(t);
	    }
	
	    $('#copybtn1').click(function() {
	      copyToClipboard($("#jibun").text());
	      alert('주소를 복사하였습니다');
	    });

   </script>
</div>
</div>

</body>
</html>