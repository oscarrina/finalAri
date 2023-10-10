<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/mypage.css">
<script>
function reviewWrite(){
	
}
function reviewSelect(){
	
}
</script>
<style>
#myReview{color: #253BFF;}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/header.jsp" %>
<%@include file="/WEB-INF/views/mypage/mypageSide.jsp" %>
<div class="mypageReviewDiv">
<h3>내 리뷰</h3>
<button type="button" class="btn btn-primary" 
style="background-color:#666CDE; width:400px; height:40px; font-size:15px;" onclick="reviewWrite()">작성 가능한 리뷰</button>
<button type="button" class="btn btn-primary" 
style="background-color:#666CDE; width:400px; height:40px; font-size:15px;" onclick="reviewSelect()">작성한 리뷰</button>
<div class="mypagePlan">
<img alt="" src="/img/img.jpg" class="mypageImg">
<ul class="planInfo">
	<li class="planSi">서울 호텔</li>
	<li class="planSubject">스위트 룸</li>
	<li class="planDay">2023-09-30 14:00 ~ 2023-10-02 11:00</li>
</ul>
<button type="button" class="btn btn-primary reserCancelBtn">취소</button>
</div>
</div>
<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>