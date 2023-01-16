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
<title>티키타카</title>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("sfmnoticeUISelectCon.jsp >>> : ");
	
	HttpSession ss = request.getSession();
    String memnum = (String)ss.getAttribute("memnum");
	logger.info("세션에 담긴 memnum 값 >>> : " + memnum);
%> 

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet" type="text/css" href="/ttSFM/include/sfmNoticeSelectAllUI.css">
<!-- 돋보기 추가 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- 돋보기 추가 -->
<script type="text/javascript">

	function fn_link(ths){
		location.href="/ttSFM/sfmNoticeSelectConUI.sfm?noticenum="+ths;
	}

</script>
<style type ="text/css">
	
	/*오늘 칸 색깔*/
	.fc-unthemed td.fc-today {
	    background: #b1f4ff;
	}
	/*배경색*/
	body {
	    font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
	    font-size: 14px;
	    line-height: 1.42857143;
	    color: #333;
	    background-color: #e4feff;
	}
</style>
</head>
<body>
<!-- 상단바 -->

<div style="padding:0px 400px 0px 400px;">
<div class="topnav">
  <a>
  <img src="/ttSFM/img/fb/tikilogo2.png" width="125px;"><a style="font-size:30px"></a>
  </a>
  	
  	<!-- 구장 예약 내역 아이콘 -->
     <a href="calendar.sfm">
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
  
</div>
<!-- 상단바 끝-->


<div class="container">
    <div class="input-form-backgroud">
    <div class="input-form col-md-12 mx-auto">
    	<div class="input-form-backgroud">
    	
    	
<h3><b>공지사항</b></h3>
<br>
<br>
<form name="sfmNoticeList" id="sfmNoticeList">
<table class="table border-bottom table-sm">
<thead>
<tr>
		<th>순번</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
</tr>

</thead>
<%
	Object obj = request.getAttribute("listAll");
	if (obj == null){ return; }
	
	List<SfmNoticeVO> list = (List<SfmNoticeVO>)obj;
// 	String memnum = list.get(0).getMemnum();
	System.out.print("memnum >>> : " + memnum);
// 	session.setAttribute("memnum", memnum);

	if (list.size() > 0){
		for (int i=0; i < list.size(); i++){
			SfmNoticeVO snvo = list.get(i);
%>
<tbody>

<tr>
	<td style="width:10%" class="tt"><%= i + 1 %></td>
	<td style="width:60%" class="tt"><a href="#" onclick="fn_link('<%= snvo.getNoticenum() %>');"><%= snvo.getNoticetitle() %></a></td>
	<td style="width:10%" class="tt">GM티키</td>
	<td style="width:20%" class="tt"><%= snvo.getInsertdate() %></td>
</tr>
<%
		} // end of for
	}//end of if
%>
</tbody>	
</table>
<!-- 	<div align="right">		 -->
<!-- 			<button type="button" class="btn btn-primary btn-sm" id="selectBtn">글쓰기</button> -->
<!-- 			<button type="button" class="btn btn-primary btn-sm" id="selectBtn">수정</button> -->
<!-- 			<button type="button" class="btn btn-primary btn-sm" id="selectBtn">삭제</button>								 -->
<!-- 		</div>	 -->
</form>

</div>
</div>
</div>
</div>
</div>
</body>
</html>