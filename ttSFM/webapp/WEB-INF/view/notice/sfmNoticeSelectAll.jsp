<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.apache.log4j.LogManager" %>  
<%@ page import="org.apache.log4j.Logger" %> 
<%@ page import="java.util.List" %>  
<%@page import="main.sfm.member.vo.SfmMemVO" %>
<%@page import="main.sfm.notice.vo.SfmNoticeVO" %>

<% request.setCharacterEncoding("UTF-8");%> 
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
<link rel="stylesheet" type="text/css" href="/ttSFM/include/sfmNoticeSelectAll.css">
	<!-- 검색바 -->

  <script type='text/javascript'>
  $(document).ready(function(){
		
		//kbnum 체크박스 체크 확인하기
		$(document).on("click","#chkAll",function(){
			if($(this).prop('checked')){
				$('chkAll').prop('checked',false);
			}
		});
		
		//I
		$(document).on("click","#insertBtn",function(){
			
			$('#sfmNoticeList').attr({
				"action":"sfmNoticeInsertForm.sfm",
				"method":"GET",
				"enctype":"application/x-www-form-urlencoded"
			}).submit();
		});
		
		//U - 수정버튼
		$(document).on("click","#updateBtn",function(){

				$('#sfmNoticeList').attr({
					"action":"sfmNoticeSelectCon.sfm",
					"method":"GET",
					"enctype":"application/x-www-form-urlencoded"
				}).submit();
			
		});
		
		//D- 삭제합시다
		$(document).on("click","#deleteBtn",function(){
			$('#sfmNoticeList').attr({
				"action":"sfmNoticeDelete.sfm",
				"method":"GET",
				"enctype":"application/x-www-form-urlencoded"
			}).submit();
		});
	});
  
    function date(){

        $('.input-group.date').datepicker({

            calendarWeeks: false,

            todayHighlight: true,

            autoclose: true,

            format: "yyyy/mm/dd",

            language: "kr"

        });

    });

    </script>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("sfmNoticeSelectAll.jsp >>> :");
%>
<form name="sfmNoticeList" id="sfmNoticeList">
<!-- 상단바 -->
<div style="padding:0px 400px 0px 400px;">
<div class="topnav">
	<a>
		<img src="/ttSFM/img/fb/tikilogo2.png" width="150px">
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
      <input type="text" style="width:400px;" placeholder="Search.." name="search">
      <button type="submit" style="width:50px;"><i class="fa fa-search"></i></button>
    </form>
  </div>
  
</div>
<!-- 상단바 끝-->
<div class="container">
    <div class="input-form-backgroud">
    <div class="input-form col-md-12 mx-auto">
    	<div class="input-form-backgroud">
<form name="boardList" id="boardList">
<div align="center">
	<h3><b>공지사항</b></h3>
	<br>
	<br>
</div>
<table class="table border-bottom table-sm">
<thead>
<tr>
	<th><input type="checkbox" name="chkAll" id="chkAll"></th>
	<th>공지번호</th>
	<th>작성자</th>
	<th>공지제목</th>
	<th>공지내용</th>
	<th>등록일</th>
	<th>수정일</th>
</tr>
</thead>
<%

	Object obj = request.getAttribute("listAll");
	if (obj == null){ return; }
	
	List<SfmNoticeVO> list = (List<SfmNoticeVO>)obj;
	String memnum = list.get(0).getMemnum();
	System.out.print("memnum >>> : " + memnum);
	session.setAttribute("memnum", memnum);

	if (list.size() > 0){
		for (int i=0; i < list.size(); i++){
			SfmNoticeVO snvo = list.get(i);
%>
<tbody>
<tr>
	<td class="tt">
		<input type="checkbox" id="chkbox" name="chkbox" class="chkbox" value=<%= snvo.getNoticenum() %>>
	</td>	
	<td style="width:10%"><%= snvo.getNoticenum() %></td>
	<td style="text-align:center;">관리자</td>
	<td style="width:10%"><%= snvo.getNoticetitle() %></td>
	<td style="width:10%"><%= snvo.getNoticecontent() %></td>
	<td style="width:8%"><%= snvo.getInsertdate() %> </td>	
	<td style="width:10%"><%= snvo.getUpdatedate() %></td>
			
</tr>	
<%
		} // end of for
%>	

<%		
	}//end of if
%>
<tr>
	<td colspan="7" style="text-align:right;">				
		<button type="button" class="btn btn-primary btn-sm" id="insertBtn">글쓰기</button>
		<button type="button" class="btn btn-primary btn-sm" id="selectBtn">글목록</button>
		<button type="button" class="btn btn-primary btn-sm" id="updateBtn">글수정</button>		
		<button type="button" class="btn btn-primary btn-sm" id="deleteBtn">글삭제</button> 									
	</td>
</tr>	
</tbody>	
</table>
</form>	
</div>
    </div>
    </div>
</div>
</div>
    <!--  하단바~~~~~~~~~~~~~~~~~~~~~ -->
<div class="topnav">
  <a class="active" href="#home"><img src="/ttSFM/img/fb/tikilogo2.png" width="150px" ;></a>
  	
  <div class="search-container">
    <form action="/action_page.php">
      <input type="text" style="width:400px;" placeholder="Search.." name="search">
      <button type="submit" style="width:100px;"><i class="fa fa-search"></i></button>
    </form>
  </div>
</form> 
</body>
</html>