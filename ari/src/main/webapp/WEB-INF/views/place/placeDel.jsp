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
<style>

</style>
</head>
<body>
<div id="page-wrapper">
	<%@ include file="../ceo/ceoHeader.jsp" %>
	<div id="page-content-wrapper">
	    <div class="container-fluid" id="content1">
		    <div class="content">
		    <br><br><br>
		    <h2>사업체 삭제</h2>
		    <br><br>
				<div class = container> 
				    <div class = img><img src = "${dto.infoImg}"></div>
				    <div>${dto.infoName}</div>
				    <div>${dto.userBN}</div>
				    <div>${dto.addr}</div>
				    
				   	<div>삭제는 즉시 이루어지며 되돌릴수 없습니다. 진행하시겠습니까</div>
					<div class = "container">삭제하기</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>