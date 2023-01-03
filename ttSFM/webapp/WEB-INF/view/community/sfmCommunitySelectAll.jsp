<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="org.apache.log4j.LogManager" %>  
<%@page import="org.apache.log4j.Logger" %> 
<%@page import="java.util.List" %>  
<%@page import="main.sfm.member.vo.SfmMemVO" %>
<%@page import="main.sfm.community.vo.SfmCommunityVO" %>

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

	function test(ths){
		location.href="/ttSFM/sfmCommunitySelectCon.sfm?cnum="+ths;
	}
	    
	$(document).ready(function(){
		
		//I
		$(document).on("click","#insertbtn",function(){
			
			$('#sfmNoticeList').attr({
				"action":"sfmCommunityInsertForm.sfm",
				"method":"GET",
				"enctype":"application/x-www-form-urlencoded"
			}).submit();
		});
		
		//D
		$(document).on("click","#deletetBtn",function(){
			$('#sfmNoticeList').attr({
				"action":"#",
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
	logger.info("sfmCommunitySelectAll.jsp >>> :");
	
	Object objPaging = request.getAttribute("pagingCVO");
	SfmCommunityVO pagingCVO = (SfmCommunityVO)objPaging;
%>
<div class ="container">
<h3>커뮤니티</h3>
<hr>
<form name="sfmCommunityList" id="sfmCommunityList">
<table class="table table-striped" border ="1" align ="center">
<thead>
<tr>
<!-- 	<th><input type="checkbox" name="chkAll" id="chkAll"></th> -->
	<th>글번호</th>
	<th>제목</th>
	<th>작성자</th>
	<th>작성일</th>
</tr>
</thead>
<%
	Object obj = request.getAttribute("alist");
	if (obj == null){ return; }
	
	List<SfmCommunityVO> list = (List<SfmCommunityVO>)obj;
	String memnum = list.get(0).getMemnum();
	System.out.print("memnum >>> : " + memnum);
	session.setAttribute("memnum", memnum);

	//페이징 변수 세팅
	int pageSize = 0;
	int groupSize = 0;
	int curPage = 0;
	int totalCount = 0;

	if (list.size() > 0){
		for (int i=0; i < list.size(); i++){
			SfmCommunityVO cvo = list.get(i);
			
			// 페이징 세팅
			pageSize = Integer.parseInt(pagingCVO.getPageSize());
			groupSize = Integer.parseInt(pagingCVO.getGroupSize());
			curPage = Integer.parseInt(pagingCVO.getCurPage());
			totalCount = Integer.parseInt(cvo.getTotalCount());
%>
<tbody>
<tr>
	<td class="tt" id="cnum"><%= cvo.getCnum() %></td>
	<td class="tt"><a href="#" onclick="test('<%= cvo.getCnum() %>');"><%= cvo.getCsubject() %></a></td>
	<td class="tt"><%= cvo.getCname() %></td>	
	<td class="tt"><%= cvo.getInsertdate() %> </td>
</tr>	
<%
		} // end of for
%>
<tr>
	<td colspan="9">
		<jsp:include page="/WEB-INF/view/commons/sfmPaging.jsp" flush="true">
			<jsp:param name="url" value="sfmCommunitySelectAll.sfm"/>
			<jsp:param name="str" value=""/>
			<jsp:param name="pageSize" value="<%=pageSize%>"/>
			<jsp:param name="groupSize" value="<%=groupSize%>"/>
			<jsp:param name="curPage" value="<%=curPage%>"/>
			<jsp:param name="totalCount" value="<%=totalCount%>"/>
		</jsp:include>
	</td>
</tr>	
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