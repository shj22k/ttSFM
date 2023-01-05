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
<% request.setCharacterEncoding("UTF-8"); %>
<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("sfmnoticeUISelectCon.jsp >>> : ");
	
// 	String noticenum = request.getParameter("noticenum");
// 	session.setAttribute("noticenum", noticenum);
%> 

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">

	function fn_link(ths){
		location.href="/ttSFM/sfmNoticeSelectConUI.sfm?noticenum="+ths;
	}

	$(document).ready(function(){
		
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
<div class ="container">
<h3>공지목록</h3>
<hr>
<form name="sfmNoticeList" id="sfmNoticeList">
<table class="table table-striped" border ="1" align ="center">
<thead>
<tr>
		<th>순번</th>
		<th>공지번호</th>
		<th>공지제목</th>
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
	<td class="tt"><%= i + 1 %></td>
	<td class="tt"><%= snvo.getNoticenum() %></td>
	<td class="tt"><a href="#" onclick="fn_link('<%= snvo.getNoticenum() %>');"><%= snvo.getNoticetitle() %></a></td>
</tr>
<%
		} // end of for
	}//end of if
%>
</tbody>	
</table>
</form>
</div>	
</body>
</html>