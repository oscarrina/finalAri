<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/adminMainLayout.css">
<link rel="stylesheet" type="text/css" href="/css/adminNotice.css">
<style>
.shares{
	background-color: #e5e5e5;
	border-radius: 25px;
}
.shareBtn{
	background-color:#253BFF; 
	height:35px; 
	font-size:15px; 
	color:white; 
	width:80px;
	float: right;
	box-shadow: 5px 5px 6px #888888;
	border:none;
}
img{
	width:300px;
	border-radius: 25px;
	margin-top:10px;
	margin-bottom:10px;
	margin-left:10px;
	height:180px;
}
a {
    text-decoration: none !important;
}
</style>
</head>
<body>
<div id="page-wrapper">
<%@ include file="/WEB-INF/views/admin/adminHeader.jsp" %>
<div id="page-content-wrapper">
<div class="container-fluid">
	<strong style="font-size:25px; color:#253BFF; width:300px; display: inline-block;" >일정공유</strong>
<br><br>
<c:forEach items="${lists }" var="share" >
<div class="shares">
		<table>
			<tr >
				<td rowspan="5" width="330px"><img src="/imgs/hotel.jpg"></td>
				<td><strong><h4 style="color:#213555;">${share.shareTitle}</h4></strong></td>
			</tr>
			<tr>
				<td>
				<strong style="color:#213555;">작성자:${share.userId}</strong>
				</td>
			</tr>
			<tr>
				<td>
				<strong style="color:#213555;">등록일:${share.shareDate }</strong>
				</td>
				<td><input type="button" value="삭제" onclick="location.href='shareDel?idx=${share.idx}'"></td>
			</tr>
			<tr>
				<td>
				<strong style="color:#213555;">조회수:${share.shareRead }</strong>
				</td>
			</tr>
			<tr>
				<td>
				<i class="bi bi-suit-heart-fill"></i>${share.shareLike }
				</td>
			</tr>
		</table>
</div><br><br>
	</c:forEach>
</div>
<%@ include file="/WEB-INF/views/admin/adminFooter.jsp" %>
</div>
</div>
</body>
</html>