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
.btn1{
  border:none;
  padding:15px 20px;
  border-radius:25px;
  background:#253BFF;
  margin-top: 40px;
  width: 350px;
  color: #fff;
  cursor: pointer;
}
.btn1:hover{
  background-color: #38B6FF;
}
</style>
</head>
<body>
<div class="login-wrap">
  <div class="login-html">
  <img src="img/logo.png" class="mainimg">

  <h3 class="a">아이디는 ${dto.userid }입니다.</h3>
	<input type="button" value="로그인 하기" class="btn1" onclick="javascript:location.href='memberLogin'">
	<input type="button" value="비밀번호 찾기" class="btn1" onclick="javascript:location.href='pwdFind1'">
  </div>
</div>
</body>
</html>