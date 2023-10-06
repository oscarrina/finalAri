<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/adminMainLayout.css">
<link rel="stylesheet" type="text/css" href="/css/adminNotice.css">
<script>
function cancel(){
	let cancel = window.confirm('예약을 취소하시겠습니까?');
	if(cancle){
	let param = "reserCancel?param="+${param};
	location.href = param;
	}
}
</script>
</head>
<body>
<div id="page-wrapper">
<%@ include file="ceoHeader.jsp" %>
  <!-- /사이드바 -->

  <!-- 본문 -->
  <div id="page-content-wrapper">
    <div class="container-fluid content1">
      <h3>예약 관리</h3>
      <div class="mypagePlan">
      <c:if test="${empty list }">
      <h1>예약이 없습니다. 분발하세요</h1>
      </c:if>
      <c:if test="${not empty list }">
      <c:forEach var="dto" items="${list }">
<table class="reserTable">
<tr>
<td class="reserClass"><img alt="숙박업체이미지" src="/img/${dto.berthInfoImg }" class="mypageImg"></td>
<td class="reserInfo">
<ul class="planInfo">
	<li class="planSi">${dto.berthInfoName }</li>
	<li class="planSubject">${dto.berthName }</li>
	<li class="planSubject">${dto.reserPer }</li>
	<li class="planDay">${dto.reserVisitStart } ~ ${dto.reserVisitEnd }</li>
</ul>
</td>
<td class="planPrice"><label>가격 : ${dto.reserPrice }</label>
<button class="btn btn-secondary myPlanCategory" type="button" data-bs-toggle="dropdown" aria-expanded="false">
   <i class="bi bi-caret-down-fill categoryI"><span class="userInfo">사용자정보</span></i>
  </button>
  <ul class="dropdown-menu">
    <li><a class="dropdown-item">예약자 : ${dto.reserName }</a></li>
    <li><a class="dropdown-item">연락처 : ${dto.reserTel }</a></li>
  </ul>
  </td>
  <td>
  <button type="button" class="btn btn-primary reserCancelBtn" onclick="cancel()">
  예약취소
  </button>
  </td>
  </tr>
  </table>
  </c:forEach>
  </c:if>
</div>
    </div>
    <%@include file="ceoFooter.jsp" %>
  </div>
  <!-- /본문 -->
</div>
</body>
</html>