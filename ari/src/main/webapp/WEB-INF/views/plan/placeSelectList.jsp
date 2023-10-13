<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" type="text/css" href="/css/planMainLayout.css">
<c:forEach var = "dto" items="${list}">
	<div class = palceButton onclick ="insertPlanner(this.src)" ><img class="img" src="${dto.infoImg}" alt="Image"><span>${dto.infoName}</span></div>
</c:forEach>