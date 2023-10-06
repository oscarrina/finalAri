<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.a{
	margin-top: 200px;
}
.img{
	width: 350px;
	height:200px;
	margin-left: 15px;
	border-radius: 25px;
	
}
.ul{
	white-space: nowrap;
	list-style-type:none;
	
}
.li{
	margin-left: 20px;
	margin-top: 5px;
	font-size: 17px;
	overflow: hidden;
}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/header.jsp" %>
<div class="a">
<h1>추천 코스</h1>
<table>
	<tr>
		<c:if test="${empty lists }">
			<td>
				등록된 코스가 없습니다.
			</td>
		</c:if>
		<c:forEach var="dto" items="${lists }">
			<td>
				<ul class="ul">
					<li><img src="${dto.cosImg }" class="img"/></li>
					<li class="li">${dto.cosTitle }</li>
				</ul>
			</td>
		</c:forEach>
	</tr>
</table>

</div>
<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>