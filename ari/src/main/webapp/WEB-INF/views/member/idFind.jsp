<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src ="/js/httpRequest.js"></script>
<script>
function onlynum(num){
	let regexnum = /[^0-9]/g;
	num.value = num.value.replace(/[^0-9]/g, '');
}
//sms 인증번호 api 호출 및 인증확인 버튼 생성
function sendMsg(){
	let tel = document.getElementById("usertel");
	let telCheck = document.getElementById("telCheck");
	telCheck.innerHTML = '';
	if(usertel.value.length < 11){
		telCheck.innerHTML = '올바른 핸드폰 번호를 입력해 주세요';
		telCheck.style.color = 'red';
		return false;
	}else{
		var param = 'tel='+tel.value;
		sendRequest('sendNum',param,sendMsg2,'POST');
	}
}
function sendMsg2(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			document.getElementById('checkBtn').setAttribute('type','button');
			var data = XHR.responseText;
			return data;
		}
	}
}
//인증번호 확인
function numCheck(){
	let anum = document.getElementById("anum");
	let anumCheck = document.getElementById("anumCheck");
	if(anum.value==sendMsg2()){	
		window.alert('인증 되었습니다.');
		anumCheck.innerHTML = "인증되었습니다.";
		anumCheck.style.color = 'green';
	}else{
		window.alert('인증 번호가 일치하지 않습니다.');
	}
}	
function formCheck(userType){
	if(document.getElementById('idCheckMsg').style.color !='green'){
		window.alert('아이디를 확인해 주세요.');
		return false;
	}else if(document.getElementById('anumCheck').style.color !='green'){
		window.alert('핸드폰 번호로 본인인증을 완료해주세요.');
		return false;
	}else{
		document.memberJoin.submit();
	}
}
</script>
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
  <img src="img/logo.png" class="mainimg">
  <form action="/idFind" name="idFind" method="post">
  <div class = "whiteSpace" id = "idCheckMsg"></div>
  <div class="group">
  	<input type="text" name="username" id="username" class="input" placeholder="이름">
  </div>
  <div class="group">
  	<input type="text" name="usertel" id="usertel" class="input" placeholder="휴대폰번호(-없이 숫자만 입력)" oninput="onlynum(this)" maxlength ="11">&nbsp;<input type="button" class="btn2" value="인증번호 받기" onclick = "sendMsg()">
  </div>
  <div class = "whiteSpace" id="telCheck"></div>
  <div class="group">
  	<input type="text" id="anum" class="input" placeholder="인증번호"oninput = "onlynum(this)" maxlength = "6">&nbsp;<input type="hidden" id= "checkBtn" class="btn2" value="인증번호 확인" onclick = "numCheck(sendMsg2())">
  </div>
  <div class = "whiteSpace" id="anumCheck"></div>
  <div class="group">
    <input type="submit" class="btn1" value="아이디 찾기">
  </div>
  </form>
  </div>
 </div>
</body>
</html>