<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%> 
<%@page import="main.sfm.member.vo.SfmMemVO" %>
<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>

<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("kosmoEventPage.jsp 진입 >>> : ");	
	String mid = "";
	String memnum =  request.getParameter("memnum");
	logger.info("memnum > "+memnum);
	
		
		session.getAttribute(memnum);
		//session.setAttribute("memnum", memnum);
%> 
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
  

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<!-- 달력 -->

    <!-- 검색바 -->
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous"
      integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<!-- 검색바 -->
	


<style type="text/css">
	/*
	div {		 
		margin: 0 auto; 		
		border:1px solid #6d82f3;
		display:table;
	}			
	*/
	td, th {
		 padding: 5px;
		 text-align: center;
	}

	/*
	table, th, td {
  		border: 1px solid black;
  		text-align: center;
	}
	ㅋ
	*/
	/*컨테이너 크기조절*/	
	.container {
    width: 100%;
    padding-right: 0px;
    padding-left: 0px;
    margin-right: auto;
    margin-left: auto;
    
}
	
	/*백그라운드*/
	
	body {
      min-height: 100vh;

      background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c));
      background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: linear-gradient(to top right, #ffffff 0%, #ffffff 100%);
    }
	
	/*백그라운드*/
	
	.table-sm td, .table-sm th {
    padding: 0.7rem;
}

.custom-select {
    display: inline-block;
    width: 100%;
    height: calc(1.5em + 0.75rem + 2px);
    padding: 0.375rem 1.75rem 0.375rem 0.75rem;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #495057;
    vertical-align: middle;
    background: #fff url(data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' width='4' height='5' viewBox='0 0 4 5'%3e%3cpath fill='%23343a40' d='M2 0L0 2h4zm0 5L0 3h4z'/%3e%3c/svg%3e) right 0.75rem center/8px 10px no-repeat;
    border: 2px solid #ced4da;
    border-radius: 1.25rem;
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
}

/*달력 아이콘 사이즈 조절*/
.input-group {
    position: relative;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-wrap: wrap;
    flex-wrap: wrap;
    -ms-flex-align: stretch;
    align-items: stretch;
    width: 15%;
}

.icon-margin {
	   margin: -6px;
	}
	
.form-control2 {
    display: block;
    width: 100%;
    height: calc(1.5em + 0.75rem + 2px);
    padding: 0.375rem 0.75rem;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #495057;
    background-color: #fff;
    background-clip: padding-box;
    border: 2px solid #ced4da;
    border-radius: 2.25rem;
    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
    z-index: -1;
}




.input-form {
      max-width: 1120px;
      margin-top: 0px;
      padding: 85px;

      background: #fff;
      -webkit-border-radius: 10px;
      -moz-border-radius: 10px;
      border-radius: 0px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
    }
    
    
    .table {
    width: 100%;
    margin-bottom: 1rem;
    color: #212529;
}


<!---->

/* 검색바 */

/*돋보기*/
.fa {
    display: inline-block;
    font: normal normal normal 14px/1 FontAwesome;
    font-size: inherit;
    text-rendering: auto;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
}

 .icon-margin2 {
    	margin:10px
    } 

* {box-sizing: border-box;}

body {
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}

.topnav {
  overflow: hidden;
  background-color: #efefef6b;
  padding : 3px;
}

.topnav .a {
  float: left;
  display: block;
  color: black;
  text-align: center;
  padding: 12px 22px;
  text-decoration: none;
  font-size: 23px;
}

.topnav .a:hover {
  background-color: #ddd;
  color: black;
}

.topnav .a.active {
  background-color: #fdfdfd00;
  color: white;
}

.topnav .search-container {
  float: right;
}

.topnav input[type=text] {
  padding: 12px;
  margin-top: 8px;
  font-size: 17px;
  border: none;
}

.topnav .search-container button {
  float: right;
  padding: 8px 10px;
  margin-top: 8px;
  margin-right: 16px;
  background: #ddd;
  font-size: 17px;
  border: none;
  cursor: pointer;
}

.topnav .search-container button:hover {
  background: #ccc;
}

@media screen and (max-width: 600px) {
  .topnav .search-container {
    float: none;
  }
  .topnav .a, .topnav input[type=text], .topnav .search-container button {
    float: none;
    display: block;
    text-align: left;
    width: 100%;
    margin: 0;
    padding: 14px;
  }
  .topnav input[type=text] {
    border: 1px solid #ccc;  
  }
}

.flex {
	display:flex;
	}
	
	.left {
      width:100%; 
      height:800px;
      border:1px solid white;
      float:left;
      box-shadow: 0 8px 20px 0 rgb(0 0 0 / 15%);
	    padding-top: 45px;
	    padding-right: 35px;
	    padding-bottom: 35px;
	    padding-left: 35px;
      
    }
	
	
	.right {
      width:700px; 
      height:800px;
      border:1px solid white;
      float:right;
      box-shadow: 0 8px 20px 0 rgb(0 0 0 / 15%);
      padding : 35px;
      
    }
    
    
    .left2 {
      width:46%; 
      height:100px;
      border:1px solid white;
      border-radius: 25px;
      float:left;
      margin:5px;
      background: #efefef6b;
       padding : 15px;
      
    }
	
	
	.right2 {
      width:46%; 
      height:100px;
      border:1px solid white;
      border-radius: 25px;
      float:left;
      margin:5px;
      background: #efefef6b;
       padding : 15px;
       float:right;
    }
    
     .center1 {
      width:100%; 
      height:100px;
      border:1px solid white;
      border-radius: 25px;
      float:left;
      margin:5px;
      background: #ffeb8a;
      padding : 15px;
    }
/*프로필*/
.profile-picture {
    margin-top: 20px;
    text-align: center;
}

.profile-img {
 border-radius: 60%;
}
.title-name,.title-nickname {
    margin: 10px;
    text-align: center;
    font-family: "Noto Sans Kr"
}
.content {
/*    margin: 20px;*/
    position: absolute;
    top: 40%;
    left: 50px;
    line-height: 1.5;
}
.content>p{
    margin-top: 5px;
    font-family: "Noto Sans Kr";
    font-size: 18px;
}
.profile-box {
    width: 50%;
    height: 320px;
    background: white;
    border-radius: 20px;
    position: absolute;
    left: 30px;
    top: 50px;
}


.btn-block {
    display: block;
    width: 12%;
}

.btn-block+.btn-block {
    margin-top: 0rem;
    margin-left: 10px;
}

</style>
	
	


</head>
<script type="text/javascript">
$(document).ready(function(){
	

	$(document).on('click','#eventbtn', function(){
		alert("작성했습니다. >>> ");
		//리터럴객체
		$('#eventinsertForm').attr({
			"action":"sfmEventInsert.sfm",
			"method":"POST",
			"enctype":"multipart/form-data"
		}).submit();
	});
	//s
	$(document).on("click","#selectbtn",function(){
		$('#eventinsertForm').attr({
			"action":"sfmEventSelectAll.sfm",
			"method":"GET",
			"enctype":"application/x-www-form-urlencoded"
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
<script>


	$(function(){
	    $('.datetimepicker').appendDtpicker({'locale':'ko'});
	});
</script>
	<!-- 달력 -->
	
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
        <h4 class="mb-3"><b>****이벤트**** </b></h4>
        <br>
        <form class="validation-form" name = "eventinsertForm" id="eventinsertForm" novalidate>
        
        <!-- 매치제목 -->
            <div class="mb-3">
              <label for="name"><b>제목</b></label>
              <input type="text" class="form-control" id="eventtitle" name="eventtitle" placeholder="글제목" value="" required>
              <div class="invalid-feedback">
                이름을 입력해주세요.
              </div>
          </div>
          
           <!-- 매치정보 -->
           <div class="mb-3">
			  <label for="matchinfo" class="form-label" id= ><b>글 내용</b></label>
			  <textarea class="form-control" id="eventcontent" name="eventcontent" rows="5"></textarea>
		   </div>
		   
		   <!-- 구장 사진 첨부 -->
			
		<div class="row">
			<div class="col-md-6 mb-3">
              <label for="root"><b>이벤트 진행 여부</b></label>
               <select class="form-select" id="event" name="event" aria-label="Default select example" >
       			<option value="[이벤트 진행중]" selected>[이벤트 진행중]</option>
       			<option value="[이벤트 마감]">[이벤트 마감]</option>
              </select>
              <div class="invalid-feedback">
              </div>
              </div>
			
		   <div class="col-md-6 mb-3">
            <label for="root"><b>이벤트 마감 시간 </b></label>
          	 <input type="text" name="enddate" id="enddate" value="" class="datetimepicker form-control"/>
           </div>
        </div>  
        
        <div class="mb-3">
			  <label for="formFileMultiple" class="form-label"><b>이벤트 사진 선택</b><span class="text-muted">&nbsp;(여러장 가능)</span></label>
			  <input class="form-control" type="file" id="eventphoto" name="eventphoto" multiple>
			</div>
			
			 
          <div class="flex">
          <button class="btn btn-primary btn-lg btn-block" type="button" id="eventbtn" name="eventbtn">등록</button>         
          <button  class="btn btn-primary btn-lg btn-block" type="button" id="selectbtn">전체목록</button>		
			<input type="hidden" id="memnum" name="memnum" value="memnum">
          </div>
          </div>
      </div>
      </form>
</body>
</html>