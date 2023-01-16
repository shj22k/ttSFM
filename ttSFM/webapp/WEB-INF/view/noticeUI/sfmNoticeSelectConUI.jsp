<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.apache.log4j.LogManager" %>  
<%@ page import="org.apache.log4j.Logger" %>   
<%@ page import="main.sfm.notice.vo.SfmNoticeVO" %>
<%@ page import="java.util.List" %>
<% request.setCharacterEncoding("UTF-8");%> 
<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("sfmNoticeSelectCon.jsp >>> : ");
	
	String noticenum = request.getParameter("noticenum");
	session.setAttribute("noticenum", noticenum);
	String memnum = request.getParameter("memnum");
 	session.getAttribute(memnum);

	Object obj = request.getAttribute("listS");
	if(obj == null) return;
	
	List<SfmNoticeVO> list = (List<SfmNoticeVO>)obj;
	int nCnt = list.size();
	
	if (nCnt == 1){
		SfmNoticeVO snvo = null;
		snvo = list.get(0);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

    
<!-- 검색바 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	  integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="/ttSFM/include/sfmCommunitySelect.css">
<!-- 검색바 -->
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type='text/javascript'>

	$(document).ready(function(){

		// 목록으로 이동
		$('#selectBtn').on('click', function(){
			alert("selectAllbtn버튼 클릭  >>> ");
			//리터럴객체
			$('#commucon').attr({
				"action":"sfmNoticeSelectAllUI.sfm",
				"method":"GET",
			}).submit();
		});
		
// 		// 수정하기
// 		$("#updateBtn").on("click",function(){
// 			alert("updateBtn버튼 클릭  >>> ");
	
// 			$('#commucon').attr({
// 				"action":"sfmNoticeUpdateForm.sfm",
// 				"method":"GET",
// 			}).submit();
// 		});
		
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
          <img type="" id="maingo" src="/ttSFM/img/fb/tikilogo2.png" width="125px;">
  	
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
<div class="container">
<div class="input-form-backgroud">
<div class="input-form col-md-12 mx-auto">

<h3><b>공지사항</b></h3>
<br>
<form name="commucon" id="commucon">
<table class="table">
	
	<tr>
		<td style="width:100px">제목</td>
		<td style="width:200px;text-align:left;">
			<font size="4" style="color:black;"><%= snvo.getNoticetitle() %></font>
			<input type="hidden" name="memnum" id="memnum" value="<%= memnum %>"/>
		</td>
		<td style="width:50px; text-align:right;"></td>
		<td style="width:100px; text-align:left;"></td>
	</tr>
	
	<tr>
		<td style="width:100px">이름</td>
		<td style="width:200px;text-align:left;">GM주용</td>
		<td style="width:200px;text-align:right;">작성일자</td>
		<td style="width:100px;text-align:left;"><%= snvo.getInsertdate() %></td>
	</tr>
	
	<tr>
		<td colspan="6" style="text-align:left">
		<textarea class="form-control" name="kbcontent" id="kbcontent" rows="5" cols="100" readonly><%= snvo.getNoticecontent() %></textarea>
		</td>
	</tr>
	
	<tr>
	<tr>
		<td colspan="9" align="right">	
			<button type="button" class="btn btn-primary btn-sm" id="selectBtn" name="selectBtn">목록으로 이동</button> 												
<!-- 			<button type="button" class="btn btn-primary btn-sm" id="updateBtn" name="updateBtn">수정하기</button>		 -->
		</td>
	</tr>	
</table>
</form>
	<!-- 댓글 처리 하는 루틴  --> 
<%-- <jsp:include page="/sfmMatchSelectAll.sfm" > --%>
<%
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