<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
</head>
<body>
<div><img src = "/img/logo.png"></div>
<ul>
	<li>사용자 회원가입</li>
	<li><input type = "button" value="가입하기" onclick = "script: location.href = 'memberJoin?userType=1'"></li>
</ul>
<ul>
	<li>사업자 회원가입</li>
	<li><input type = "button" value = "가입하기" onclick = "script: location.href = 'memberJoin?userType=2'"></li>
</ul>
</body>
<%@include file = "/WEB-INF/views/footer.jsp"%>
</html>