<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EMAIL CHECK</title>
</head>
<body>
EMAIL CHECK
<hr>
<%
	String pwcertification = "메일을 확인 하시고 임시 비빌번호를 를 입력 하시오 ~~ !!";
	System.out.println("pwcertification >>> : " + pwcertification);
%>
<?xml version='1.0' encoding='UTF-8'?>
<login>
	<result><%= pwcertification %></result>	
</login>
</body>
</html>