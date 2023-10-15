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
<script src ="/js/httpRequest.js"></script>
<script>
function typeChange(select){
	var type = select.value;
	window.location.href = "placeList?type="+type;
}
</script>
</head>
<body>
<div id="page-wrapper">
<%@ include file="../ceo/ceoHeader.jsp" %>
<div id="page-content-wrapper">
    <div class="container-fluid" id="content1">
    <div class="content">
    <br>
    <select id = "type" onchange="typeChange(this)">
    	<option value ="1">관광지</option>
    	<option value ="2">음식점</option>
    	<option value ="3">숙소</option>
    </select>
    <div class = container>
    	<c:forEach var = "dto" items="${list}"></c:forEach>
    	<div class = img><img src = "${dto.infoImg}"></div>
    	<div class = infoContainer>
    		<div class = "title">${dto.infoName}</div>
    		<c:if test="${type ==1}">
    		<div class = "type">관광지</div>
    		</c:if>
    		<c:if test="${type ==2}">
    		<div class = "type">음식점</div>
    		</c:if>
    		<c:if test="${type ==3}">
    		<div class = "type">숙소</div>
    		</c:if>
    		<div class = "BN">${dto.userBN}</div>
    	</div>
    	<div class = "button">
    		<div>수정하기</div>
    		<c:if test="type == 3"><div>객실정보 보기</div></c:if>
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