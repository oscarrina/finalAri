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
.mainImg{
	width:450px;
	height:300px;
	border-radius:25px;
}
h3{
  text-align: left;
}
.topTh{
  border-top-left-radius: 25px;
  
}
.bottomTh{
  border-bottom-left-radius: 25px;
}
th{
  background-color: skyblue;
}
h5{
  text-align: center;
}
.mainTableDiv{
  border: solid 3px #253BFF;
  border-radius: 25px;
}
.mainTable{
	border-spacing: 10px;
}
.addTable{
  width:900px;
  border-collapse: separate;
  border-spacing: 0 15px;
}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/header.jsp" %>
<div class="content">
<c:forEach items="${food }" var="food">
<div class="mainTableDiv">
<table class="mainTable">
<tr>
	<td rowspan="4" width="450">
		<img alt="상세 메인이미지" src="/imgs/att.jpeg" class="mainImg">	
	</td>
	<td width="450">
		<h4>&nbsp;&nbsp;${food.infoName }</h4>
	</td>
</tr>
<tr>
	<td width="450">
		<strong>&nbsp;&nbsp;${food.addr }</strong>
	</td>
</tr>
<tr>
	<td rowspan="2" height="150" width="450">
		<h6>&nbsp;&nbsp;${food.info }</h6>
	</td>
</tr>

</table>
</div>
<br><br><br>
<h6>식당</h6>
<div >
<table class="addTable">
	<tr>
		<th class="topTh"><h5>전화번호</h5></th>
		<td><h5>${food.tel }</h5></td>
	</tr>
	<tr>
		<th><h5>주차시설 유무</h5></th>
		<td><c:choose>
  	 	 <c:when test="${food.parking == 0}">
    	  <h5>무</h5>
  		 </c:when>
   		 <c:otherwise>
         <h5>유</h5>
   		 </c:otherwise>
		</c:choose></td>
	</tr>
	<tr>
		<th><h5>이용시간</h5></th>
		<td>
		<h5>${food.foodOpen}</h5>
		</td>
	</tr>
	<tr>
		<th><h5>휴무일</h5></th>
		<td>
		<h5>${food.foodClose}</h5>
		</td>
	</tr>
	<tr>
		<th class="bottomTh"><h5>메뉴</h5></th>
		<td><h5>${food.foodMenu }</h5></td>
	</tr>
</table>
</div>
</c:forEach>
</div>
<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>