<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/adminMainLayout.css">
<link rel="stylesheet" type="text/css" href="/css/adminNotice.css">
<style>
#myLike{color: #253BFF;}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/header.jsp" %>
<%@include file="/WEB-INF/views/mypage/mypageSide.jsp" %>
<div class="mypageReviewDiv">
<div class="mypagePlan">
      <c:if test="${empty list}">
      <h1>좋아요를 누른 글이 없습니다.</h1>
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
  <c:set var="i" value="0"></c:set>
  <c:set var="j" value="3"></c:set>
      <c:forEach var="dto" items="${list }">
      <c:if test="${i%j == 0 }"><tr></c:if>
<td class="reserLikeClass"><a href="myLikeLink?idx=${dto.idx }&likeType=${dto.likeType}">
<c:if test="${dto.likeType == 1 }"><img alt="숙박업체이미지" src="${dto.img }" class="mypageLikeImg"></c:if>
<c:if test="${dto.likeType == 2 }"><img alt="숙박업체이미지" src="/img/${dto.img }" class="mypageLikeImg"></c:if></a></td>
	  <c:if test="${i%j == j-1 }"></tr></c:if>
	  <c:set var="i" value="${i+1 }" />
  </c:forEach>
  </table>
  </c:if>
</div>
</div>
<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>