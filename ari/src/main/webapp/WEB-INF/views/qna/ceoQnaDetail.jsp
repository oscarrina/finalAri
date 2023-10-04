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
<style>
#qnaTitle{
	width:400px;
	height:40px;
	border-color:blue;
	border-radius:30px;
	margin-top:20px;
	text-align: center;
}
#qnaCategory{
	width:200px;
	height:40px;
	border-color:blue;
	border-radius:30px;
	margin-top:20px;
	text-align:center;
}
#qnaDate{
	width:200px;
	height:40px;
	border-color:blue;
	border-radius:30px;
	margin-top:20px;
	text-align:center;
}
#exampleTextarea{
	margin-top:20px;
	border-radius:25px;
	border-color:blue;
}
</style>
</head>
<body>
<div id="page-wrapper">
<%@ include file="../ceo/ceoHeader.jsp" %>
<div id="page-content-wrapper">
    <div class="container-fluid" id="content1">
     <div class="content">
     <div>
     	<table width="800" align="center">
     	<c:forEach var="dto" items="${lists }" >
     		<tr>
     			<td colspan="2">
     			<input type="text" name="qnaTitle" id="qnaTitle" value="${dto.qnaTitle }" readonly>
     			</td>
     		</tr>
     		<tr>
     			<td>
     			<input type="text" id="qnaCategory" value="${dto.qnaCategory}" readonly>
     			</td>
     			<td>
     			<input type="text" id="qnaDate" value="${dto.qnaDate}" readonly>
     			</td>
     		</tr>
     		<tr>
     			<td colspan="2">
     			<textarea class="form-control" id="exampleTextarea" rows="8" 
				readonly>${dto.qnaContent }</textarea>
     			</td>
     		</tr>
     	</c:forEach>
     	</table>
     </div>
</div>
    </div>
    <%@include file="../ceo/ceoFooter.jsp" %>
  </div>
  <!-- /본문 -->
</div>
</body>
</html>