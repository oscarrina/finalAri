<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = "js/httpRequest.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://js.tosspayments.com/v1/payment-widget"></script>
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
	let idx = document.getElementById("idx").value;
	let likeType = document.getElementById("likeType").value;
	let img = document.getElementById("likeImg").src;
	let likeBtn = document.getElementById("likeBtn");
	if(likeYN == 'N'){ //좋아요 안 누른 상태
		//클릭 시 좋아요 버튼 상태 바뀜
		likeBtn.setAttribute('class','bi bi-heart-fill like');
		likeYN = 'Y';
	}else{ //좋아요 누른 상태
		//클릭 시 좋아요 버튼 상태 바뀜
		likeBtn.setAttribute('class','bi bi-heart like');
		likeYN = 'N';
	}
	let param = 'idx='+idx+'&likeType='+likeType+'&likeImg='+img+'&likeYN='+likeYN;
	sendRequest('likeOK',param,likeYN == "Y" ? likeOK:likeCancel,'GET');
}
function likeOK(){
	if(XHR.readyState == 4){
		if(XHR.status == 200){
			let data = XHR.responseText;
			swal('아리아리',data);
			liketest='Y';
		}
	}
}
function likeCancel(){
	if(XHR.readyState == 4){
		if(XHR.status == 200){
			let data = XHR.responseText;
			swal('아리아리',data);
			liketest='N';
		}
	}
}
</script>
</head>
<body>
<%@include file="/WEB-INF/views/header.jsp" %>
<h1 class="test">코스 좋아요 테스트 페이지</h1>
<img alt="" src="/img/hotel.jpg" id="likeImg">
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