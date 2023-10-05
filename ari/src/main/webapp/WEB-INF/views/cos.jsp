<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script>
function like(){
	let idx = document.getElementById("idx").innerHTML;
	let likeType = document.getElementById("likeType").value;
	let userIdx = document.getElementById("userIdx").innerHTML;
	let param = 'idx ='+idx+'&likeType ='+likeType+'&userIdx ='+userIdx;
	sendRequest('like',param,showResult,'GET');
}
function showResult(){
	if(XHR.readyState == 4){
		if(XHR.status == 200){
			let data = XHR.responseText;
			
		}
	}
}
</script>
</head>
<body>
<%@include file="/WEB-INF/views/header.jsp" %>
<h1 class="test">코스 좋아요 테스트 페이지</h1>
<h1 id="idx">1</h1>
<h1 id="userIdx">1</h1>
<button type="button" onclick="like()" class="likeBtn">
<i class="bi bi-heart like"></i>
</button>
<input type="hidden" id="likeType" name="type" value="1">
<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>