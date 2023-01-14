<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>  
<%@page import="main.sfm.payment.vo.SfmPaymentVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  
<script type="text/javascript" src="/ttSFM/js/common.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<!-- 달력 -->

    <!-- 검색바 -->
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous"
      integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<!-- 검색바 -->
	<!-- css 파일 -->
	<link rel="stylesheet" type="text/css" href="/ttSFM/include/sfmPaymentComplete.css">
	<!-- 계좌번호 복사 -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>	
	
<style type="text/css">
</style>
</head>
<body>

<!-- 상단바 -->

<div style="padding:0px 400px 0px 400px;">
<div class="topnav">
  <a>
  <img src="/ttSFM/img/fb/tikilogo2.png" width="125px;"><a style="font-size:30px"></a>
  </a>
  	
  	<!-- 구장 예약 내역 아이콘 -->
  	<a href="https://www.plabfootball.com/mypage/myplab/">
  	<img class="icon-margin2" align="right" src="/ttSFM/img/fb/date2.png" width="35px"><a href="https://www.plabfootball.com/mypage/"></a>
  	</a>
 	 <!-- 구장 예약 내역 아이콘 -->
  
  
  	<!-- 마이 페이지 아이콘 -->
  	<a href="https://www.plabfootball.com/mypage/">
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
       
      <img src="/ttSFM/img/fb/fb31.PNG" style=" width: 200px;">
        <br>
        <br>
        <div class="left2">
       		
       	<div class="row" style="color:white">
       		<div class="font1">
       			<div>
       				<a>구장명</a>
       			</div>
       			<div>
       				<a>구장 예약 날짜</a>
       			</div>
       			<div>
       				<a>구장 예약 시간</a>
       			</div>
       			<div>
       				<a>구장타입</a>
       			</div>

  			</div> 
<%

   Object obj = request.getAttribute("listCom");
   if (obj == null){ return; }
   
   List<SfmPaymentVO> list = (List<SfmPaymentVO>)obj;
   String memnum = list.get(0).getMemnum();
   System.out.print("memnum >>> : " + memnum);
   session.setAttribute("memnum", memnum);

   if (list.size() > 0){
      for (int i=0; i < list.size(); i++){
         SfmPaymentVO pvo = list.get(i);
%>
           
           <div class="font1 row1">
           <tr>
                <div>
                   <a style=fon-size:20px><td><%= pvo.getMatchstadium() %></td></a><br>
                </div>
                <div>
                   <a style=fon-size:20px><td><%= pvo.getMatchkickoff() %></td></a><br>
                </div>
                <div>
                   <a style=fon-size:20px><td><%= pvo.getMatchtime() %></td></a><br>
                </div>
                <div>
                   <a style=fon-size:20px><td><%= pvo.getMatchpersonnel() %></td></a><br>
                </div>
             </tr>
<%
      } // end of for
   }//end of if
%>  			

  			</div>            
      	</div>
      
        </div>
          <br>
          <br>
		  <br>
          <div>
          <button style="height:80px" class="btn btn-light btn-lg btn-block" type="submit" id="" name="">구장예약 목록 바로가기</button>
          </div>
          
          <!-- 약관 구구절절 -->
	        <br>
	        <br>
	        <a style="color:gray" >
		        무통장입금은 주문별로 발급되는 가상계좌로 입금하셔야 하며,가상계좌 유지기간은 주문일부터 30일 입니다.
		    <br>
		    30일 안에 입금하지 않으시면 자동으로 주문내역은 취소처리 됩니다.
		    <br>
			무통장입금시 입금금액이 다를 경우 주문이 정상적으로 처리되지 않을 수 있으니 입금금액을 확인해주시기 바랍니다.
			주문별 입금계좌가 다르게 생성됩니다. 입금계좌를 확인 후 입금해주시기 바랍니다.
			<br>
			<br>
			※ 신청 내역은 마이페이지 → 신청 내역에서 확인하실 수 있습니다.
			<br>
			※ 단,가상계좌 입금이 불가능하실 경우에는 티키타카 고객센터로 연락하여 주시면 입금계좌에 대하여 안내 드리겠습니다.
			<br>
			티키타카 고객센터  02-0202-0202
	        </a> 
          </div>
      </div>
</body>
</html>