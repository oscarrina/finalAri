<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = "js/httpRequest.js"></script>
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
<script>
var liketest='${likeYN}';
function like(likeYN){
	
	if(likeYN == 'N'){ //좋아요 안 누른 상태
	//클릭 시 좋아요 버튼 상태 바뀜
	let likeBtn = document.getElementById("likeBtn");
	likeBtn.setAttribute('class','bi bi-heart-fill like');
	//게시글 idx와 일정,코스 게시글 구분
	let idx = document.getElementById("idx").value;
	let likeType = document.getElementById("likeType").value;
	let param = 'idx='+idx+'&likeType='+likeType;
	sendRequest('likeOK',param,likeOK,'GET');
	}else{ //좋아요 누른 상태
	//클릭 시 좋아요 버튼 상태 바뀜
	let likeBtn = document.getElementById("likeBtn");
	likeBtn.setAttribute('class','bi bi-heart like');
	//게시글 idx와 일정,코스 게시글 구분
	let idx = document.getElementById("idx").value;
	let likeType = document.getElementById("likeType").value;
	let param = 'idx='+idx+'&likeType='+likeType;
	sendRequest('likeCancel',param,likeCancel,'GET');
	}
}
function likeOK(){
	if(XHR.readyState == 4){
		if(XHR.status == 200){
			let data = XHR.responseText;
			window.alert(data);
			liketest='Y';
		}
	}
}
function likeCancel(){
	if(XHR.readyState == 4){
		if(XHR.status == 200){
			let data = XHR.responseText;
			window.alert(data);
			liketest='N';
		}
	}
}
</script>
</head>
<body>
<%@include file="/WEB-INF/views/header.jsp" %>
<h1 class="test">코스 좋아요 테스트 페이지</h1>
<button type="button" onclick="like(liketest)" class="likeBtn" id="likeBtn123">
<c:if test="${likeYN == 'N' }">
<i class="bi bi-heart like" id="likeBtn"></i>
</c:if>
<c:if test="${likeYN == 'Y' }">
<i class="bi bi-heart-fill like" id="likeBtn"></i>
</c:if>
</button>
<input type="hidden" value="${idx }" id="idx">
<input type="hidden" value="${likeType }" id="likeType">
<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>