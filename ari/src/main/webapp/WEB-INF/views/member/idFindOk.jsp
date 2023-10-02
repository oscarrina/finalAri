<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.login-wrap{
  width:100%;
  margin:auto;
  max-width:525px;
  min-height:670px;
  position:relative;
}
.login-html{
  width:100%;
  height:100%;
  position:absolute;
  padding:90px 70px 50px 70px;
}
.mainimg{
  width: 330px;
  height: 130px;
}
.a{
  margin: 100px;
}
</style>
</head>
<body>
<div class="login-wrap">
  <div class="login-html">
  <img src="img/logo.png" class="mainimg">

  <h3 class="a">아이디는 ${dto.userid }입니다.</h3>

  </div>
</div>
</body>
</html>