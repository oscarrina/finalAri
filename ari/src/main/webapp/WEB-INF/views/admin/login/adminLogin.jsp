<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<c:if test="${!empty cookie.saveid }">
	<c:url var="goAutoAdminLogin" value="/autoAdminLogin">
		<c:param name="adminid">${cookie.saveid.value }</c:param>
	</c:url>
	<script>
		location.href='${goAutoAdminLogin}';
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
  background:#FFFFFF;
  margin-top: 40px;
  width: 300px;
}
.btn1{
  border:none;
  padding:15px 20px;
  border-radius:25px;
  background:#FFFFFF;
  margin-top: 40px;
  width: 350px;
  color: #213555;
  cursor: pointer;
}
.btn1:hover{
  background-color: #D8C4B6;
}
.bd{
	background-color: #213555;
}
#idsearch{
	margin-top:10px;
	color:#FFFFFF;
}
</style>
</head>
<body class="bd">
<form name="adminLogin" action="/adminLogin" method="post">
<div class="login-wrap">
  <div class="login-html">
  <img src="img/logoX.png" class="mainimg">
  <div class="group">
     <input type="text" id="id" class="input" placeholder="아이디" required="required" name="adminid">
  </div>
  <div class="group">
     <input type="password" id="pwd" class="input" data-type="password" placeholder="비밀번호" required="required" name="adminpwd">
  </div>
  <div class="group" id="idsearch" >
     <input id="check" type="checkbox" class="check" name="autologin">
    <label for="check"><span class="icon"></span>자동로그인</label>
  </div>
  <div class="group">
    <input type="submit" class="btn1" value="로그인">
  </div>
  </div>
 </div>
 </form>
</body>
</html>