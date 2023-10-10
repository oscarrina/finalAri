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
<style>
.content{
  display: block;
  width: 900px; /* 원하는 너비로 조정 */
  margin-top: 150px; /* 가로 가운데 정렬 */
  margin-left:auto;
  margin-right:auto;
}
#exampleSelect1{
	width:220px;
	border-color:blue;
	text-align: center;
	border-radius: 30px;
}
#exampleTextarea{
	margin-top:20px;
	border-radius:25px;
	border-color:blue;
}
table{
	margin-top: 30px;
	margin-bottom: 60px;
}
.underline {
  text-decoration:none;
  line-height: 1.2;
  font-size: 15px;
  font-weight: 700;
  background-image: linear-gradient(transparent calc(100% - 3px), #666CDE 3px);
  background-repeat: no-repeat;
  background-size: 0% 100%;
  transition: background-size 0.8s;
  color: #213555;
  cursor: pointer;
}
@media (min-width: 1000px) {
  .underline {
    font-size: 15px;;
  }
}
.underline.yellow {
  background-image: linear-gradient(transparent 60%, #666CDE 40%);
}
.underline:hover {
  text-decoration:none;
  color:#666CDE;
  background-size: 100% 100%;
}
.bgcolor1{
	background-color: #EAEDF4;
}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/header.jsp" %>
<div class="content">
<!-- 본문 -->
  <div id="page-content-wrapper">
    <div class="container-fluid">
      	<div class="content2">
      	<h3>공지사항</h3>
      	<div class="accordion" id="accordionExample">
		    <c:if test="${empty lists }">	    	
			  <div class="accordion-item">
			    <h2 class="accordion-header" id="headingTwo">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
			       등록된 공지사항이 없습니다.
			      </button>
			    </h2>
			  </div>
		    </c:if>
		    <c:forEach var="dto" items="${lists }">
			<div class="accordion-item">
		    <h2 class="accordion-header" id="heading${dto.noticeidx}">
		      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse${dto.noticeidx}" aria-expanded="false" aria-controls="collapse${dto.noticeidx}">
		       <c:if test="${dto.noticetop==1 }">[공지]</c:if>
					        ${dto.noticetitle}
		      </button>
		    </h2>
		    <div id="collapse${dto.noticeidx}" class="accordion-collapse collapse" aria-labelledby="heading${dto.noticeidx}" data-bs-parent="#accordionExample">
		      <div class="accordion-body bgcolor1">
		         ${dto.noticecontent}
		      </div>
		    </div>
		  </div>
		</c:forEach>
		<div align="center" >
			<c:if test="${empty lists }">
				
			</c:if>
			<c:if test="${!empty lists }">
				${pageStr }
			</c:if>
		</div>
		    </div>
		</div>	  
    </div>
  </div>
  <!-- /본문 -->
</div>
<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>