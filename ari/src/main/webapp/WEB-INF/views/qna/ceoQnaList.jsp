<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<%@ include file="../ceo/ceoHeader.jsp" %>
<div id="page-content-wrapper">
    <div class="container-fluid" id="content1">
     <div class="content">
     <br><br><br><br>
<table class="table table-hover">
<tr>
   <thead>
    <tr>
      <th scope="col">문의번호</th>
      <th scope="col">문의제목</th>
      <th scope="col">작성날짜</th>
      <th scope="col">답변여부</th>
    </tr>
  </thead>
  <tbody>
  	<c:if test="${empty lists }">
  		<tr>
  			<td colspan="4" align="center">
  			<h4>등록한 문의가 없습니다!</h4>
  			</td>
  		</tr>
  	</c:if>
    <c:forEach var="dto" items="${lists }">
    <tr class="table-primary">
      <th scope="row">${dto.qnaIdx }</th>
      <td><a href="ceoQnaDetail?qnaIdx=${dto.qnaIdx }">${dto.qnaTitle }</a></td>
      <td>${dto.qnaDate }</td>
      <td>
      <c:if test="${dto.qnaOk==0 }">
      	미답변
      </c:if>
      <c:if test="${dto.qnaOk==1 }">
      	답변완료
      </c:if>
      </td>
    </tr>
    </c:forEach>
  </tbody>
</table>
<div align="center" >
			${pageStr }
		</div>
</div>
    </div>
    <%@include file="../ceo/ceoFooter.jsp" %>
  </div>
  <!-- /본문 -->
</div>
</body>
</html>