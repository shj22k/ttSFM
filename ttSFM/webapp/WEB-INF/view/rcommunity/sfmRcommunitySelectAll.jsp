<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import=" org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="main.sfm.rcommunity.vo.SfmRcommunityVO" %> 
<%@ page import="main.sfm.community.vo.SfmCommunityVO" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.form-control{
float:left;

}

.btn{
float:right;
}

.con {
width:530px;
}

td{
    padding: 0.25rem;
    vertical-align: top;
    border-top: 1px solid #dee2e6;
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- @@@ 부트스트랩 추가 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script type="text/javascript">

	$(document).ready(function(){
		
		//rkbcontent 길이 제한 200byte
		$("#rccontent").keyup(function(){
			cut_200(this);
		});
		
		// 댓글 전체 불러오기 
		selectAll();
		
		// 댓글 등록
		$(document).on("click", "#insertBtn", function(){
			console.log("insertBtn >>> : ");
			
			let insertURL = "sfmRcommunityInsert.sfm";		
			let method = "POST";
			let dataParam = {
				cnum: $("#cnum").val(),
				bname: $("#rcname").val(),
				bcontent: $("#rccontent").val()
			};
			dataParam = $("#rcommunityForm").serialize();
			console.log("dataParam >>> : " + dataParam);
			
			$.ajax({
				url: insertURL,
				type: method,
				data: dataParam,
				success: whenSuccess,
				error: whenError
			});
			
			function whenSuccess(resData){	
				alert("resData >>> : " + resData);	
				if ("GOOD" == resData){
					// 입력데이터 초기화 함수호출 
					rcommunityFormData();
					location.reload();
					selectAll();
				}
			}
			function whenError(e){
				alert("e >>> : " + e.responseText);
			}
			
			// selectAll();
		});
		
		// 댓글 삭제		
		$(document).on("click", ".deleteBtn", function(){
			console.log("D >>> : ");
			
			var rcnumV = $(this).parents("li").attr("dataNum");
			alert("rcnumV >>> : " + rcnumV);
			var target = $(this).parents(".rcmemoItem");
			console.log("target >>> : " + target);
			
			let deleteURL = "sfmRcommunityDelete.sfm";
			let method = "POST";
			let dataParam = {
				rkcnum: $('#rcnumV').val(rcnumV),				
			};		
			dataParam = $("#rcommunityForm").serialize();
			console.log("dataParam >>> : " + dataParam);
			
			$.ajax({
				url: deleteURL,
				type: method,
				data: dataParam,
				success: whenSuccess,
				error: whenError
			});
			
			function whenSuccess(resData){					
				console.log("resData >>> : " + resData);				
				if ("GOOD" == resData){
					alert("댓글이 삭제되었습니다.");
					target.remove();
				}	
			}
			function whenError(e){
				console.log("e >>> : " + e.responseText);
			}
		});
	});
	
	// 게시글 번호로 댓글 전체조회 ============================================
	function selectAll(){
					
		console.log("SALL >>> : ");
		
		let selectAllURL = "sfmRcommunitySelectAll.sfm";
		let method = "POST";
		let dataParam = {
			cnum: $("#cnum").val(),				
		};		
		dataParam = $("#rcommunityForm").serialize();
		console.log("dataParam >>> : " + dataParam);
		
		$.ajax({
			url: selectAllURL,
			type: method,
			data: dataParam,
			success: whenSuccess,
			error: whenError
		});
		
		function whenSuccess(resData){	
			console.log("resData >>> : " + resData);
			console.log("whenSuccess sfmRcommunitySelectAll resData >>> : " + resData);
			
			if(isEmpty(resData)){
				return false;
			}
			
			let v = resData.split("&");
			for(let i=0; i < v.length; i++){
				console.log(v[i]);
				let vv = v[i].split(",");
				for (let j=0; j < vv.length-1; j++){
					console.log("vv[0] >>> : " + vv[0]);
					console.log("vv[1] >>> : " + vv[1]);
					console.log("vv[2] >>> : " + vv[2]);
					console.log("vv[3] >>> : " + vv[3]);					
				}
				addNewItem(vv[0], vv[1], vv[2], vv[3]);
			}
		}
		function whenError(e){
			console.log("e >>> : " + e.responseText);
		}	
	}
	// 게시글 번호로 댓글 전체조회 ============================================
		
	//새로운 글 화면에 추가	=================================================
	function addNewItem(num, writer, content, datetime){
		
		//데이터 체크
		if(isEmpty(num)) return false;
		
		// 새로운 글이 추가될 li태그 
		var newLi = $("<li>");
		newLi.attr("dataNum", num);
		newLi.addClass("rcmemoItem");
		// 작성자 정보가 지정될 <p> 태그 
		var writerP = $("<p>");
		writerP.addClass("writer");
		// 작성자 정보의 이름 
		var nameSpan = $("<span>");
		nameSpan.addClass("name");
		nameSpan.html(decodeURIComponent(writer) + "님");
		// 작성일시 
		var dateSpan = $("<span>");
		dateSpan.html(" / " + datetime + " ");
		// 삭제 버튼 
		var delInput = $("<input>");
		delInput.attr({"type":"button", "value":"삭제하기"});
		delInput.addClass("deleteBtn");
		// 내용
		var contentP = $("<p>");
		contentP.html(decodeURIComponent(content));
		
		// 조립하기
		writerP.append(nameSpan).append(dateSpan).append(delInput);
		newLi.append(writerP).append(contentP);
		$("#rcommunitylist").append(newLi);
	}
	// 새로운 글 화면에 추가	=================================================
	
	// 댓글 길이 체크  ========================================================
	//한글 포함 문자열 길이
	function getTextLength(s){
		var len = 0;
		for(var i=0; i < s.length; i++){
			if(escape(s.charAt(i)).length == 6){
				len++;
			}
			len++;
		}
		return len;
	}
	function cut_200(obj){
		var t = $(obj).val();
		var l = t.length;
		while(getTextLength(t) > 200){
			l--;
			t= t.substring(0, l);
		}
		$(obj).val(t);
		$('.bytes').text(getTextLength(t));
	}
	// 댓글 길이 체크  ========================================================
	
	//댓글 등록 후 입력창 초기화
	function rcommunityFormData(){
		$("#rcname").val("");
		$("#rccontent").val("");
	}
	
	//데이터 체크
	function isEmpty(val){
		if(typeof val=="undefined" || val==null || val==""){
			return true;
		}else{
			return false;
		}
	}

</script>
</head>
<body>
<hr>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("rcommunityForm.jsp 페이지 >>> : ");
	
	String cnum = request.getParameter("cnum");
	logger.info("rcommunityForm.jsp cnum >>> : " + cnum);
%>
<div id="rcwriterdiv">
<form name="rcommunityForm" id="rcommunityForm">

<div class="con">
<table class="table">
<tr>
	<td><b>작성자</b></td>
	<td>
		<input style="width:320px;"class="form-control" type="text" name="rcname" id="rcname"/>
		<input class="btn btn-outline-secondary" type="button" value="저장하기" id="insertBtn">
		<input type="hidden" name="cnum" id="cnum" value="<%=cnum%>">
		<input type="hidden" name="rcnum" id="rcnum">
	</td>    
	
</tr>
<tr>
	<td><b>댓글 내용</b></td>
	<td>
		<textarea class="form-control" name="rccontent" id="rccontent" rows="2" cols="50" style="resize: none"></textarea>	
		<div><span class="bytes">0</span>bytes</div>
	</td>	
</tr>
</table>
</div>
<hr>
<ul name="rcommunitylist" id="rcommunitylist">
	<!-- 여기에 동적 생성 요소가 들어온다. -->
</ul>
</form>
</div>
</body>
</html>