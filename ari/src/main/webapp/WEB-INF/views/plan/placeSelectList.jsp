<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:forEach var = "dto" items="${list}" varStatus="loop">
	<div class = placeButton onclick ="insertPlanner(this)" id="${loop.index}"><img id = "addrImg${loop.index}" class="img" src="${dto.infoImg}" alt="Image"><p id = "${dto.idx}"></p><span id = "${dto.addr}">${dto.infoName}</span></div>
</c:forEach>
