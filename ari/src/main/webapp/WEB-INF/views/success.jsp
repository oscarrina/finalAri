<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아리아리 예약 확인</title>
<link rel="stylesheet" href="./bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<style>
.login-wrap{
  width:100%;
  margin:auto;
  max-width:525px;
  min-height:670px;
  position:relative;
}
.login-html{
  width:100%;
  height:100%;
  position:absolute;
  padding:90px 70px 50px 70px;
}
.mainimg{
  width: 330px;
  height: 130px;
}
.successBtn{
	width: 150px;
	height:50px;
	border: none;
	border-radius: 10px;
	background-color: #253BFF;
	color: white;
}
</style>
<script>
function back(){
	location.href = '/';
}
function myReser(){
	location.href = 'myPage';
}
</script>
</head>
<body>
<div class="login-wrap">
<div class="login-html">
  <a href="/"><img src="/img/logo.png" class="mainimg"></a>
  <h3>결제가 완료되었습니다.</h3>
  <h3>이용해주셔서 감사합니다.</h3>
  <input type="button" value="돌아가기" class="successBtn" onclick="back()">
  <input type="button" value="내 예약내역" class="successBtn" onclick="myReser()">
</div>
<div></div>
</div>
<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>