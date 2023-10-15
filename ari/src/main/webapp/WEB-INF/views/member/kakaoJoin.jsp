<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = "/js/httpRequest.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
  //숫자만 입력되게하는 함수
    function onlynum(num){
    	let regexnum = /[^0-9]/g;
    	num.value = num.value.replace(/[^0-9]/g, '');
    }
  //sms 인증번호 api 호출 및 인증확인 버튼 생성
	function sendMsg(){
		let tel = document.getElementById("tel");
		let telCheck = document.getElementById("telCheck");
		telCheck.innerHTML = '';
		if(tel.value.length < 11){
			telCheck.innerHTML = '올바른 핸드폰 번호를 입력해 주세요';
			telCheck.style.color = 'red';
			return false;
		}else{
			var param = 'tel='+tel.value+'&type=1';
			sendRequest('/sendNum',param,sendMsg2,'POST');
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
</script>
</head>
<body>
<form name="kakaoJoin" action="kakaoJoin" method="post">
<div class="login-wrap">
  <div class="login-html">
  <a href="/"><img src="/img/logo.png" class="mainimg"></a>
  <div class="group">
  	<input type="text" name="username" class="input" placeholder="이름">
  </div>
  <div class="group">
  	<input type="text" required id="tel" class="input" name = "usertel" placeholder="휴대폰번호(-없이 숫자만 입력)" oninput="onlynum(this)" maxlength ="11">&nbsp;<input type="button" class="btn2" value="인증번호 받기" onclick = "sendMsg()">
  </div>
  <div class = "whiteSpace" id="telCheck"></div>
  <div class="group">
  	<input type="text" required id="anum" class="input" placeholder="인증번호" oninput = "onlynum(this)" maxlength = "6">&nbsp;<input type="hidden" id= "checkBtn" class="btn2" value="인증번호 확인" onclick = "numCheck(sendMsg2())">
  </div>
  <div class = "whiteSpace" id="anumCheck"></div>
  <div class="group">
  	<input type="text" id="addr1" name="useraddr1" class="input2" placeholder="우편번호" readonly >&nbsp;<input type="button" class="btn2" value="주소검색" onclick="findAddr()">
  </div>
  <div class="group">
  	<input type="text" id="addr2" name="useraddr2" class="input" placeholder="주소" readonly>
  </div>
  <div class="group">
  	<input type="text" id="addr3" name="useraddr3" class="input" placeholder="상세주소">
  </div>
  <div class = "whiteSpace"></div>
  <input type="hidden" name="userid" value="${userid }">
  <input type="hidden" name="usertoken" value="${userToken }">
  <div class="group">
    <input type="submit" class="btn1" value="회원가입">
  </div>
  </div>
 </div>
</form>
</body>
</html>