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
<title>공지사항</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<style type="text/css">
	/*
	div {		 
		margin: 0 auto; 		
		border:1px solid #6d82f3;
		display:table;
	}			
	*/
	td, th {
		 /*padding: 5px;*/
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
	*/
	
	.table-sm td, .table-sm th {
    padding: 1.1rem;
}
	
</style>
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
<tr>
	<td colspan="7" style="text-align:center">
		<h3><b>구장 목록</b></h3>
	</td>
</tr>
<tr>
	<th>
		<input type="checkbox" class="chkAll" name="chkAll" id="chkAll">
	</th>	
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
	<td style="width:5%">
		<input type="checkbox" id="bnum" name="bnum" class="bnum" value=1 >
	</td>			
	<td style="width:10%"><%= mtvo.getMatchtime() %></td>
	<td style="text-align:left;"><%= mtvo.getMatchstadium() %></td>
	<td style="width:10%"><%= mtvo.getMatchlv() %></td>	
	<td style="width:10%"><%= mtvo.getMatchpersonnel() %></td>
	<td style="width:10%"><%= mtvo.getMatchjibunaddress() %></td>
	<td style="width:10%"><%= mtvo.getMatchkickoff() %></td>
</tr>	
<%
		}	// end of for
	}
%>
<tr>
	<td colspan="7" style="text-align:right;">				
		<button type="button" class="btn btn-primary btn-sm" id="insertBtn">글쓰기</button>
		<button type="button" class="btn btn-primary btn-sm" id="selectAllBtn">글목록</button>
		<button type="button" class="btn btn-primary btn-sm" id="contentsBtn">글내용보기</button>		
		<button type="button" class="btn btn-primary btn-sm" id="selectBtn">글수정</button>		
		<button type="button" class="btn btn-primary btn-sm" id="deletetBtn">글삭제</button> 									
	</td>
</tr>	
</tbody>	
</table>
</form>	
</div>
</body>
</html>