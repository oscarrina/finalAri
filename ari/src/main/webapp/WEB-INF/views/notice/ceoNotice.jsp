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

<style>
.content1{
	width:100px;
}

.content2{
	margin-top: 30px;
	margin-bottom: 50px;
}
h3{
	margin-bottom: 15px;
}
.accor1{
	margin-top: 50px;
}
</style>
</head>
<body>
<div id="page-wrapper">
<%@ include file="../ceo/ceoHeader.jsp" %>
  <!-- /사이드바 -->
  <!-- 본문 -->
  <div id="page-content-wrapper">
    <div class="container-fluid">
      	<div class="content2">
      	<h3>공지사항</h3>
      	<div class="accordion accor1" id="accordionExample">
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
		      <div class="accordion-body">
		        <strong>This is the first item's accordion body.</strong> ${dto.noticecontent}
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
    <%@include file="../ceo/ceoFooter.jsp" %>
  </div>
  <!-- /본문 -->

  
</div>
</div>
</body>
</html>