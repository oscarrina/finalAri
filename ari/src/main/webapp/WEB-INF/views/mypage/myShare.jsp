<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#myShare{
	color: #253BFF;
}
.dddd{
	margin-top:150px;
	display: inline-block;
	width: 75%;
	height: 100vh;
	float: right;
}
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
<%@include file="/WEB-INF/views/header.jsp" %>
<%@include file="/WEB-INF/views/mypage/mypageSide.jsp" %>
<div class="dddd">
<div class="content">
<br><br>
<c:if test="${empty lists }"><h3 style="color:#213555;">공유한 일정이 없습니다!</h3></c:if>
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
			</tr>
			<tr>
				<td>
				<strong style="color:#213555;"><i class="bi bi-eye"></i>:${share.shareRead }</strong>
				</td>
			</tr>
			<tr>
				<td>
				<i class="bi bi-suit-heart-fill"></i>${share.shareLike }
				</td>
				<td><input type="button" value="삭제" onclick="location.href='myShareDel?idx=${share.idx}'"></td>
			</tr>
		</table>
</div><br><br>
	</c:forEach>
</div>
</div>
<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>