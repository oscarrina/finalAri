<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/mypage.css">
<style>
#myPlan{
	color: #253BFF;
}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/header.jsp" %>
<%@include file="/WEB-INF/views/mypage/mypageSide.jsp" %>
<div class="mypagePlanDiv">
<h3>내 일정</h3>
<div class="mypagePlan">
<c:forEach var="dto" items="${list }">
<c:set var="planPoint" value="${dto.planPoint}"/>
<img alt="" src="/img/hotel.jpg" class="mypageImg">
<ul class="planInfo">
	<li class="planSi">${areamap[planPoint]}</li>
	<li class="planDay">${dto.planStart} ~ ${dto.planEnd}</li>
</ul>
<button class="btn btn-secondary myPlanCategory" type="button" data-bs-toggle="dropdown" aria-expanded="false">
   <i class="bi bi-three-dots-vertical categoryI"></i>
  </button>
  <ul class="dropdown-menu">
    <li><a class="dropdown-item" href="#">일정 보기</a></li>
    <li><a class="dropdown-item" href="#">일정 공유</a></li>
    <li><a class="dropdown-item" href="#">일정 삭제</a></li>
  </ul>
  </c:forEach>
</div>
</div>
<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>