<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function passwordCheck(password) {	
	let passwordCheckMsg = document.getElementById("passwordCheckMsg");
    let regexPw = /(?=.*\d)(?=.*[a-zA-ZS]).{8,20}/
    if(password.value != '') {
         if(!regexPw.test(pwd.value)||password.length < 8) {
			passwordCheckMsg.innerHTML = '비밀번호는 공백없이 8~20자리, 대소문자, 숫자, 특수문자로 구성하여야 합니다.';
			passwordCheckMsg.style.color = 'red';
		} else {
			passwordCheckMsg.innerHTML = "사용 가능한 비밀번호입니다.";
			passwordCheckMsg.style.color = 'green';
		}
    }
    let passwordDoubleMsg = document.getElementById("passwordDoubleMsg");
    let passwordDoubleCheck = document.getElementById("pwd2")
    if(document.getElementById("passwordCheckMsg").innerHTML=="사용 가능한 비밀번호입니다."&&passwordDoubleCheck.value!==''){
		if(document.getElementById("pwd").value != passwordDoubleCheck.value){
			passwordDoubleMsg.innerHTML = "비밀번호가 일치하지 않습니다.";
			passwordDoubleMsg.style.color = 'red';
		}else{
			passwordDoubleMsg.innerHTML = "비밀번호가 일치합니다.";
			passwordDoubleMsg.style.color = 'green';
		}
	}else{
		passwordDoubleMsg.innerHTML = "";
		passwordDoubleMsg.style.color = "";
	}
}
//비밀번호 재확인 검사 
function passwordDouble(passwordDoubleCheck){
	let passwordDoubleMsg = document.getElementById("passwordDoubleMsg");
	if(document.getElementById("passwordCheckMsg").innerHTML=="사용 가능한 비밀번호입니다." && passwordDoubleCheck.value!==''){
		if(document.getElementById("pwd").value != passwordDoubleCheck.value){
			passwordDoubleMsg.innerHTML = "비밀번호가 일치하지 않습니다.";
			passwordDoubleMsg.style.color = 'red';
		}else{
			passwordDoubleMsg.innerHTML = "비밀번호가 일치합니다.";
			passwordDoubleMsg.style.color = 'green';
		}
	}else{
		passwordDoubleMsg.innerHTML = "";
		passwordDoubleMsg.style.color = "";
	}
}
function formCheck(userType){
	if(document.getElementById('passwordCheckMsg').style.color !='green'){
		window.alert('유효한 비밀번호가 아닙니다.');
		return false;
	}else if(document.getElementById('passwordDoubleMsg').style.color !='green'){
		window.alert('비밀번호를 올바르게 입력해주세요.');
		return false;
	}else{
		document.pwdFind3.submit();
	}
}
</script>
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
  <form action="/pwdFind3" name="pwdFind3" method="post">
  <div class="group">
  	<input type="password" required id = "pwd" class="input" data-type="password" name = "userpwd" placeholder="새 비밀번호" oninput = "passwordCheck(this)" maxlength ="20">
  </div>
  <div class = "whiteSpace" id = "passwordCheckMsg"></div>
  <div class="group">
  	<input type="password" required id = "pwd2" class="input" data-type="password" placeholder="비밀번호 확인" oninput = "passwordDouble(this)" maxlength ="20">
  </div>
  <div class = "whiteSpace" id = "passwordDoubleMsg"></div>
  <div class="group">
    <input type="submit" class="btn1" value="비밀번호 재설정">
  </div>
  </form>
  </div>
</div>
</body>
</html>