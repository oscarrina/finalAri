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
  margin-top: 150px; /* 가로 가운데 정렬 */
  margin-left:auto;
  margin-right:auto;
}
.mainImg{
	width:400px;
	height:300px;
	border-style:solid;
	border-radius:25px;
	border-color:skyblue;
	border-width: medium medium medium medium;
}
h2{
	text-align: center;
}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/header.jsp" %>
<div class="content">
<c:forEach items="${att }" var="att">
<table>
<tr>
	<td rowspan="4">
		<img alt="상세 메인이미지" src="/imgs/att.jpeg" class="mainImg">	
	</td>
	<td>
		<h3>${att.attName }</h3>
	</td>
</tr>
<tr>
	<td>
		별점<br>주소
	</td>
</tr>
<tr>
	<td rowspan="2">
		<h5>${att.attInfo }</h5>
	</td>
</tr>
<tr>
	<td>
		
	</td>
</tr>
</table>
<br><br><br>
<div class="add">
	<h4><strong>업장설명</strong></h4><hr style="border:solid 5px blue">
</div>
</c:forEach>
</div>
<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>