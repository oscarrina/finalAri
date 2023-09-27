<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
.input{
  border-color:#253BFF;
  padding:15px 20px;
  border-radius:25px;
  background:rgba(255,255,255,.1);
  margin-top: 40px;
  width: 300px;
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
.mainimg{
  width: 330px;
  height: 130px;
}
</style>
</head>
<body>
<div class="login-wrap">
  <div class="login-html">
  <img src="img/logo.png" class="mainimg">
  <div class="group">
  	<input type="text" id="id" class="input" placeholder="아이디">
  </div>
  <div class="group">
  	<input type="password" id="pwd" class="input" data-type="password" placeholder="비밀번호">
  </div>
  <div class="group">
  	<input id="check" type="checkbox" class="check" checked>
    <label for="check"><span class="icon"></span>아이디 기억하기</label>
  </div>
  <div class="group">
    <input type="submit" class="btn1" value="로그인">
  </div>
  </div>
 </div>
</body>
</html>