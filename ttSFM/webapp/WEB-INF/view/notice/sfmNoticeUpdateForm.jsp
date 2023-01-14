<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.util.List"%> 
<%@page import="main.sfm.member.vo.SfmMemVO" %>
<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>
<%@page import="main.sfm.notice.vo.SfmNoticeVO" %>
<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("kosmoNoticePage.jsp 진입 >>> : ");	
	String mid = "";
	String memnum =  "";
	
	session.setAttribute("memnum", memnum);
	logger.info("memnum > "+memnum);
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
			alert("수정되었습니다.");
			//리터럴객체
			$('#noticeinsertForm').attr({
				"action":"sfmNoticeUpdate2.sfm",
				"method":"GET",
			}).submit();
		});
	});
	
</script>
<body>
<% 
Object obj = request.getAttribute("a");
	if (obj == null){ return; }
	
	List<SfmNoticeVO> list = (List<SfmNoticeVO>)obj;
	if( list != null && list.size() != 0){
		SfmNoticeVO snvo = list.get(0); 
%>	
<h3 style = "color:blue">공지사항</h3>
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
			<input type ="text" class="noticenum" name="noticenum" id="noticenum" placeholder = "글번호" style = "width:250px;" value ="<%= snvo.getNoticenum() %>" readonly>
		</td>
	</tr>
	<tr>
		<td>공지제목</td>
		<td>
			<input type = "text" class ="noticetitle" name="noticetitle" id= "noticetitle" style = "width:250px;" value ="<%= snvo.getNoticetitle() %>">
		</td>
	</tr>
	
	<tr>
		<td>공지내용</td>
		<td>
			<textarea class = "noticecontent" name = "noticecontent" id="noticecontent" rows="5" cols="50" ><%= snvo.getNoticecontent() %>
			</textarea>
		</td>
	</tr>
	<tr>
		<td colspan = "2">
			<button type="button" id="noticebtn">수정보내기</button>		
			<input type="hidden" id="memnum" name="memnum" value="">
			<button type="reset">다시 </button>
		</td>
	</tr>
<%
	}	
%>
</table>
</form>
</body>
</html>