<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="org.apache.log4j.LogManager" %>  
<%@ page import="org.apache.log4j.Logger" %> 
<%@ page import="java.util.List" %>  
<%@page import="main.sfm.member.vo.SfmMemVO" %>
<%@page import="main.sfm.notice.vo.SfmNoticeVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	//kbnum 체크박스 체크 확인하기
	$(document).on("click","#chkAll",function(){
		if($(this).prop('checked')){
			$('chkAll').prop('checked',false);
			//$(this).prop('checked',true);
		}
	});
	
	//I
	$(document).on("click","#insertbtn",function(){
		
		$('#sfmNoticeList').attr({
			"action":"sfmNoticeInsertForm.sfm",
			"method":"GET",
			"enctype":"application/x-www-form-urlencoded"
		}).submit();
	});
	
	//U - 수정버튼
	$(document).on("click","#updateBtn",function(){

			$('#sfmNoticeList').attr({
				"action":"sfmNoticeUpdate.sfm",
				"method":"GET",
				
			}).submit();
		
	});
	
	//D- 삭제합시다
	$(document).on("click","#deletetBtn",function(){
		$('#sfmNoticeList').attr({
			"action":"sfmNoticeDelete.sfm",
			"method":"GET",
			"enctype":"application/x-www-form-urlencoded"
		}).submit();
	});

});
</script>
<style type ="text/css">
	td, th{
		padding :5px;
	}
	h3,th{
		text-align:center;
	}
	.tt{
		text-align:center;
	}
	#round1{
		border-radius:5px;
		/*
			border-top-left-radius:5px;
			border-top-right-radius:5px;
			border-bottom-left-radius:5px;
			border-bottom-right-radius:5px;
			
		*/			
	}
	#round2{
		border-top-left-radius:5px;
		border-top-left-radius:5px;
	}
	#circle{ border-radius:50%;}
</style>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("sfmNoticeSelectAll.jsp >>> :");
%>
<div class ="container">
<h3>공지목록</h3>
<hr>
<form name="sfmNoticeList" id="sfmNoticeList">
<table class="table table-striped" border ="1" align ="center">
<thead>
<tr>
	<th><input type="checkbox" name="chkAll" id="chkAll"></th>
	<th>공지번호</th>
	<th>작성자</th>
	<th>공지제목</th>
	<th>공지내용</th>
	<th>등록일</th>
	<th>수정일</th>
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
	
	<td class="tt"><%= snvo.getNoticenum() %></td>
	<td class="tt">관리자</td>
	<td class="tt"><%= snvo.getNoticetitle() %></td>
	<td class="tt"><%= snvo.getNoticecontent() %></td>	
	<td class="tt"><%= snvo.getInsertdate() %> </td>
	<td class="tt"><%= snvo.getUpdatedate() %> </td>			
	<td class="tt"><%= snvo.getMemnum() %> </td>			
	
	
</tr>	
<%
		} // end of for
%>	

<%		
	}//end of if
%>
<tr>
	<td colspan="9" align="right">	
		<button type="button" class="btn btn-danger" id="insertbtn">글쓰기</button>	
		<button type="button" class="btn btn-primary" id="selectBtn">글목록</button>
		<button type="button" class="btn btn-warning" id="updateBtn">글수정</button>		
		<button type="button" class="btn btn-dark" id="deletetBtn">글삭제</button> 												
	</td>
</tr>	
</tbody>	
</table>
</form>
</div>	
</body>
</html>