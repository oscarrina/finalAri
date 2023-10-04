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
.whiteSpace{
 height: 10px;	
 font-size: 13px;
}
</style>
<script src = "js/httpRequest.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	//주소 api
    function findAddr() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = '';
                var extraAddr = ''; 
                if (data.userSelectedType === 'R') {
                    addr = data.roadAddress;
                } else { 
                    addr = data.jibunAddress;
                }
                if(data.userSelectedType === 'R'){
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    document.getElementById("addr2").value = extraAddr;
                } else {
                    document.getElementById("addr2").value = '';
                }
                document.getElementById('addr1').value = data.zonecode;
                document.getElementById("addr2").value = addr;
                document.getElementById("addr3").focus();
            }
        }).open();
    }
	//id 유효성검사
	function idCheck(id){
		var idcheckMsg= document.getElementById("idCheckMsg");
		let reg = /^[A-Za-z0-9]{6,}$/;
		if(id.value != '') {
	         if(!reg.test(id.value)) {
	        	 idcheckMsg.innerHTML = '아이디는 6~12자, 영문 또는 숫자를 입력바랍니다.';
	        	 idcheckMsg.style.color = 'red';
			} else {
				idcheckMsg.innerHTML = "중복검사가 필요합니다.";
				idcheckMsg.style.color = "";
			}
	    }
	}
	//id중복검사 
	function idDouble(){
		var idvalue = document.getElementById("id").value;
		var param = 'id='+idvalue;
		sendRequest('idCheck',param,showResult,'GET')
	}
	function showResult(){
		if(XHR.readyState==4){
			if(XHR.status==200){
				var data = XHR.responseText;
				var idcheckMsg = document.getElementById("idCheckMsg");
				idcheckMsg.innerHTML = data;
			}
		}	
	}
    //비밀번호 유효성 검사 
	function passwordCheck(password) {	
		let passwordCheckMsg = document.getElementById("passwordCheckMsg");
	    let reg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,}$/;
	    if(password.value != '') {
	         if(!reg.test(pwd.value)||password.length < 8) {
				passwordCheckMsg.innerHTML = '비밀번호는 공백없이 8~12자리, 문자, 숫자, 특수문자로 구성하여야 합니다.';
				passwordCheckMsg.style.color = 'red';
			} else {
				passwordCheckMsg.innerHTML = "사용이 가능한 비밀번호입니다.";
				passwordCheckMsg.style.color = 'green';
			}
	    }
    }
	function passwordDouble(chk){
		let passwordDoubleMsg = document.getElementById("passwordDoubleMsg");
		if(document.getElementById("passwordCheckMsg").innerHTML=="사용이 가능한 비밀번호입니다."){
			if(document.getElementById("pwd").value != document.getElementById("pwd2").value){
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

</script>
</head>
<body>
<div class="login-wrap">
  <div class="login-html">
  <img src="img/logo.png" class="mainimg">
  <div class="group">
  	<input type="text" id="name" class="input" placeholder="이름">
  </div>
   <div class = "whiteSpace"></div>
  <div class="group">
  	<input type="text" id="id" class="input" placeholder="아이디" oninput = "idCheck(this)">&nbsp;<input type="button" class="btn2" value="중복확인" onclick="idDouble()">
  </div>
  <div class = "whiteSpace" id = "idCheckMsg"></div>
  <div class="group">
  	<input type="password" id="pwd" class="input" data-type="password" placeholder="비밀번호" oninput = "passwordCheck(this)">
  </div>
  <div class = "whiteSpace" id= "passwordCheckMsg"></div>
  <div class="group">
  	<input type="password" id="pwd2" class="input" data-type="password" placeholder="비밀번호 확인" oninput = "passwordDouble(this)">
  </div>
  <div class = "whiteSpace" id = "passwordDoubleMsg"></div>
  <div class="group">
  	<input type="text" id="email" class="input" placeholder="이메일">
  </div>
  <div class = "whiteSpace"></div>
  <div class="group">
  	<input type="text" id="tel" class="input" placeholder="휴대폰번호(숫자만 입력)">&nbsp;<input type="button" class="btn2" value="인증번호 받기">
  </div>
  <div class="group">
  	<input type="text" id="anum" class="input" placeholder="인증번호">
  </div>
  <div class = "whiteSpace"></div>
  <div class="group">
  	<input type="text" id="addr1" class="input2" placeholder="우편번호" readonly >&nbsp;<input type="button" class="btn2" value="주소검색" onclick="findAddr()">
  </div>
  <div class="group">
  	<input type="text" id="addr2" class="input" placeholder="주소" readonly>
  </div>
  <div class="group">
  	<input type="text" id="addr3" class="input" placeholder="상세주소">
  </div>
  <div class = "whiteSpace"></div>
  <div class="group">
    <input type="submit" class="btn1" value="회원가입">
  </div>
  </div>
 </div>

</body>
</html>