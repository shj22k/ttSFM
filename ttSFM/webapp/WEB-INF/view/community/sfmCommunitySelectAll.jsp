<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="org.apache.log4j.LogManager" %>  
<%@page import="org.apache.log4j.Logger" %> 
<%@page import="java.util.List" %>  
<%@page import="main.sfm.member.vo.SfmMemVO" %>
<%@page import="main.sfm.community.vo.SfmCommunityVO" %>
<% request.setCharacterEncoding("UTF-8");%> 
<%
   Logger logger = LogManager.getLogger(this.getClass());
   logger.info("sfmPaymentForm.jsp >>> : ");
   
   HttpSession ss = request.getSession();
    String memnum = (String)ss.getAttribute("memnum");
   logger.info("세션에 담긴 memnum 값 >>> : " + memnum);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 목록</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="/ttSFM/js/common.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<!-- 달력 -->

<script src="https://code.jquery.com/jquery-3.2.1.js"></script>

<link rel="stylesheet" href="/css/jquery-ui.min.css">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
<script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
<script src="/js/bootstrap-datepicker.kr.js" charset="UTF-8"></script>
   
<!-- 검색바 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="/ttSFM/include/sfmCommunitySelectAll.css">
<!-- 검색바 -->

<script src = "http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	
	function test(ths){
		location.href="/ttSFM/sfmCommunitySelectCon.sfm?cnum="+ths;
	}
	    
	$(document).ready(function(){
		
		//I
		$(document).on("click","#insertbtn",function(){
			alert("insertbtn 버튼클릭");
			
			$('#sfmCommunityList').attr({
				"action":"sfmCommunityInsertForm.sfm",
				"method":"GET",
				"enctype":"application/x-www-form-urlencoded"
			}).submit();
		});
		
		//D
		$(document).on("click","#deletetBtn",function(){
			$('#sfmCommunityList').attr({
				"action":"#",
				"method":"GET",
				"enctype":"application/x-www-form-urlencoded"
			}).submit();
		});
		
		   $(document).ready(function(){
			      $("#maingo").on("click", function(){
			         $("#maindata").attr({
			            "action":"maingo.sfm",
			             "method":"POST",
			             'enctype':'application/x-www-form-urlencoded'
			         }).submit();
			      });
			   });
	
	});
	
</script>
</head>
<body>
<!-- 상단바 -->
<div style="padding:0px 400px 0px 400px;">
<div class="topnav">

 	<form id="maindata" name="maindata">
          <img type="" id="maingo" src="/ttSFM/img/fb/tikilogo2.png" width="125px;">
       
  	
  	<!-- 구장 예약 내역 아이콘 -->
  	<a href="https://www.plabfootball.com/mypage/myplab/">
  		<img class="icon-margin2" align="right" src="/ttSFM/img/fb/date2.png" width="35px">
  	</a>
 	<!-- 구장 예약 내역 아이콘 -->
 
	
	<!-- 마이 페이지 아이콘 -->
	<a href="myPage.sfm?memnum =<%= memnum %>" onfocus="this.blur()">
		<img class="icon-margin2" align="right" src="/ttSFM/img/fb/user.png" width="35px">
	</a>
  	<!-- 마이 페이지 아이콘 -->
  	
  	
	<div align="right" class="search-container">
	  <form action="/action_page.php">
	    <input type="text" style="width:250px; height:40px" placeholder="Search.." name="search">
	    <button type="submit" style="width:40px; height:40px;"><i class="fa fa-search"></i></button>
	  </form>
</div>
</form>
</div>

<!-- 상단바 끝-->
<%
	Object objPaging = request.getAttribute("pagingCVO");
	SfmCommunityVO pagingCVO = (SfmCommunityVO)objPaging;
%>
<div class="container">
<div class="input-form-backgroud">
<div class="input-form col-md-12 mx-auto">
<div class="input-form-backgroud">
<form name="sfmCommunityList" id="sfmCommunityList">
	<div align="center">
		<h3><b>커뮤니티 목록</b></h3>
		<br>
		<br>
	</div>
<table class="table border-bottom table-sm">
<thead>
	<div class="row">
	<tr>
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
	// String memnum = list.get(0).getMemnum();
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
			
			String cnum = cvo.getCnum();
			cnum = cnum.substring(9);
			
			// 페이징 세팅
			pageSize = Integer.parseInt(pagingCVO.getPageSize());
			groupSize = Integer.parseInt(pagingCVO.getGroupSize());
			curPage = Integer.parseInt(pagingCVO.getCurPage());
			totalCount = Integer.parseInt(cvo.getTotalCount());
%>
<tbody>
	<tr>
		<td style="width:10%"><%= cnum %></td>
		<td style="width:40%"><a href="#" onclick="test('<%= cvo.getCnum() %>');"><%= cvo.getCsubject() %></a></td>
		<td style="width:10%"><%= cvo.getCname() %></td>
		<td style="width:8%"><%= cvo.getInsertdate() %></td>				
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
</tbody>		
</table>
	<div align="right">		
		<button type="button" class="btn btn-primary btn-sm" id="insertbtn" name="insertbtn">글쓰기</button>								
	</div>	
</form>	
</div>
</div>
</div>
</div>
</div>
</body>
</html>