<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#myReser{
	color: #253BFF;
}
.mypageReserDiv{
	margin-top:150px;
	display: inline-block;
	width: 75%;
	height: 100vh;
	float: right;
}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/header.jsp" %>
<%@include file="/WEB-INF/views/mypage/mypageSide.jsp" %>
<div class="mypageReserDiv">
<h3>예약 내역</h3>
<div class="mypagePlan">
<img alt="" src="/img/img.jpg" class="mypageImg">
<ul class="planInfo">
	<li class="planSi">서울 호텔</li>
	<li class="planSubject">스위트 룸</li>
	<li class="planDay">2023-09-30 14:00 ~ 2023-10-02 11:00</li>
</ul>
<button class="btn btn-secondary myPlanCategory" type="button" data-bs-toggle="dropdown" aria-expanded="false">
   <i class="bi bi-three-dots-vertical categoryI"></i>
  </button>
  <ul class="dropdown-menu">
    <li><a class="dropdown-item" href="#">일정 보기</a></li>
    <li><a class="dropdown-item" href="#">일정 공유</a></li>
    <li><a class="dropdown-item" href="#">일정 삭제</a></li>
  </ul>
</div>
</div>
<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>