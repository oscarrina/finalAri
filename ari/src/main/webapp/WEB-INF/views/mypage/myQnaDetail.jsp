<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/mypage.css">
<style>
#myQna{color: #253BFF;}
.maindiv{
	margin-top:150px;
	display: inline-block;
	width: 75%;
	height: 100vh;
	float: right;
}
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
<%@include file="/WEB-INF/views/header.jsp" %>
<%@include file="/WEB-INF/views/mypage/mypageSide.jsp" %>
<div class="maindiv">
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
<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>