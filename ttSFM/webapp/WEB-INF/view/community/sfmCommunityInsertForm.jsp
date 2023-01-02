<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>

<%@page import="java.util.List"%> 
<%@page import="main.sfm.member.vo.SfmMemVO" %>
<%@page import="org.apache.log4j.LogManager" %>
<%@page import="org.apache.log4j.Logger" %>
<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("CommunityPage.jsp 진입 >>> : ");	
	HttpSession ss = request.getSession();
    String memnum = (String)ss.getAttribute("memnum");
	logger.info("memnum >> "+ memnum);
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
		
		$(document).on('click','#communitybtn', function(){
			alert("noticebtn버튼 클릭  >>> ");
			//리터럴객체
			$('#communityinsertForm').attr({
				"action":"sfmCommunityInsert.sfm",
				"method":"POST",
				"enctype":"multipart/form-data"
			}).submit();
		});
		
		$(document).on('click','#selectAllbtn', function(){
			alert("noticebtn버튼 클릭  >>> ");
			//리터럴객체
			$('#communityinsertForm').attr({
				"action":"sfmCommunitySelectAll.sfm",
				"method":"GET",
			}).submit();
		});
	});

</script>
<body>
<h3 style = "color:blue">커뮤니티</h3>
<hr>
<form name ="communityinsertForm" id ="communityinsertForm">
<table border="1">
<!-- 글번호 - 제목 - 작성자 - 작성일 - 조회 -->
	<tr>
		<td colspan="2" align="center">					
			<font size="4" style="color:Blue;">커뮤니티 입력</font>					
		</td>
	</tr>
	<tr>
		<td>글번호</td>
		<td>
			<input type ="text" class="cnum" name="cnum" id="cnum" placeholder = "글번호" style = "width:250px;" readonly>
		</td>
	</tr>
	<tr>
		<td>제목</td>
		<td>
			<input type = "text" class ="csubject" name="csubject" id= "csubject" placeholder = "글제목" style = "width:250px;">
		</td>
	</tr>
	<tr>
		<td>작성자</td>
		<td>
			<input type = "text" class ="cname" name="cname" id= "cname" placeholder = "작성자" style = "width:250px;">
		</td>
	</tr>
	<tr>
		<td>내용</td>
		<td>
			<textarea class = "ccontent" name = "ccontent" id="ccontent" rows="5" cols="50">글내용
			</textarea>
		</td>
	</tr>
	<tr>
		<td class="cfile">사진</td>
		<td> 
			<input type="file" id="cfile" name="cfile"/><br>
		</td>
	</tr>
	<tr>
		<td colspan = "2">
			<input type="hidden" id="memnum" name="memnum" value="<%= memnum %>">
			<button type="button" id="communitybtn" name="communitybtn">등록하기</button>
			<button type="button" id="selectAllbtn" name="selectAllbtn">전체 목록 보기</button>		
			<button type="reset">다시 </button>
		</td>
	</tr>
</table>
</form>
</body>
</html>