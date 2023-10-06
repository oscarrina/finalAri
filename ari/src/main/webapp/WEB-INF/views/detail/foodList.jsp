<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/searchCss.css">
</head>
<body>
<%@include file="/WEB-INF/views/header.jsp" %>
<div class="content">
<c:forEach var="food" items="${food }">
	<article class="postcard dark blue">
			<a class="postcard__img_link" href="#">
				<img class="postcard__img" src="https://picsum.photos/1000/1000" alt="Image Title" />
			</a>
			<div class="postcard__text">
				<h1 class="postcard__title blue"><a href="#" style="text-decoration-line: none; color:#00008C; ">${food.foodInfoName }</a></h1>
				<div class="postcard__bar"></div>
				<div class="postcard__preview-txt">${food.foodInfo }</div>
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