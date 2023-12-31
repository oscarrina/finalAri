<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/searchCss.css">
<style>
.content{
	margin-top:150px;
}
img{
	overflow: hidden;
   object-fit:cover;
   wudth:250px;
   height: 350px;
}
</style>
<script>
function dateFormat(date){
	const year = date.getFullYear().toString();
	const month = (date.getMonth()+1).toString().padStart(2, '0');
	const day = date.getDate().toString().padStart(2, '0');;
	const dateString = year + '-' + month + '-' + day;
	return dateString;
}

function berthDetail(idx){
	var date = new Date();
	var tomorrow = new Date();
	tomorrow.setDate(tomorrow.getDate() + 1)
	location.href = 'berthInfoDetail?berthInfoIdx='+idx+'&startDate='+dateFormat(date)
			+'&endDate='+dateFormat(tomorrow);
}
</script>
</head>
<body>
<%@include file="/WEB-INF/views/header.jsp" %>
<div class="content">
<c:forEach var="berthInfo" items="${berthInfo}">
	<article class="postcard dark blue">
			<a class="postcard__img_link" onclick="berthDetail(${berthInfo.idx })">
				<img class="postcard__img" src="/imgs/${berthInfo.infoImg }" alt="Image Title" />
			</a>
			<div class="postcard__text">
				<h1 class="postcard__title blue"><a onclick="berthDetail(${berthInfo.idx })" style="text-decoration-line: none; color:#00008C; ">${berthInfo.infoName }</a></h1>
				<div class="postcard__bar"></div>
				<div class="postcard__preview-txt">${berthInfo.info}</div>
				<ul class="postcard__tagbox" style="list-style: none">
					<li class="tag__item"><i class="fas fa-tag mr-2"></i></li>
					<li class="tag__item"><i class="fas fa-clock mr-2"></i></li>
					<li class="tag__item play blue">
						<a href="#"><i class="fas fa-play mr-2"></i></a>
					</li>
				</ul>
			</div>
		</article>
</c:forEach>
</div>
<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>