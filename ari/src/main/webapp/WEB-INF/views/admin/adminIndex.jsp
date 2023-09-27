<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css/finalAdminTest.css">
</head>
<body>
<div id="page-wrapper">
<%@ include file="adminHeader.jsp" %>
  <!-- /사이드바 -->

  <!-- 본문 -->
  <div id="page-content-wrapper">
    <div class="container-fluid" id="content1">
      <h1>간단한 사이드바</h1>
      <p>메뉴가 많아서 한 페이지를 넘으면 세로 스크롤바 생김</p>
      <h1>Content</h1>
    </div>
    <%@include file="adminFooter.jsp" %>
  </div>
  <!-- /본문 -->
</div>

</body>
</html>