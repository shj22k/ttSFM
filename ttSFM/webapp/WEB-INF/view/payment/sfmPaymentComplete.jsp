<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.apache.log4j.LogManager" %>  
<%@ page import="org.apache.log4j.Logger" %>   
<%@ page import="main.sfm.payment.vo.SfmPaymentVO" %>
<%@ page import="java.util.List" %>
<% request.setCharacterEncoding("UTF-8");%> 
<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("sfmPaymentComplete.jsp >>> : ");
	
	Object obj = request.getAttribute("listAll");
	if(obj == null) {return;}
	
	List<SfmPaymentVO> list = (List<SfmPaymentVO>)obj;
	SfmPaymentVO pvo = list.get(0);
	
	HttpSession ss = request.getSession();
    String memnum = (String)ss.getAttribute("memnum");
	logger.info("세션에 담긴 memnum 값 >>> : " + memnum);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- 5초 뒤 페이지 이동  -->
<meta http-equiv="refresh" content="5; /ttSFM/main/sfmmain.jsp">
<!-- 5초 뒤 페이지 이동  -->

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="/ttSFM/js/common.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<!-- 검색바 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<!-- 검색바 -->

<!-- css 파일 -->
<link rel="stylesheet" type="text/css" href="/ttSFM/include/sfmPayment2.css">
<!-- 계좌번호 복사 -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>	
<script type="text/javascript">

	var MOVE = function(param){
	    var self=this;
	    this.object = document.getElementById(param.id);
	    this.time = param.time||5;      //페이지 이동 시간을 정해 준다. 여기선 5초
	    this.url = param.url||'';
	    this.timer = null;
	    this.run = function(){
	     timeString.innerHTML = this.time + '초 후 마이페이지로 이동합니다.';
	     this.time--;
	     if(this.time < 0){
		     if(this.url!=''){
			     location.href = this.url;
			     window.clearTimeout(this.timer);
		     }
	     }else{
		     this.timer = window.setTimeout(
		     function(){self.run();}
			     ,1000
		     )
	     }
	  };
	  this.run();
	  }
	  window.onload = function(){
	  	new MOVE({id:'prt',src:'/ttSFM/main/myPage.jsp'}); //여기다가 sfm 으로 수정 ㄱㄱㄱ
	  }
	  
</script>	
<style type="text/css">

	.complete {
				font-size : 40px;
				text-align : center;
				margin-left: auto;
				margin-right: auto;
				margin-top: 200px;
				margin-bottom:auto;
				height:350px;
			 }

</style>
</head>
<body>
<!-- 상단바 -->
<div style="padding:0px 400px 0px 400px;">
<div class="topnav">
	<a>
		<img src="/ttSFM/img/fb/tikilogo2.png" width="125px;">
	</a>
  	
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
	    <input type="text" style="width:250px; height:40px" placeholder="Search.." name="search">
	    <button type="submit" style="width:40px; height:40px;"><i class="fa fa-search"></i></button>
	  </form>
	</div>
</div>

<!-- 상단바 끝-->
<!-- 라이트 레프트 -->
<div class="left">
       <div class="complete">
        <b>결제가 완료되었습니다.</b><br>
        <span class="complete" id="timeString"><b></b></span>
       </div>
       
	        <a style="color:gray" >
		        무통장입금은 주문별로 발급되는 가상계좌로 입금하셔야 하며,가상계좌 유지기간은 주문일부터 30일 입니다. 30일 안에 입금하지 않으시면 자동으로 주문내역은 취소처리 됩니다.
			무통장입금시 입금금액이 다를 경우 주문이 정상적으로 처리되지 않을 수 있으니 입금금액을 확인해주시기 바랍니다.
			주문별 입금계좌가 다르게 생성됩니다. 입금계좌를 확인 후 입금해주시기 바랍니다.
			<br>※ 신청 내역은 마이페이지 → 신청 내역에서 확인하실 수 있습니다.
			<br>※ 단,가상계좌 입금이 불가능하실 경우에는 티키타카 고객센터로 연락하여 주시면 입금계좌에 대하여 안내 드리겠습니다.
			<br>티키타카 고객센터  02-0202-0202
	        </a> 
          </div>
      </div>
</body>
</html>