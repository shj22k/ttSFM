<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.apache.log4j.LogManager" %>  
<%@ page import="org.apache.log4j.Logger" %>   
<%@ page import="main.sfm.match.vo.SfmMatchVO" %>
<%@ page import="java.util.List" %>
<% request.setCharacterEncoding("UTF-8");%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구장 목록</title>
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
<link rel="stylesheet" type="text/css" href="/ttSFM/include/sfmMatchSelectAll.css">
<script type='text/javascript'>

	function test(ths){
		location.href="/ttSFM/sfmMatchSelectCon.sfm?matchnum="+ths;
	}

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
		alert("jQuery ready() 함수 블럭 진입 >>> : ")

		$("#search_btn").click(function(){
			alert("search_btn 버튼 클릭 >>> : ");
			
			$("#boardList").attr({
				"method":"GET",
				"action":"sfmMatchSelectfilter.sfm",
			}).submit();
		});
	});

</script>
</head>
<body>
<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("shjMemSelectAll.jsp.jsp >>> : ");
	
	Object obj = request.getAttribute("listAll");
	if(obj == null) {return;}
	
	List<SfmMatchVO> list = (List<SfmMatchVO>)obj;
%>
<div class="container">
<form name="boardList" id="boardList">
<table class="table border-bottom table-sm">
<thead>
<div class="row">

       <!-- 지역 셀렉트  -->
        <div class="col-md-2 mb-3">
         <select class="custom-select d-block w-100" id="memaddr" name="memaddr">
           <option selected>지역</option>
           <option value="서울">서울</option>
           <option value="경기">경기</option>
           <option value="인천">인천</option>
         </select>
       </div>
       <!-- 지역 셀렉트  -->
       <div class="col-md-2 mb-3">
         <select class="custom-select d-block w-100" id="memposition" name="memposition">
           <option selected>포지션</option>
           <option value="공격수">공격수</option>
           <option value="미드필더">미드필더</option>
           <option value="수비수">수비수</option>
           <option value="골키퍼">골키퍼</option>
           <option value="상관없음">상관없음</option>
         </select>
       </div>
       
       <div class="col-md-2 mb-3">
         <select class="custom-select d-block w-100" id="memaddr" name="memaddr">
           <option selected>레벨</option>
           <option>아마추어</option>
           <option>프로</option>
           <option>프로</option>
         </select>
         <input type="button" id="search_btn" name="search_btn" value="검색">
       </div>
       &nbsp;
       <div class="input-group date">
	       <input style="width:110px" type="text" class="form-control2">
	       <span class="input-group-addon">
	        <i class="glyphicon glyphicon-calendar">&nbsp;
	       	 <img class="icon-margin" src="/ttSFM/img/fb/date.png" width="45px" onclick="date()">
	        </i>
	       </span>
   	</div>
</div>
<tr>
	<th>시간</th>	
	<th>글제목</th>
	<th>매치레벨</th>	
	<th>매치인원</th>
	<th>위치</th>
	<th>날짜</th>
</tr>
</thead>
<%
	if (list.size() > 0){
		for(int i=0; i < list.size(); i++){
			SfmMatchVO mtvo = list.get(i);
%>
<tbody>
<tr>
	<td style="width:10%"><%= mtvo.getMatchtime() %></td>
<%-- <td style="width:40%"><a href="#" onclick="test('<%= cvo.getCnum() %>');"><%= cvo.getCsubject() %></a></td> --%>
	<td style="width:10%"><a href="#" onclick="test('<%= mtvo.getMatchnum() %>');"><%= mtvo.getMatchstadium() %></a></td>
	<td style="width:10%"><%= mtvo.getMatchlv() %></td>	
	<td style="width:10%"><%= mtvo.getMatchpersonnel() %></td>
	<td style="width:10%"><%= mtvo.getMatchjibunaddress() %></td>
	<td style="width:8%"><%= mtvo.getMatchkickoff() %></td>				
</tr>
<%
	}	// end of for
}	// end of if
%>
</tbody>	
</table>
</form>	
</div>
</body>
</html>