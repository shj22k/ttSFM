<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.apache.log4j.LogManager" %>  
<%@ page import="org.apache.log4j.Logger" %>   
    
<%@ page import="main.sfm.notice.vo.SfmNoticeVO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("sfmNoticeSelectCon.jsp >>> : ");
	
	String noticenum = request.getParameter("noticenum");
	session.setAttribute("noticenum", noticenum);
%> 
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
	});
	
</script>
</head>
<body>
<%
	Object obj = request.getAttribute("listS");
	if(obj==null) {return;}
	
	List<SfmNoticeVO> list = (List<SfmNoticeVO>)obj;
	if(list.size() > 0){
		for(int i=0; i<list.size(); i++){
			SfmNoticeVO snvo = list.get(i);
%>
<h3 align="center"></h3>
<hr>
<form name="commucon" id="commucon">
<table border="1" align="center">
<thead>
<tr>
	<td>글번호</td>
</tr>
</thead>
<tbody>
<tr>
	<td class="tt" align="center"><%= snvo.getNoticenum() %></td>
</tr>
<tr>
	<td colspan="9" align="right">	
		<input type="hidden" id="noticenum" name="noticenum" value="<%= noticenum %>" />
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