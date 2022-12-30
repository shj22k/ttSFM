<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.util.List"%> 
<%@page import="main.sfm.member.vo.SfmMemVO" %>
<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>

<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("kosmoNoticePage.jsp 진입 >>> : ");	
	String mid = "";
	String memnum =  request.getParameter("memnum");
	logger.info("memnum > "+memnum);
	//Object obj = request.getAttribute("listLogin");
	
	/*
	if (obj !=null) {
		List<SfmMemVO> list = (List<SfmMemVO>)obj;

		int nCnt = list.size();	
		
		logger.info("nCnt"+nCnt);
		if (nCnt == 1) {
			memnum = list.get(0).getMemnum();
			logger.info("memnum"+memnum);
		}
		
	}
		*/
		session.setAttribute("memnum", memnum);
%> 


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!-- 디바이스에 최적화된 크기로 출력됨 --------------------------->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- jQuery CDN 불러오기-------------------------------- -->
<script src = "http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	

	$('#noticeinsertForm').on('click','#noticebtn', function(){
		alert("작성했습니다. >>> ");
		//리터럴객체
		$('#noticeinsertForm').attr({
			"action":"sfmNoticeInsert.sfm",
			"method":"POST",
			
		}).submit();
	});
});
</script>
<body>





<h3 style = "color:blue">

공지사항

</h3>
<hr>
<form name = "noticeinsertForm" id = "noticeinsertForm">
<table border="1">
	<tr>
		<td colspan="2" align="center">					
			<font size="4" style="color:Blue;">공지사항 입력</font>					
			<!-- <img src="" width="25" height="25" alt="image"> -->
		</td>
	</tr>
	<tr>
		<td>공지번호</td>
		<td>
			<input type ="text" class="noticenum" name="noticenum" id="noticenum" placeholder = "글번호" style = "width:250px;" readonly>
		</td>
	</tr>
	<tr>
		<td>공지제목</td>
		<td>
			<input type = "text" class ="noticetitle" name="noticetitle" id= "noticetitle" placeholder = "글제목" style = "width:250px;">
		</td>
	</tr>
	
	<tr>
		<td0>공지내용</td>
		<td>
			<textarea class = "noticecontent" name = "noticecontent" id="noticecontent" rows="5" cols="50">글내용
			</textarea>
		</td>
	</tr>

	<tr>
		<td colspan = "2">
	
			<button type="button" id="noticebtn">보내기</button>		
			<input type="hidden" id="memnum" name="memnum" value="">
			<button type="reset">다시 </button>
		</td>
	</tr>
</table>
</form>
</body>
</html>