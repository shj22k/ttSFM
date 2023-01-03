<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.apache.log4j.LogManager" %>  
<%@ page import="org.apache.log4j.Logger" %>   
    
<%@ page import="main.sfm.community.vo.SfmCommunityVO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("sfmCommunitySelectCon.jsp >>> : ");
	
	String cnum = request.getParameter("cnum");
	session.setAttribute("cnum", cnum);
%> 
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		alert("ready 함수 진입");
		
		// 목록으로 이동
		$('#selectBtn').on('click', function(){
			alert("selectAllbtn버튼 클릭  >>> ");
			//리터럴객체
			$('#commucon').attr({
				"action":"sfmCommunitySelectAll.sfm",
				"method":"GET",
			}).submit();
		});
		
		// 수정하기
		$("#updateBtn").on("click",function(){
			alert("updateBtn버튼 클릭  >>> ");

			$('#commucon').attr({
				"action":"sfmCommunityUpdateForm.sfm",
				"method":"GET",
			}).submit();
		});
	});
	
</script>
</head>
<body>
<%
	Object obj = request.getAttribute("listS");
	if(obj==null) {return;}
	
	List<SfmCommunityVO> list = (List<SfmCommunityVO>)obj;
	if(list.size() > 0){
		for(int i=0; i<list.size(); i++){
			SfmCommunityVO cvo = list.get(i);
%>
<h3 align="center"></h3>
<hr>
<form name="commucon" id="commucon">
<table border="1" align="center">
<thead>
<tr>
	<td>글번호</td>
	<td>제목</td>
	<td>작성자</td>
	<td>글내용</td>
	<td>등록일</td>
	<td>파일</td>
</tr>
</thead>
<tbody>
<tr>
	<td class="tt" align="center"><%= cvo.getCnum() %></td>
	<td class="tt"><%= cvo.getCsubject() %></td>
	<td class="tt"><%= cvo.getCname() %></td>
	<td class="tt"><%= cvo.getCcontent() %></td>
	<td class="tt"><%= cvo.getInsertdate() %></td>
	<td class="tt" align="center"><img src="/ttSFM/fileupload/community_photo/<%= cvo.getCfile() %>" border="1" width="25" height="25" alt="image"></td>
</tr>
<tr>
	<td colspan="9" align="right">	
		<input type="hidden" id="cnum" name="cnum" value="<%= cnum %>" />
		<button type="button" class="btn btn-dark" id="selectBtn">목록으로 이동</button> 												
		<button type="button" class="btn btn-warning" id="updateBtn">수정하기</button>		
	</td>
</tr>	
</tbody>			
<%		
		}
	}
%>
</table>
</form>
</body>
</html>