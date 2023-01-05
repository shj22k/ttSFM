<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.apache.log4j.LogManager" %>  
<%@ page import="org.apache.log4j.Logger" %>   
<%@ page import="main.sfm.community.vo.SfmCommunityVO" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>
<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("sfmCommunitySelectCon.jsp >>> : ");
	
	String cnum = request.getParameter("cnum");
	session.setAttribute("cnum", cnum);
%> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="/ttSFM/js/common.js"></script>

<!-- 달력 -->
<!-- <script src="https://code.jquery.com/jquery-3.2.1.js"></script> -->
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
<link rel="stylesheet" type="text/css" href="/ttSFM/include/sfmCommunitySelect.css">
<!-- 검색바 -->
	
<script type='text/javascript'>

	$(function date(){
	    $('.input-group.date').datepicker({
	
	        calendarWeeks: false,
	        todayHighlight: true,
	        autoclose: true,
	        format: "yyyy/mm/dd",
	        language: "kr"
	    });
	});
  
	$(document).ready(function(){
		alert("ready 함수 진입");
		
		// 목록으로 이동
		$('#selectBtn').on('click', function(){
			alert("selectAllbtn버튼 클릭  >>> ");
			//리터럴객체
			$('#commucon').attr({
				"action":"sfmCommunitySelectAll.sfm",
				"method":"GET",
			}).submit();
		});
		
		// 수정하기
		$("#updateBtn").on("click",function(){
			alert("updateBtn버튼 클릭  >>> ");
	
			$('#commucon').attr({
				"action":"sfmCommunityUpdateForm.sfm",
				"method":"GET",
			}).submit();
		});
	});

</script>
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
<div class="container">
<div class="input-form-backgroud">
<div class="input-form col-md-12 mx-auto">
<%
	Object obj = request.getAttribute("listS");
	if(obj==null) {return;}
	
	List<SfmCommunityVO> list = (List<SfmCommunityVO>)obj;
	if(list.size() > 0){
		for(int i=0; i<list.size(); i++){
			SfmCommunityVO cvo = list.get(i);
%>
<h3><b>커뮤니티</b></h3>
<br>
<form name="commucon" id="commucon">
<table class="table">
	<tr>
		<td>제목</td>
		<td colspan="10" style="text-align:left;width:400;">
			<font size="4" style="color:black;"><%= cvo.getCsubject() %></font>
		</td>
	</tr>
	<tr>
		
		<td>이름:<%= cvo.getCname() %></td><td class="td_1"></td>
		<td class="td_2"> 추천: &nbsp; 조회:  &nbsp; 작성일자 : <%= cvo.getInsertdate() %></td>
	</tr>
	<tr>
		<td colspan="6" style="text-align:left"> 
<%-- 				<img src="/ShjSpring/fileupload/product/<%= _kpvo.getKpfile() %>" width="50" height="50"><br> --%>
		
			<img src="/ttSFM/fileupload/board/" border="1" width="100" height="100" alt="image"><br>
			<img src="/ttSFM/fileupload/board/" border="1" width="200" height="100" alt="image"><br>
		</td>
	</tr>
	<tr>
		<td colspan="6" style="text-align:left">
			<textarea class="form-control" name="kbcontent" id="kbcontent" rows="5" cols="100">					
			</textarea>
		</td>
	</tr>
	<tr>
		<td colspan="6" style="text-align:center">
		<button type="button" class="btn btn-light" name="like_1" id="like_1">추천
			<p>
				<img src='/ttSFM/img/img_board/heart.png' style='width:12px; margin:3px 3px 0 0;'>
				<span id="disp_cnt_recom"></span>
			</p>
		</button>
		<button type="button" class="btn btn-light" name="like_2" id="like_2">반대
			<p>
				<img src='/ttSFM/img/img_board/thumb_rev.png' style='width:12px; margin:3px 3px 0 0;'>
				<span id="disp_cnt_stop"></span>
			</p>
		</button>
		<button type="button" class="btn btn-light" name="like_3" id="like_3">신고
			<p>
				<img src='/ttSFM/img/img_board/alarm.png' style='width:18px; margin-top:1px; '>
			</p>
		</button>
	</td>
	</tr>
	<tr>
		<td colspan="9" align="right">	
			<input type="hidden" id="cnum" name="cnum" value="<%= cnum %>" />
			<button type="button" class="btn btn-dark" id="selectBtn">목록으로 이동</button> 												
			<button type="button" class="btn btn-warning" id="updateBtn">수정하기</button>		
		</td>
	</tr>	
</table>
</form>
<p>
	<!-- 댓글 처리 하는 루틴  --> 
<%-- <jsp:include page="/sfmMatchSelectAll.sfm" > --%>
	
	<jsp:include page="/sfmRcommunitySelectAll.sfm">
		<jsp:param value="<%= cvo.getCnum()%>" name="cnum"/>
	</jsp:include>
<%		
		}
	}
%>
</div>
</div>
</div>
	    
<!-- --------------------------- -->
</div>
<!--  하단바~~~~~~~~~~~~~~~~~~~~~ -->
	
</body>
</html>