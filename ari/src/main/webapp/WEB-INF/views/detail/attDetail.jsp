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
.mainTable{
  border: solid 3px #253BFF;
  border-radius: 25px;
  border-spacing: 20px;
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
<c:forEach items="${att }" var="att">
<div class="mainTable">
<table>
<tr>
	<td rowspan="4">
		<img alt="상세 메인이미지" src="/imgs/${att.infoImg }" class="mainImg">	
	</td>
	<td>
		<h3>${att.infoName }</h3>
	</td>
</tr>
<tr>
	<td>
		${att.addr }
	</td>
</tr>
<tr>
	<td rowspan="2">
		<h6>${att.info }</h6>
	</td>
</tr>
<tr>
	<td>
		
	</td>
</tr>
</table>
</div>
<br><br><br>
<h6>관광지</h6>
<div >
<table class="addTable">
	<tr>
		<th class="topTh"><h5>주차시설 유무</h5></th>
		<td><c:choose>
  	 	 <c:when test="${att.attParking == 0}">
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
		<h5>${att.attStart }~${att.attEnd }</h5>
		</td>
	</tr>
	<tr>
		<th><h5>휴무일</h5></th>
		<td>
		<h5>${att.attClose }</h5>
		</td>
	</tr>
	<tr>
		<th><h5>체험가능 연령</h5></th>
		<td><h5>${att.attAge }</h5></td>
	</tr>
	<tr>
		<th><h5>유모차 대여</h5></th>
		<td>
		<c:choose>
		<c:when test="${att.attBaby==0 }">
		<h5>불가능</h5>
		</c:when>
		<c:otherwise>
		<h5>가능</h5>
		</c:otherwise>
		</c:choose>
		</td>
	</tr>
	<tr>
		<th class="bottomTh"><h5>반려동물 동반 가능 여부</h5></th>
		<td>
		<c:choose>
		<c:when test="${att.attPet==0 }">
		<h5>불가능</h5>
		</c:when>
		<c:otherwise>
		<h5>가능</h5>
		</c:otherwise>
		</c:choose>
		</td>
	</tr>
</table>
</div>
</c:forEach>
</div>
<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>