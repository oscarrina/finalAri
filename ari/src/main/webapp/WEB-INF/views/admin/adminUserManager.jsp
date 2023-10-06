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
function show(){
	var cate=document.all.userSbox.value;
	var param='type='+cate;
	location.href='adminUser?'+param;
}
</script>
</head>
<body>
<div id="page-wrapper">
<%@ include file="/WEB-INF/views/admin/adminHeader.jsp" %>
<div id="page-content-wrapper">
<div class="container-fluid">
	<div class="content2">
      	<h3>유저관리</h3>
      	<select class="form-select border1" aria-label="Default select example" onchange="show()" id="userSbox">
		  <option value="3" ${type==3?"selected":"" }>전체</option>
		  <option value="1" ${type==1?"selected":"" }>사용자</option>
		  <option value="2" ${type==2?"selected":"" }>사업자</option>
		</select>
	</div>
	<table class="table">
		  <thead>
		    <tr>
		      <th scope="col">회원유형</th>
		      <th scope="col">회원아이디</th>
		      <th scope="col">회원이름</th>
		      <th scope="col">전화번호</th>
		      <th scope="col">가입날짜</th>
		      <th scope="col">탈퇴여부</th>
		    </tr>
		  </thead>
		  <tfoot>
		  	<tr>
				<td colspan="6" align="center">
					${pageStr }
				</td>
			</tr>
		  </tfoot>
		  <tbody>
		    <c:if test="${empty list }">
		    	<tr>
				<td colspan="6" align="center">
				등록된 회원이 없습니다.
				</td>
			</tr>
		    </c:if>
		    <c:forEach var="dto" items="${list }">
			<tr>
				<c:choose>
						<c:when test="${dto.usertype==1 }">
							<td>사용자</td>
						</c:when>
						<c:when test="${dto.usertype==2 }">
							<td>사업자</td>
						</c:when>
						<c:when test="${dto.usertype==3 }">
							<td>전체</td>
						</c:when>
					</c:choose>
				<td>${dto.userid }</td>
				<td>${dto.username }</td>
				<td>${dto.usertel }</td>
				<td>${dto.userdate }</td>
				<td>${dto.userstate }</td>
			</tr>
		</c:forEach>
		  </tbody>
		</table>
</div>
<%@ include file="/WEB-INF/views/admin/adminFooter.jsp" %>
</div>
</div>
</body>
</html>