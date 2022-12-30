<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

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
  
<script type="text/javascript" src="/kosmoSpring/js/common.js"></script>
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
	<th>글번호</th>	
	<th>글제목</th>
	<th>이름</th>	
	<th>사진</th>
	<th>날짜</th>
	<th>조회수</th>
</tr>
</thead>
<tbody>
<tr>
	<td style="width:5%">
		<input type="checkbox" id="bnum" name="bnum" class="bnum" value=1 >
	</td>			
	<td style="width:10%">1</td>
	<td style="text-align:left;">안녕하세요 이거는 공지사항입니다.</td>
	<td style="width:10%">김이름</td>	
	<td style="width:10%"><img src="/ttSFM/fileupload/board/" border="1" width="25" height="25" alt="image"></td>
	<td style="width:10%">이건날짜-입니-다요</td>
	<td style="width:8%">조회수</td>				
</tr>	
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