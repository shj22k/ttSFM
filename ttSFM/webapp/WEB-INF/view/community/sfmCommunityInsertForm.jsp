<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>

<%@page import="java.util.List"%> 
<%@page import="main.sfm.member.vo.SfmMemVO" %>
<%@page import="org.apache.log4j.LogManager" %>
<%@page import="org.apache.log4j.Logger" %>
<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("CommunityPage.jsp 진입 >>> : ");	
	HttpSession ss = request.getSession();
    String memnum = (String)ss.getAttribute("memnum");
	logger.info("memnum >> "+ memnum);
%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>
<!--<meta name="viewport" content="width=device-width, initial-scale=1">  -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/ttSFM/include/sfmCommunityInsertForm.css">
<link rel="stylesheet" href="//mugifly.github.io/jquery-simple-datetimepicker/jquery.simple-dtpicker.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="/kosmoSpring/js/common.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<!-- 검색바 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<!-- 검색바 -->
<script type="text/javascript">

	$(document).ready(function(){
		
		// 등록하기
		$(document).on('click','#communitybtn', function(){
			alert("noticebtn버튼 클릭  >>> ");
			//리터럴객체
			$('#communityinsertForm').attr({
				"action":"sfmCommunityInsert.sfm",
				"method":"POST",
				"enctype":"multipart/form-data"
			}).submit();
		});
		
		// 글목록으로 이동
		$(document).on('click','#selectAllbtn', function(){
			alert("noticebtn버튼 클릭  >>> ");
			//리터럴객체
			$('#communityinsertForm').attr({
				"action":"sfmCommunitySelectAll.sfm",
				"method":"GET",
			}).submit();
		});
		
	   $(document).ready(function(){
		      $("#maingo").on("click", function(){
		         $("#maindata").attr({
		            "action":"maingo.sfm",
		             "method":"POST",
		             'enctype':'application/x-www-form-urlencoded'
		         }).submit();
		      });
		   });
	});

</script>
</head>
<body>
<!-- 달력 -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="//mugifly.github.io/jquery-simple-datetimepicker/jquery.simple-dtpicker.js"></script>
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
<!-- 라이트 레프트 -->
<div class="left">
        <h4 class="mb-3"><b>커뮤니티 등록</b></h4>
        <br>
        <form name ="communityinsertForm" id ="communityinsertForm">
        <div class="row">
        <!-- 매치제목 -->
          <div class="col-md-3 mb-3">
              <label for="name"><b>제목</b></label>
              <input type="text" class="form-control" id="csubject" name="csubject" placeholder="" style="width:400px;">
              <div class="invalid-feedback">
                제목을 입력해주세요.
              </div>
          </div>
          &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
          <div class="col-md-3 mb-3">
              <label for="name"><b>작성자</b></label>
              <input type="text" class="form-control" name="cname" id= "cname" placeholder="" style="width:180px;">
              <div class="invalid-feedback">
                이름을 입력해주세요.
              </div>
          </div>
          </div>
           <!-- 매치정보 -->
           <div class="mb-3">
			  <label for="matchinfo" class="form-label" id= ><b>내용</b></label>
			  <textarea class="form-control" name="ccontent" id="ccontent" rows="5"></textarea>
		   </div>
		   
		   <!-- 구장 사진 첨부 -->
        <div class="mb-3">
			  <label for="formFileMultiple" class="form-label"><b>파일선택</b><span class="text-muted">&nbsp;(여러장 가능)</span></label>
			  <input class="form-control" type="file" id="cfile" name="cfile" multiple>
			</div>
			 
          <div class="flex">
			  <input type="hidden" id="memnum" name="memnum" value="<%= memnum %>">
	          <button class="btn btn-primary btn-lg btn-block" type="submit" id="communitybtn" name="communitybtn">등록</button>
	          <button class="btn btn-primary btn-lg btn-block" type="submit" id="selectAllbtn" name="selectAllbtn">목록보기</button>
	          <button class="btn btn-primary btn-lg btn-block" type="reset">리셋</button>
          </div>
          </form>
          </div>
      </div>
</body>
</html>