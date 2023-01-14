<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="main.sfm.payment.vo.SfmPaymentVO" %>
<%@ page import="java.util.List" %>
<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("CommunityPage.jsp 진입 >>> : ");	
	HttpSession ss = request.getSession();
    String matchnum = (String)ss.getAttribute("matchnum");
    String paymentnum = (String)ss.getAttribute("paymentnum");
	logger.info("paymentnum >> "+ paymentnum);
 	logger.info("matchnum >> "+ matchnum);
%> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
	var paymentnum = "<%= paymentnum %>";
	var matchnum = "<%= matchnum %>";
	location.href="/ttSFM/sfmPaymentSelect.sfm?paymentnum="+paymentnum+"&matchnum="+matchnum;
</script>
</body>
</html>