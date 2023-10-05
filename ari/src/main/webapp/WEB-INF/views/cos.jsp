<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.test{
	margin-top: 300px;
}
.like{
	font-size: 30px;
}
.likeBtn{
	border: none;
	background: none;
}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/header.jsp" %>
<c:url var="contentUrl" value="cosTest">
<c:param name="idx">1</c:param>
<c:param name="likeType" value="1"></c:param>
</c:url>
<h1 class="test">코스 좋아요 테스트 페이지</h1>
<h1 id="idx"><a href="${contentUrl}">1</a></h1>
<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>