<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#myPlan{
	color: #253BFF;
}
.mypagePlanDiv{
	margin-top:150px;
	display: inline-block;
	width: 75%;
	height: 100vh;
	float: right;
}
.mypageImg{
	width: 150px;
	height: 150px;
}
.mypagePlan{
	margin-top: 50px;
	position: relative;
}
.planInfo{
	position:absolute;
	list-style-type: none;
	left: 130px;
	top: 0px;
}
.myPlanCategory{
	position: absolute;
	right: 0px;
	top: 15px;
	background: none !important;
	border: none !important;
}
.categoryI{
	color: black;
	font-size: 35px;
}
.planSi{
	font-size: 25px;
	font-weight: bold;
}
.planSubject{
	font-size: 25px;
	margin-top: 10px;
}
.planDay{
	font-size: 20px;
	margin-top: 20px;
}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/header.jsp" %>
<%@include file="/WEB-INF/views/mypage/mypageSide.jsp" %>
<div class="mypagePlanDiv">
<h3>내 일정</h3>
<div class="mypagePlan">
<img alt="" src="/img/img.jpg" class="mypageImg">
<ul class="planInfo">
	<li class="planSi">서울</li>
	<li class="planSubject">남산여행</li>
	<li class="planDay">2023-09-30 ~ 2023-10-02</li>
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