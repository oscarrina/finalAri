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
.naverBtn{
	border: none;
	background: none;
	width: 340px;
	height: 50px;
	cursor: pointer;
}
.naverImg{
	width: 340px;
	height: 50px;
}
</style>
<script>
function naverLogin(){
	let uri = 'https://nid.naver.com/oauth2.0/authorize?' +
    'response_type=code' +                  // 인증과정에 대한 내부 구분값 code 로 전공 (고정값)
    '&client_id=FbQAWCCkBvA2Ux7alTCK' +     // 발급받은 client_id 를 입력
    '&state=NAVER_LOGIN_TEST' +             // CORS 를 방지하기 위한 특정 토큰값(임의값 사용)
    '&redirect_uri=http://localhost9091/ariari/naver/login/callback';   // 어플케이션에서 등록했던 CallBack URL를 입력

	// 사용자가 사용하기 편하게끔 팝업창으로 띄어준다.
	window.open(uri, "Naver Login Test PopupScreen", "width=450, height=600");
}
</script>
</head>
<body>
<form name="memberLogin" action="memberLogin" method="post">
<div class="login-wrap">
  <div class="login-html">
  <img src="img/logo.png" class="mainimg">
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
  	<button type="button" class="naverBtn" onclick="naverLogin();"><img src="/img/naver_login.png" alt="네이버로그인" class="naverImg"></button>
  </div>
  <div class="kakaoDiv">
  	<button type="button" class="kakaoBtn"><img src="/img/kakao_login_medium_wide.png" alt="카카오로그인" class="kakaoImg"></button>
  </div>
  </div>
 </div>
 </form>
</body>
</html>