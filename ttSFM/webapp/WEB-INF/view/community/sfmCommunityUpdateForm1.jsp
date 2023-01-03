<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>
<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("CommunityPage.jsp 진입 >>> : ");	
	HttpSession ss = request.getSession();
    String cnum = (String)ss.getAttribute("cnum");
 	logger.info("cnum >> "+ cnum);
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
	var cnum = "<%= cnum %>";
	console.log("cnum >>> : " + cnum);
	location.href="/ttSFM/sfmCommunitySelectCon.sfm?cnum="+cnum;
</script>
</body>
</html>