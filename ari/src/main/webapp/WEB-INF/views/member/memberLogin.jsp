<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<c:if test="${!(empty cookie.saveid) }">
	<c:url var="goAutoLogin" value="/autoLogin">
		<c:param name="userid">${cookie.saveid.value }</c:param>
	</c:url>
	<script>
		location.href='${goAutoLogin}';
	</script>
</c:if> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아리아리 로그인</title>
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
.kakaoDiv{
	margin-top: 10px;
}
.kakaoBtn{
	border: none;
	background: none;
	width: 340px;
	cursor: pointer;
}
.kakaoImg{
	width: 340px;
}
.b{
  margin-right: 150px;
  text-decoration: none;
}
.c{
  margin-left: 28%;
  text-decoration: none;
}
a:visited{
  color: black;
}
a:link{
  color: black;
}
a:hover{
  color: black;
}
</style>
</head>
<body>
<form name="memberLogin" action="memberLogin" method="post">
<div class="login-wrap">
  <div class="login-html">
  <a href="/"><img src="img/logo.png" class="mainimg"></a>
  <div class="group">
  	<input type="text" id="id" class="input" placeholder="아이디" name="userid" required="required">
  </div>
  <div class="group">
  	<input type="password" id="pwd" class="input" data-type="password" placeholder="비밀번호" name="userpwd" required="required">
  </div>
  <div class="group">
  	<input id="check" type="checkbox" class="check" name="autologin">
    <label for="check"><span class="icon"></span>자동로그인</label>
  </div>
  <div class="group">
    <input type="submit" class="btn1" value="로그인">
  </div>
  <div class="kakaoDiv">
  	<a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=3623a44fed0e1055e089acc18ec7aacf&redirect_uri=http://192.168.219.102:9000/oauth/kakao&response_type=code"><button type="button" class="kakaoBtn"><img src="/img/kakao_login_medium_wide.png" alt="카카오로그인" class="kakaoImg"></button>
  	</a>
  <div class="group">
    <a href="idFind" class="b">아이디 찾기</a>
    <a href="pwdFind1" class="b">비밀번호 찾기</a>
  </div>
  <div >
  <a href = "memberJoinChoice" class="c">회원가입</a>
  </div>
  </div>
 </div>
 </div>
 </form>
</body>
</html>