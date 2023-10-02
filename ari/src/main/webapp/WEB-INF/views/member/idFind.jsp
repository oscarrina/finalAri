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
  margin-top: 30px;
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
.btn2{
  border:none;
  padding:15px 20px;
  border-radius:25px;
  background:#253BFF;
  margin-top: 30px;
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
}
</style>
</head>
<body>
<div class="login-wrap">
  <div class="login-html">
  <img src="img/logo.png" class="mainimg">
  <form action="/idFind" name="idFind" method="post">
  <div class="group">
  	<input type="text" name="username" id="username" class="input" placeholder="이름">
  </div>
  <div class="group">
  	<input type="text" name="usertel" id="usertel" class="input" placeholder="휴대폰번호(숫자만 입력)">&nbsp;<input type="button" class="btn2" value="인증번호 받기">
  </div>
<!--   <div class="group">
  	<input type="text" id="anum" class="input" placeholder="인증번호">
  </div> -->
  <div class="group">
    <input type="submit" class="btn1" value="아이디 찾기">
  </div>
  </form>
  </div>
 </div>
</body>
</html>