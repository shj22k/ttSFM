<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
    
<%@ page import="org.apache.log4j.LogManager" %>  
<%@ page import="org.apache.log4j.Logger" %> 
<%@ page import="java.util.List" %>  
<%@page import="main.sfm.member.vo.SfmMemVO" %>
<%@page import="main.sfm.event.vo.SfmEventVO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("CommunityPage.jsp 진입 >>> : ");	

	String eventnum =  request.getParameter("eventnum");	
	session.setAttribute("eventnum",eventnum);
	
	HttpSession ss = request.getSession();
    String memnum = (String)ss.getAttribute("memnum");
	logger.info("memnum >> "+ memnum);
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
<script type="text/javascript">

	$(document).ready(function(){
		//전체조회
		$(document).on("click","#selectBtn",function(){
			$('#sfmeventList').attr({
				"action":"sfmEventSelectAllUser.sfm",
				"method":"GET",
				"enctype":"application/x-www-form-urlencoded"
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

	h3 {
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
</style>
</head>
<body>
<!-- 상단바 -->

<div style="padding:0px 400px 0px 400px;">
<div class="topnav">
	<form id="maindata" name="maindata">
          <img type="" id="maingo" src="/ttSFM/img/fb/tikilogo2.png" width="125px;">	<!-- 구장 예약 내역 아이콘 -->
  	
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
    	
    	<!-- 복붙-------------------------------------- -->
<h3><b>이벤트</b></h3>
<br>    	
<form name="sfmeventList" id="sfmeventList">
<table class="table">
<%
	Object obj = request.getAttribute("listAll_1");
	if (obj == null){ return; }
	

	List<SfmEventVO> list = (List<SfmEventVO>)obj;
	if (list.size() > 0){
		logger.info("list.size() <<\\"+list.size());
		for (int i=0; i < list.size(); i++){
			SfmEventVO sevo = list.get(i);
%>
<tr>
<td>제목</td>
<td colspan="10" style="text-align:left;width:400;">
	<font size="4" style="color:black;"><%= sevo.getEvent() %>     <%= sevo.getEventtitle() %></font>
	<input type="hidden" name="bnum" id="bnum" value="" />
</td>
</tr>
<tr>
	<td>아이디</td>
	<td>admin1234
	<td>이름 : 관리자</td><td class="td_1"></td>
	<td class="td_2">   작성일자 : <%= sevo.getInsertdate() %> </td>
</tr>

<tr>
	<td colspan="6" style="text-align:left"> 
		<img src="/ttSFM/fileupload/event_photo/<%= sevo.getEventphoto() %> " border="1" width="200" height="100" alt="image"><br>
	</td>
</tr>
<tr>
	<td colspan="6" style="text-align:left">
		<textarea class="form-control" name="eventcontent" id="eventcontent" rows="5" cols="100" readonly><%= sevo.getEventcontent() %>					
		</textarea>
	</td>
</tr>
<%
		} // end of for
	}//end of if
%>
<tr>
<td colspan="6" align="center"> 
		<input type ="hidden" id = "eventnum" name = "eventnum" value ="<%= eventnum %>">
		
		<button type="button" class="btn btn-primary" id="selectBtn">글목록</button>
		
</td>				
</tr>
</table>
</div>
</div>
</div>
    	
    	
    
</div>
</body>
</html>