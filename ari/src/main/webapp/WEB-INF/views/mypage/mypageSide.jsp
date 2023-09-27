<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.mypageDiv{
	margin-top:150px;
	margin-left:25px;
	width: 20%;
	height: 100vh;
	display: inline-block;
	text-align: left;
}
.mypageDiv h3{
	padding-top: 20px;
}
.mypageDiv a,.mypageDiv a:hover{
	color: #D3D3D3;
	text-decoration: none;
}
</style>
</head>
<body>
<div class="mypageDiv testDiv">
<h3><a href="myPage" id="myPlan">내 일정</a></h3>
<h3><a href="myReser" id="myReser">예약 내역</a></h3>
<h3><a href="myReview" id="myReview">내 리뷰</a></h3>
<h3><a href="myInfo" id="myInfo">내 정보 관리</a></h3>
<h3><a href="myLike" id="myLike">좋아요 목록</a></h3>
<h3><a href="myShare" id="myShare">공유한 일정</a></h3>
</div>
</body>
</html>