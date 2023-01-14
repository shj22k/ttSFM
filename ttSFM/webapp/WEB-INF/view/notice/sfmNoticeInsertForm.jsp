<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.util.List"%> 
<%@page import="main.sfm.member.vo.SfmMemVO" %>
<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>
<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("kosmoNoticePage.jsp 진입 >>> : ");	
	String memnum =  request.getParameter("memnum");
	logger.info("memnum >> "+ memnum);
	session.getAttribute(memnum);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  
<script type="text/javascript" src="/kosmoSpring/js/common.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<!-- 달력 -->

    <!-- 검색바 -->
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous"
      integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<link rel="stylesheet" type="text/css" href="/ttSFM/include/sfmNoticeInsertForm.css">
</head>
<script type="text/javascript">

	$(document).ready(function(){
		
		$(document).on('click','#noticebtn', function(){
			alert("작성했습니다.");
			//리터럴객체
			$('#noticeinsertForm').attr({
				"action":"sfmNoticeInsert.sfm",
				"method":"POST",
			}).submit();
		});
		
		$(document).on('click','#noticeselbtn', function(){
			
		      $('#noticeinsertForm').attr({
		         "action":"sfmNoticeSelectAll.sfm",
		         "method":"GET",
		      }).submit();
	     });
	});

</script>
<body>
	
	<!-- 달력 -->
<link rel="stylesheet" href="//mugifly.github.io/jquery-simple-datetimepicker/jquery.simple-dtpicker.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="//mugifly.github.io/jquery-simple-datetimepicker/jquery.simple-dtpicker.js"></script>

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
        <h4 class="mb-3"><b>공지사항 등록</b></h4>
        <br>
        <form name = "noticeinsertForm" id = "noticeinsertForm">
        <div class="row">
        <!-- 매치제목 -->
          <div class="col-md-3 mb-3">
              <label for="name"><b>제목</b></label>
              <input type="text" class="form-control" id="noticetitle" name="noticetitle" placeholder="글제목" value="" style="width:500px;">
              <div class="invalid-feedback">
                제목을 입력해주세요.
              </div>
          </div>
           &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
          <div class="col-md-3 mb-3">
              <label for="name"><b>이름</b></label>
              <input type="text" class="form-control" id="matchstadium" placeholder="" value="" style="width:250px;">
              <div class="invalid-feedback">
                이름을 입력해주세요.
              </div>
          </div>
          </div>
           <!-- 매치정보 -->
           <div class="mb-3">
			  <label for="matchinfo" class="form-label" id= ><b>내용</b></label>
			 <textarea class="form-control" id="noticecontent" name="noticecontent" rows="5" style=" height: 400px;"></textarea>
		   </div>
			 
          <div class="flex">
			<button class="btn btn-primary btn-lg btn-block" type="submit" id="noticebtn" name="noticebtn">등록</button>
			<input type="hidden" id="memnum" name="memnum" value="">
			<button type="reset">리셋</button>
			<button class="btn btn-primary btn-lg btn-block" type="submit" id="noticeselbtn" name="noticeselbtn">공지사항 목록 조회</button>
          </div>
          </form>
          </div>
      </div>
</body>
</html>