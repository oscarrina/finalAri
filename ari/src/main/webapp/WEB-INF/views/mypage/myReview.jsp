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
<script src="//code.jquery.com/jquery.min.js"></script>
<script>
function reviewWrite(){
	location = 'myReviewWrite';
}
function reviewSelect(){
	location = 'myReview';
}
function reviewDel(reviewIdx) {
	if (confirm("리뷰를 삭제하시겠습니까?")) {
        $.ajax({
            type: "POST",
            url: "/reviewDel",
            data: { reviewIdx: reviewIdx }
        });
    }
    location.reload();
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
      <h1>작성한 리뷰가 없습니다.</h1>
      </c:if>
      <c:if test="${not empty list }">
<table class="reserTable">
<tfoot>
  	<tr>
			<td colspan="6" align="center">
			${pageStr }
			</td>
	</tr>
  </tfoot>
      <c:forEach var="dto" items="${list }">
<tr>
<td class="reserClass"><img alt="숙박업체이미지" src="/img/${dto.reviewImg }" class="mypageImg"></td>
<td class="reserInfo">
<ul class="planInfo">
	<li class="planSi">${dto.reviewContent }</li>
</ul>
</td>
<td class="planPrice"><label>${dto.reviewDate }</label></td>
  <td>
  <button type="button" class="btn btn-primary reserCancelBtn" onclick="reviewDel(${dto.reviewIdx })">
  리뷰삭제
  </button>
  </td>
  </tr>
  <input type="hidden" id="userType" value="user">
  </c:forEach>
  </table>
  </c:if>
</div>
</div>
<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>