<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css/adminMainLayout.css">
</head>
<body>
<div id="page-wrapper">
<%@ include file="/WEB-INF/views/admin/adminHeader.jsp" %>
  <!-- /사이드바 -->

  <!-- 본문 -->
  <div id="page-content-wrapper">
    <div class="container-fluid" id="content1">
      <h1>배너 이미지 관리</h1>
      <table>
      	<thead>
	      	<tr>
	      		<th>배너 번호</th>
	      		<th>배너 이름</th>
	      		<th>배너 이미지</th>
	      		<th></th>
	      	</tr>
	     </thead>
	     <tbody>
		<c:if test="${empty lists }">
			<tr>
				<td colspan="3" align="center">
				등록된 배너가 없습니다.
				</td>
			</tr>
		</c:if>
		<c:forEach var="dto" items="${lists }">
			<tr>
				<td>${dto.bannerIdx }</td>
				<td>${dto.bannerName }</td>
				<td>${dto.bannerImg }</td>
			</tr>
		</c:forEach>
		</tbody>
      </table>
      <div><input type="button" value="등록"></div>
    </div>
    <%@include file="/WEB-INF/views/admin/adminFooter.jsp" %>
  </div>
  <!-- /본문 -->
</div>
</body>
</html>