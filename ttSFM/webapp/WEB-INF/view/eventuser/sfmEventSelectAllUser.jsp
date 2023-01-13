<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="org.apache.log4j.LogManager" %>  
<%@ page import="org.apache.log4j.Logger" %> 
<%@ page import="java.util.List" %>  
<%@page import="main.sfm.member.vo.SfmMemVO" %>
<%@page import="main.sfm.event.vo.SfmEventVO" %>
<% request.setCharacterEncoding("UTF-8");%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 목록</title>
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
  <link rel="stylesheet" type="text/css" href="/ttSFM/include/sfmEventSelectAll.css">
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
    
    function test(ths){
    	
        location.href="/ttSFM/sfmEventSelectUser.sfm?eventnum="+ths;
     }

    </script>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("sfmEventSelectAllUser.jsp >>> :");
%>
<!-- 상단바 -->

<div style="padding:0px 400px 0px 400px;">
<div class="topnav">
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

<div class="container">
    <div class="input-form-backgroud">
    <div class="input-form col-md-12 mx-auto">
    	<div class="input-form-backgroud">
<form name="sfmeventList" id="sfmeventList">
<div align="center">
	<h3><b>이벤트 목록</b></h3>
	<br>
	<br>
	</div>
<table class="table border-bottom table-sm">
<thead>

<div class="row">
<tr>
	
	<th>이벤트번호</th>
	<th>이벤트진행여부</th>
	<th>이벤트제목</th>
	<th>마감일</th>	
	<th>등록일</th>
	
</tr>
</thead>
<%

	Object obj = request.getAttribute("listAll");
	if (obj == null){ return; }
	
	List<SfmEventVO> list = (List<SfmEventVO>)obj;
	if (list.size() > 0){
		for (int i=0; i < list.size(); i++){
			SfmEventVO sevo = list.get(i);
%>
<tbody>
<tr>
	
	<td class="tt" style="width:10%"><%= sevo.getEventnum() %> </td>
	<td class="tt" style="width:10%"><%= sevo.getEvent() %> </td>		
	<td class="tt" style="width:10%"><a href="#" onclick="test('<%= sevo.getEventnum() %>');"><%= sevo.getEventtitle() %></a></td>
	<td class="tt" style="width:10%"><%= sevo.getEnddate() %></td>
	<td class="tt" style="width:10%"><%= sevo.getInsertdate() %></td>
	
</tr>	
<%
		} // end of for
	}//end of if
%>

</tbody>		
</table>
</form>	
</div>
</div>
</div>
</div>
</div>
</body>
</html>