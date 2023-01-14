<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.apache.log4j.LogManager" %>  
<%@ page import="org.apache.log4j.Logger" %>   
<%@ page import="main.sfm.member.vo.SfmMemVO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  
<script type="text/javascript" src="/kosmoSpring/js/common.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<link rel="stylesheet" type="text/css" href="/ttSFM/include/sfmMemSelectAll.css">
<!-- 달력 -->

<script src="https://code.jquery.com/jquery-3.2.1.js"></script>

	<link rel="stylesheet" href="/css/jquery-ui.min.css">
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
    <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
    <script src="/js/bootstrap-datepicker.kr.js" charset="UTF-8"></script>
       
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    
    <!-- 검색바 -->
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<!-- 검색바 -->
<script type="text/javascript">

	//체크박스 체크 함수
	function checkOnly(chk){		
		var chkObj = document.getElementsByName("chkbox");
		console.log("chkObj >>> : " + chkObj);
		
		for (var i=0; i < chkObj.length; i++){			
			if (chkObj[i] != chk){
				chkObj[i].checked = false;
			}
		}
	}// end of checkOnly()
	
	// 체크된 체크박스 갯 수 세기  
	function chkInfo(){	
		var obj = document.getElementsByName("chkbox");
		var nCnt = 0;			
		
		for(var i=0; i < obj.length; i++){           
			if (obj[i].checked == true){ 
	      		nCnt++;
	      	}		          			            
	    }			
		console.log('nCnt >>> : ' + nCnt);					
		return nCnt;
	}// end of chkInfo()

	$(document).ready(function(){
		
		// 검색버튼 ==========================================================
	
		// I
		$(document).on("click", "#insertBtn", function(){
			alert("insertBtn 버튼 클릭---");
			
			$('#shjList').attr({
				'action':'sfmMemInsertForm.sfm',
				'method':'GET',
				"enctype":"application/x-www-form-urlencoded"
			}).submit();
		});
		
		// S
		$("#selectBtn").on("click", function(){
			alert("insertBtn 버튼 클릭---");
			
			$('#shjList').attr({
				'action':'shjMemSelectForm.sfm',
				'method':'GET',
				"enctype":"application/x-www-form-urlencoded"
			}).submit();
		});

		// U
		$("#updateBtn").on("click", function(){
			alert("updateBtn 버튼 클릭---");

			$('#shjList').attr({
				'action':'sfmMemUpdateForm.sfm',
				'method':'GET'
				//"enctype":"application/x-www-form-urlencoded"
			}).submit();
		});
		
		// D
		$("#deleteBtn").on("click", function(){	
			alert("deleteBtn 버튼 클릭---");

			$('#shjList').attr({
				'action':'sfmMemDelete.sfm',
				'method':'GET',
				"enctype":"application/x-www-form-urlencoded"
			}).submit();
		});
	});	

</script>

<style type="text/css">
	.container {
    width: 100%;
    padding-right: 0px;
    padding-left: 0px;
    margin-right: auto;
    margin-left: auto;
}

.form-check {
	
}

.input {
    	align-items:center;
    	 !important
    }

.ckb {
	padding:1px;
}



</style>
</head>
<body>

<div style="padding:0px 290px 0px 300px;">
<div class="topnav">
  <a>
 <img src="/ttSFM/img/fb/tikilogo2.png" width="125px;"><a style="font-size:30px"><b>관리자페이지<b></a>
  </a>
  	
  	<!-- 구장 예약 내역 아이콘 -->
  	<a href="https://www.plabfootball.com/mypage/myplab/">
  	<img class="icon-margin2" align="right" src="/ttSFM/img/fb/date2.png" width="35px"><a href="https://www.plabfootball.com/mypage/"></a>
  	</a>
 	 <!-- 구장 예약 내역 아이콘 -->
  
  
  	<!-- 마이 페이지 아이콘 -->
  	<a href="https://www.plabfootball.com/mypage/">
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
<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("sfmMemSelectAll.jsp.jsp >>> : ");
	
	Object obj = request.getAttribute("fileUploadListAll");
	if(obj == null) {return;}
	
	List<SfmMemVO> list = (List<SfmMemVO>)obj;
%>
<div class="container" style="max-width:1460px;">
    <div class="input-form-backgroud">
    <div class="input-form col-md-12 mx-auto">
    	<div class="input-form-backgroud">
<form name="shjList" id="shjList">
<div align="center">
	<h3><b>회원목록</b></h3>
	<br>
	<br>
	</div>
<table class="table border-bottom table-sm">
<thead class="thead-dark">

<tr>
	<th style="text-align:center;"><input type="checkbox" name="chkAll" id="chkAll" onclick="checkOnly(this)"  ></th>
	<th style="text-align:center;">순번</th>
	<th style="text-align:center;">회원번호</th>
	<th style="text-align:center;">이름</th>
	<th style="text-align:center;">아이디</th>
	<th style="text-align:center;">성별</th>
	<th style="text-align:center;">핸드폰</th>
	<th style="text-align:center;">이메일</th>
	<th style="text-align:center;">선호 포지션</th>
	<th style="text-align:center;">선호지역</th>
	<th style="text-align:center;">주소</th>	
	<th style="text-align:center;">회원사진</th>
	
</tr>
</thead>
<%

	if (list.size() > 0){
		for(int i=0; i < list.size(); i++){
			SfmMemVO mvo = list.get(i);
%>	
<tbody>
<tr>
	<td class="tt">
		<input type="checkbox" id="chkbox" name="chkbox" id="chkbox" value="<%= mvo.getMemnum() %>" onclick="checkOnly(this)" />
	</td>
	<td style="text-align:center; width:5%"class="tt"><%= i + 1 %></td>
	<td style="text-align:center; width:10%" class="tt"><%= mvo.getMemnum() %></td>
	<td style="text-align:center; width:5%" class="tt" id="name"><%= mvo.getMemname() %></td>
	<td style="text-align:center; width:10%"class="tt"><%= mvo.getMemid() %></td>
	<td style="text-align:center; width:4%"class="tt"><%= mvo.getMemgender() %></td>
	<td style="text-align:center; width:10%"class="tt"><%= mvo.getMemhp() %></td>
	<td style="text-align:center; width:10%"class="tt"><%= mvo.getMememail() %></td>
	<td style="text-align:center; width:8%" class="tt"><%= mvo.getMemposition() %></td>
	<td style="text-align:center; width:8%" class="tt"><%= mvo.getMempreferredarea() %></td>
	<td style="text-align:center; width:15%" class="tt"><%= mvo.getMemjibunaddress() %></td>
	<td style="text-align:center; width:8%"class="tt"><img src="/ttSFM/fileupload/mem_photo/<%= mvo.getMemphoto() %>" border="1" width="25" height="25" alt="image"></td> 
</tr>
<%
		}	// end of for
	} //end of if
%>
	
<tr>
	<td colspan="15" align="right">
		<input type="button" class="btn btn-primary" type="submit" value="등록" id="insertBtn">
		<input type="button" class="btn btn-primary" type="submit" value="조회" id="selectBtn">
		<input type="button" class="btn btn-primary" type="submit" value="수정" id="updateBtn">
		<input type="button" class="btn btn-primary" type="submit" value="삭제" id="deleteBtn">								
	</td>
</tr>	
</tbody>
</table>
</form>

</div>
</div>
</div>
</div>
</div>
</body>
</html>