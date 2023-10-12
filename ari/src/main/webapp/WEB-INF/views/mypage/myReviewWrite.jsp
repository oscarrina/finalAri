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
function reviewWrite(){
	location = 'myReviewWrite';
}
function reviewSelect(){
	location = 'myReview';
}
function cancel(reserIdx) {
	location = 'reviewContent?reseridx='+reserIdx;
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
<button type="button" class="btn btn-primary" 
style="background-color:#666CDE; width:400px; height:40px; font-size:15px;" onclick="reviewWrite()">작성 가능한 리뷰</button>
<button type="button" class="btn btn-primary" 
style="background-color:#666CDE; width:400px; height:40px; font-size:15px;" onclick="reviewSelect()">작성한 리뷰</button>

<div class="mypagePlan">
      <c:if test="${empty list}">
      <h1>작성 가능한 리뷰가 없습니다.</h1>
      </c:if>
      <c:if test="${not empty list}">
<table class="reserTable">
<tfoot>
  	<tr>
			<td colspan="6" align="center">
			${pageStr }
			</td>
	</tr>
  </tfoot>
      <c:forEach var="dto" items="${list }">
      <c:if test="${dto.reserVisitEnd < now }">
<tr>
<td class="reserClass"><img alt="숙박업체이미지" src="/img/${dto.berthInfoImg }" class="mypageImg"></td>
<td class="reserInfo">
<ul class="planInfo">
	<li class="planSi">${dto.berthInfoName }</li>
	<li class="planSubject">${dto.berthName }</li>
	<li class="planSubject">${dto.reserPer }명</li>
	<li class="planDay">${dto.reserVisitStart } ~ ${dto.reserVisitEnd }</li>
</ul>
</td>
<td class="planPrice"><label>가격 : ${dto.reserPrice }</label></td>
  <td>
  <c:if test="${dto.reserReview == 'N' }">
  <button type="button" class="btn btn-primary reserCancelBtn" onclick="cancel(${dto.reserIdx })">
  리뷰쓰기
  </button>
  </c:if>
  </td>
  </tr>
  <input type="hidden" id="userType" value="user">
  </c:if>
  </c:forEach>
  </table>
  </c:if>
</div>
</div>
<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>