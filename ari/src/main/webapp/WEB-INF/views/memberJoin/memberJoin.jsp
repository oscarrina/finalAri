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
  margin-top: 20px;
  width: 300px;
}
.input2{
  border-color:#253BFF;
  padding:15px 20px;
  border-radius:25px;
  background:rgba(255,255,255,.1);
  margin-top: 20px;
  width: 165px;
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
  margin-bottom: 30px;
}
.btn1:hover{
  background-color: #38B6FF;
}
.btn2{
  border:none;
  padding:15px 20px;
  border-radius:25px;
  background:#253BFF;
  margin-top: 20px;
  width: 130px;
  color: #fff;
  cursor: pointer;
}
.btn2:hover{
  background-color: #38B6FF;
}
.mainimg{
  width: 330px;
  height: 130px;
  margin-top: -50px;
}
</style>
</head>
<body>
<div class="login-wrap">
  <div class="login-html">
  <img src="img/logo.png" class="mainimg">
  <div class="group">
  	<input type="text" id="name" class="input" placeholder="이름">
  </div>
  <div class="group">
  	<input type="text" id="id" class="input" placeholder="아이디">&nbsp;<input type="button" class="btn2" value="중복확인">
  </div>
  <div class="group">
  	<input type="password" id="pwd" class="input" data-type="password" placeholder="비밀번호">
  </div>
  <div class="group">
  	<input type="password" id="pwd2" class="input" data-type="password" placeholder="비밀번호 확인">
  </div>
  <div class="group">
  	<input type="text" id="email" class="input" placeholder="이메일">
  </div>
  <div class="group">
  	<input type="text" id="tel" class="input" placeholder="휴대폰번호(숫자만 입력)">&nbsp;<input type="button" class="btn2" value="인증번호 받기">
  </div>
  <div class="group">
  	<input type="text" id="anum" class="input" placeholder="인증번호">
  </div>
  <div class="group">
  	<input type="text" id="addr1" class="input2" placeholder="우편번호">&nbsp;<input type="button" class="btn2" value="주소검색">
  </div>
  <div class="group">
  	<input type="text" id="addr2" class="input" placeholder="주소">
  </div>
  <div class="group">
  	<input type="text" id="addr3" class="input" placeholder="상세주소">
  </div>
  <div class="group">
    <input type="submit" class="btn1" value="회원가입">
  </div>
  </div>
 </div>
</body>
</html>