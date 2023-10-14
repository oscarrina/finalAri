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
<div class="content">
<strong style="font-size:25px; color:#253BFF; width:300px; display: inline-block;" >일정공유</strong>
<strong style="font-size:14px; color:#253BFF; margin-left:330px; margin-top:10px;" >나만의 일정을 공유하세요!</strong><input type="button" value="공유" onclick="location.href='planToShare'" class="shareBtn" >
<br><br>
<c:forEach items="${lists }" var="share" >
<a href="shareDetail?idx=${share.idx}">
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
			</tr>
		</table>
</div></a><br><br>
	</c:forEach>
</div>
<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>