<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.notice{
  margin-left: -45px;
  margin-top: 40px;
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
.whiteSpace{
 height: 10px;	
 font-size: 13px;
 margin-left: 10px;
}
</style>
</head>
<body>
<div class="login-wrap">
  <div class="login-html">
  <a href="/"><img src="img/logo.png" class="mainimg"></a>
  <form action="/pwdFind1" name="pwdFind1" method="post">
  <div class="notice"><h3>아이디 확인 후 비밀번호를 재설정 할 수 있습니다.</h3></div>
  <div class="group">
  	<input type="text" id="userid" name="userid" class="input" placeholder="아이디">
  </div>
  <div class="group">
    <input type="submit" class="btn1" value="아이디 확인">
  </div>
  </form>
  </div>
</div>
</body>
</html>