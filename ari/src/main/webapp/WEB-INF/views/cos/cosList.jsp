<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function show(idx) {
	window.location.href = "cosContent?idx=" + idx;
}
</script>
<style>
.a{
	margin-top: 200px;
	margin-left: -26px;
}
.title:visited{
	color: black;
}
.title:link{
	color: black;
}
.img{
	width: 350px;
	height:200px;
	border-radius: 25px;
	
}
.ul{
	white-space: nowrap;
	list-style-type:none;
}
.li{
	margin-left: 0px;
	margin-top: 5px;
	width: 350px;
	font-size: 17px;
	overflow: hidden;
	display: inline-block;
	text-overflow: ellipsis;
}
.table{
	width: 1100px;
}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/header.jsp" %>
<div class="a">
<h1>추천 코스</h1>
<div>
	<select>
	
	</select>
</div>
<table class="table">
	 <c:if test="${empty lists}">
            <tr>
                <td>
                    등록된 코스가 없습니다.
                </td>
            </tr>
        </c:if>
        <c:forEach var="dto" items="${lists}" varStatus="loop">
            <c:if test="${loop.index % 3 == 0}">
                <tr>
            </c:if>
            <td>
                <ul class="ul">
                	<a href="javascript:void(0);" onclick="show(${dto.idx})" class="title">
    					<li><img src="${dto.cosImg}" class="img" /></li>
    					<li class="li">${dto.cosTitle}</li>
					</a>
                </ul>
            </td>
            <c:if test="${loop.index % 3 == 2 or loop.last}">
                </tr>
            </c:if>
        </c:forEach>
</table>

</div>
<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>