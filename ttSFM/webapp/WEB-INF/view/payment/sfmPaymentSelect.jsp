<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.apache.log4j.LogManager" %>  
<%@ page import="org.apache.log4j.Logger" %>   
<%@ page import="main.sfm.payment.vo.SfmPaymentVO" %>
<%@ page import="java.util.List" %>
<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("sfmPaymentForm.jsp >>> : ");
	
	HttpSession ss = request.getSession();
    String memnum = (String)ss.getAttribute("memnum");
	logger.info("세션에 담긴 memnum 값 >>> : " + memnum);
%>

<% request.setCharacterEncoding("UTF-8");%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src = "http://code.jquery.com/jquery-latest.min.js"></script>

    <!-- 검색바 -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
		integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous"
		integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<!-- 검색바 -->
	<!-- css 파일 -->
	<link rel="stylesheet" type="text/css" href="/ttSFM/include/sfmPaymentSelect.css">
	
<!-- 계좌번호 복사 -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>	
<script type="text/javascript">

	$(document).ready(function(){
		$("#paymentbtn").on("click", function(){
			$("#paymentlist").attr({
				"method":"GET",
				"action":"sfmPaymentComplete.sfm",
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
</head>
<body>
<!-- 상단바 -->
<div style="padding:0px 400px 0px 400px;">
<div class="topnav">
	<form id="maindata" name="maindata">
    	<img type="" id="maingo" src="/ttSFM/img/fb/tikilogo2.png" width="125px;">  	<!-- 구장 예약 내역 아이콘 -->
  	
  	<a href="https://www.plabfootball.com/mypage/myplab/">
  		<img class="icon-margin2" align="right" src="/ttSFM/img/fb/date2.png" width="35px">
  	</a>
  
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
	</form>
</div>
<!-- 상단바 끝-->
<!-- 라이트 레프트 -->
<%
	Object obj = request.getAttribute("listAll");
	if(obj == null) return;
	
	List<SfmPaymentVO> list = (List<SfmPaymentVO>)obj;
	int nCnt = list.size();
	
	SfmPaymentVO pvo = null;
	if (nCnt == 1){
		pvo = list.get(0);
%>
<div class="left">
<h4><b>아래 내역으로<br>입금해주세요</b></h4>
<br>
<div class="left2">
<form id="paymentlist" name="paymentlist">
	<div class="row" style="color:white">
	   	<div class="font1">
			<div>
				<a>입금자명</a>
			</div>
			<div>
				<a>입금 금액</a>
			</div>
			<div>
				<a>계좌 정보</a>
			</div>
			<div>
				<a>예금주</a>
			</div>
		</div> 
		
		<div class="font1 row1">
	  		<div>
	  			<a style=fon-size:20px><b><%= pvo.getPaymentname() %></b></a><br>
			</div>
			<div>
				<a style=fon-size:20px><b>10000원</b></a><br>
			</div>
			<div>
				<a style=fon-size:20px><b>국민은행 020202-02-020202</b></a><br>
			</div>
			<div>
				<a style=fon-size:20px><b>(주)티키타카컴퍼니</b></a><br>
	 		</div>
		</div>            
	</div>
</form>
</div>
<%
	}
%>
<br>
<br>
<br>
	<div>
		<button style="height:80px" class="btn btn-light btn-lg btn-block" type="submit" id="paymentbtn" name="paymentbtn">입금 완료</button>
	</div>
       <!-- 약관 구구절절 -->
      <br>
      <br>
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