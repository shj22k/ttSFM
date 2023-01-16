<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="org.apache.log4j.LogManager" %>  
<%@ page import="org.apache.log4j.Logger" %>   
<%@ page import="main.sfm.member.vo.SfmMemVO" %>
<%@page import="main.sfm.event.vo.SfmEventVO" %>
<%@ page import="java.util.List" %>
<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("myPage.jsp.jsp >>> : ");
		
	Object obj = request.getAttribute("fileUploadListAll");
	List<SfmMemVO> list = (List<SfmMemVO>)obj;	
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<%
 	String memnum = request.getParameter("memnum");
 	session.getAttribute(memnum);
%> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<link rel="stylesheet" href="/css/jquery-ui.min.css">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
<script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
<script src="/js/bootstrap-datepicker.kr.js" charset="UTF-8"></script>

<!-- 검색바 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- 검색바 -->
<!-- css 선언 -->
<link rel="stylesheet" type="text/css" href="/ttSFM/include/myPage.css">
<script type='text/javascript'>

	function test(ths){
		location.href="/ttSFM/sfmMatchSelectCon.sfm?matchnum="+ths;
	}

   	$(document).ready(function(){
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
<div style="padding:0px 400px 0px 400px;">
<!-- 상단바 -->
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
			<input type="text" style="width:250px; height:40px" placeholder="Search.." name="search">
			<button type="submit" style="width:40px; height:40px;"><i class="fa fa-search"></i></button>
		</form>
	</div>
	</form>
</div>

<!-- 상단바 끝-->
<!-- 라이트 레프트 -->
<%
	if (list.size() >= 1){
		SfmMemVO mvo = list.get(0);
%>	
<div class="left">
<div class="title-name">
<br>
    <div class="profile-picture">
		<img class="profile-img" style="width:150px;" src="/ttSFM/fileupload/mem_photo/<%= mvo.getMemphoto()%>" onerror="this.src='/ttSFM/img/fb/noimage.png'" alt="image" >
    </div>
    <br>
    <br>
              
    <h1 id="name"><%= mvo.getMemname() %>(<%= mvo.getMemid() %>)</h1>
    <a><%= mvo.getMememail() %></a>
    </div>
	<!-- 버튼 1 -->    
    <div class="left2">
    <h5><b>선호 지역</b></h5>
    	 <h3><b><%= mvo.getMempreferredarea() %></b></h3>
    </div>
    <!-- 버튼 2 -->     		 
		  
	 <div class="right2">
	 <h5><b>선호 포지션</b></h5>
	 <h3><b><%= mvo.getMemposition() %></b></h3>
	 </div>	
	 
	 <!-- 버튼 3 -->    
     <div class="left2">
     <h5><b>레벨</b></h5>
     	 <h3><b><%= mvo.getMemlv() %></b></h3>
     </div>	 
     
     <!-- 버튼 4 -->    
     <div class="right2">
     <h5><b>성별</b></h5>
     	 <h3><b><%= mvo.getMemgender() %></b></h3>
	 </div>
	 
	 <div class="center1">
     <h5><b>주소</b></h5>
     	 <a><b><%= mvo.getMemjibunaddress() %></b></a><br>
     	 <a><b><%= mvo.getMemjibunaddressdetail() %></b></a>
	</div> 
	 
<!-- 	 <div class="center2"> -->
<!--      <h5><b>이벤트 글 배너 오는곳</b></h5> -->
<!--      	 <h3><b>뭐 넣징 ㅎㅎ</b></h3> -->
<!-- 	 </div>  	 -->
</div>

<!--  바뀐점 ㅎㅎ -->
<div style="height: 837px;" class="right">
	<h3 class="list-margin"><b>구장예약 목록</b></h3>
	<br>
		
<table class="table border-bottom table-sm">
<thead>
	<tr>
		<th>글번호</th>	
		<th>제목</th>	
		<th>경기 시간</th>
		<th>신청 날짜</th>
	</tr>
</thead>
<tbody>
<%
	for(int i=0; i < list.size(); i++){
		 mvo = list.get(i);
		 String month = mvo.getMatchkickoff().split("-")[1];
		 String day = mvo.getMatchkickoff().split("-")[2];
		 String time = mvo.getInsertdate().replace("2023-", "");

%>
	<tr>
		<td style="width:10%"><%= i+1 %></td>
		<td style="width:40%"><a href="#" onclick="test('<%= mvo.getMatchnum() %>');"><%= mvo.getMatchstadium() %></a></td>
		<td style="width:12%"><%= month+"월"+day+"일"+" "+ mvo.getMatchtime() %></td>				
		<td style="width:12%"><%= time %></td>				
	</tr>	
<%
	}	// end of for
%>
</tbody>
</table>

</div>
</div>
<%
	} //end of if
%>
</body>
</html>