<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.content{
	display: block;
  width: 900px; /* 원하는 너비로 조정 */
  margin-top: 160px; /* 가로 가운데 정렬 */
  margin-left:auto;
  margin-right:auto;
}
.plans{
	border: solid 3px #253BFF;
	border-radius: 25px;
}
img{
	border-radius: 25px;
}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/header.jsp" %>
<div class="content">
<div class="plans">
	<c:forEach items="${plan }" var="plan">
		<table>
			<tr>
				<td><img alt="지역대표사진" src="/imgs/hotel.jpg"></td>
				<td><h5><Strong></Strong></h5></td>
				<td><input type="button" onclick="javascript:location.href='shareForm?planIdx=${plan.planIdx}"></td>
			</tr>
			<tr>
				<td><h5>여행기간:${plan.planStart }~${plan.planEnd }</h5></td>
			</tr>
			<tr>
				<td><h5>일정생성일:${plan.planDate}</h5></td>
			</tr>
		</table>
	</c:forEach>
</div>
</div>
<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>