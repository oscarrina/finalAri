<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.notice1{
  margin-top: 20px;
  margin-left: -10px;
  color: gray;
  font-size: 12px;
}
.notice{
  margin-left: -10px;
  color: gray;
  font-size: 12px;
}
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
  	<input type="password" id="pwd" class="input" data-type="password" placeholder="새 비밀번호">
  </div>
  <div class="group">
  	<input type="password" id="pwd2" class="input" data-type="password" placeholder="비밀번호 확인">
  </div>
  <div class="group">
    <input type="submit" class="btn1" value="로그인">
  </div>
  <div class="notice1">8~15자의 영문 대/소문자, 숫자, 특수문자 중 2개 이상 조합</div>
  <div class="notice">사용가능 특수문자: ! “ $ % & ‘ () * + , - . / : ; < > = ? @ # [] ₩ ^ _`{} ~ |</div>
  <div class="notice">동일하거나 연속된 4자리 이상의 숫자/영문 반복 사용불가</div>
  <div class="notice">아이디, 생일, 전화번호 등 개인정보 사용불가</div>
  <div class="notice">이전 사용 암호 재사용 불가</div>
  </div>
</div>
</body>
</html>