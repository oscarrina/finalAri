<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css/adminMainLayout.css">
</head>
<body>
<div id="page-wrapper">
<%@ include file="../ceo/ceoHeader.jsp" %>
<div id="page-content-wrapper">
    <div class="container-fluid" id="content1">
    <div class="content">
    <br>
    <div class = container>
    	<c:forEach var = list items=${placeList})></c:forEach>
    	<div class = img><img src = "${list.infoImg}"></div>
    	<div class = infoContainer>
    		<div class = "title">${list.infoName}</div>
    		<div class = "type"></div>
    		<div class = "BN"></div>
    	</div>
    	<div class = "button">
    		<div>수정하기</div>
    		<c:if test="${list.type == 1}"><div>객실정보 보기</div></c:if>
    		<div style = "color: red;">삭제하기</div>
    	</div>
    </div>
	<div class = "container">
	</div>
</div>
</div>
</div>
</div>

</body>
</html>