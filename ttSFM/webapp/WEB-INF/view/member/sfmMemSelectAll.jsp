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
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
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
				'action':'sfmMemInsertForm.shj',
				'method':'GET',
				"enctype":"application/x-www-form-urlencoded"
			}).submit();
		});
		
		// S
		$("#selectBtn").on("click", function(){
			alert("insertBtn 버튼 클릭---");
			
			$('#shjList').attr({
				'action':'shjMemSelectForm.shj',
				'method':'GET',
				"enctype":"application/x-www-form-urlencoded"
			}).submit();
		});

		// U
		$("#updateBtn").on("click", function(){
			alert("updateBtn 버튼 클릭---");

			$('#shjList').attr({
				'action':'sfmMemUpdateForm.shj',
				'method':'GET',
				"enctype":"application/x-www-form-urlencoded"
			}).submit();
		});
		
		// D
		$("#deleteBtn").on("click", function(){	
			alert("deleteBtn 버튼 클릭---");

			$('#shjList').attr({
				'action':'sfmMemDelete.shj',
				'method':'GET',
				"enctype":"application/x-www-form-urlencoded"
			}).submit();
		});
	});	

</script>

<style type="text/css">

	th {
		text-align: center;
	}
	
	.tt	{
		text-align: center;
	}

</style>
</head>
<body>
<h3 align="center">Mem SelectAll</h3>
<hr>
<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("sfmMemSelectAll.jsp.jsp >>> : ");
	
	Object obj = request.getAttribute("fileUploadListAll");
	if(obj == null) {return;}
	
	List<SfmMemVO> list = (List<SfmMemVO>)obj;
%>
<form name="shjList" id="shjList">
<table class="table table-striped" border="1" align="center">
<thead class="thead-dark">
<tr>
	<td colspan="10" align="center">
		<h3>회원정보</h3>
		<%= "조회건수 ::: " + list.size() %>
	</td>
</tr>
<tr>
	<th><input type="checkbox" name="chkAll" id="chkAll" onclick="checkOnly(this)"  ></th>
	<th text-align="center">순번</th>
	<th align="center">회원번호</th>
	<th>이름</th>
	<th>아이디</th>
	<th>성별</th>
	<th>핸드폰</th>
	<th>이메일</th>
	<th>선호 포지션</th>
	<th>주소</th>
	<th>상세주소</th>
	
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
	<td class="tt"><%= i + 1 %></td>
	<td class="tt"><%= mvo.getMemnum() %></td>
	<td class="tt" id="name"><%= mvo.getMemname() %></td>
	<td class="tt"><%= mvo.getMemid() %></td>
	<td class="tt"><%= mvo.getMemgender() %></td>
	<td class="tt"><%= mvo.getMemhp() %></td>
	<td class="tt"><%= mvo.getMememail() %></td>
	<td class="tt"><%= mvo.getMempreferredarea() %></td>
	<td class="tt"><%= mvo.getMemjibunaddress() %></td>
	<td class="tt"><%= mvo.getMemjibunaddressdetail() %></td>
<%-- 	<td class="tt"><img src="/ShjSpring/fileupload/shj_photo/<%= mvo.getMemphoto() %>" border="1" width="25" height="25" alt="image"></td> --%>
</tr>
<%
		}	// end of for
	} //end of if
%>
	
<tr>
	<td colspan="9" align="right">
		<input type="button" value="등록" id="insertBtn">
		<input type="button" value="조회" id="selectBtn">
		<input type="button" value="수정" id="updateBtn">
		<input type="button" value="삭제" id="deleteBtn">									
	</td>
</tr>	
</tbody>
</table>
</form>
</body>
</html>