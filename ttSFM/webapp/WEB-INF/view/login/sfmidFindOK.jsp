<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="main.sfm.member.vo.SfmMemVO"%>  
<%@page import="java.util.List"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IDFIND OK</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){	
	
	// 로그인 하러 가기 
	$(document).on("click", "#login", function(e){
		e.preventDefault();
	
		$('#idFindForm').attr({
			'action':'sfmLoginForm.sfm',
			'method':'GET',
			'enctype':'application/x-www-form-urlencoded'
		}).submit();
	});		
	
	// 비밀번호 찾으러 가기 
	$(document).on("click", "#pwFine", function(e){
		e.preventDefault();	
		
		$('#idFindForm').attr({
			'action':'#',
			'method':'GET',
			'enctype':'application/x-www-form-urlencoded'
		}).submit();
	});		
});

</script>
</head>
<body>
IDFIND OK
<hr>

<% request.setCharacterEncoding("UTF-8"); %>
<%
	Object obj = request.getAttribute("midFind");
	if (obj == null) return;
	
	List<SfmMemVO> list = (List<SfmMemVO>)obj;
	String memid = list.get(0).getMemid();
	String insertdate = list.get(0).getInsertdate();	
%>

<form name="idFindForm" id="idFindForm">
회원님의 정보와 일치하는 아이디 목록 입니다.
<table border="1">
<tr>
<td>
<input type="radio" name="memid" id="memid"><%= memid %>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
가입 : <%= insertdate %>
</td>
</tr>
<tr>
<td align="center">
<button id="login" style="background-color: yellow;">로그인하기</button>
<button id="pwFine">비밀번호 찾기</button>
</td>
</tr>
</table>
</form>
</body>
</html>