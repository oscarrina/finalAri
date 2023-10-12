<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src ="/js/httpRequest.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
html{
	user-select: none;
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
.border{
  border:2px solid #253BFF;
  padding:15px 5px;
  border-radius:25px;
  background:rgba(255,255,255,.1);
  margin-top: 20px;
  width: 300px;
  appearance: none; 
}
label{
	font-size: 13px;
}
select{
	padding: 15px;
}
</style>
<script>
	//주소 api
	var ranNum
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
		let regexId = /(?=.*\d)(?=.*[a-zA-ZS]).{6,10}/;
		if(id.value != '') {
	         if(!regexId.test(id.value)) {
	        	 idcheckMsg.innerHTML = '아이디는 6~10자 이상, 영문 또는 숫자를 포함해야 합니다.';
	        	 idcheckMsg.style.color = 'red';
			} else {
				idcheckMsg.innerHTML = "중복검사가 필요합니다.";
				idcheckMsg.style.color = "";
			}
	    }
	}
	//id중복검사 
	function idDouble(){
		var idvalue = document.getElementById("userid").value;
		var param = 'userid='+idvalue;
		var idcheckMsg = document.getElementById("idCheckMsg");
		let regexId = /(?=.*\d)(?=.*[a-zA-ZS]).{6,10}/;
		if(!regexId.test(idvalue)){
			idcheckMsg.innerHTML = '올바르지 않은 형식의 아이디 입니다.';
			idcheckMsg.style.color = 'red'
			return false;
		}else{
			sendRequest('idCheck',param,idDoubleResult,'GET');
		}
	}
	function idDoubleResult(){
		if(XHR.readyState==4){
			if(XHR.status==200){
				var data = XHR.responseText;
				var idcheckMsg = document.getElementById("idCheckMsg");
				idcheckMsg.innerHTML = data;
				let color = data=="중복된 아이디 입니다."?'red':'green';
				idcheckMsg.style.color=color;
			}
		}
	}
	//사업자 번호 중복검사 
	function bnDouble(){
		var bnvalue = document.getElementById("userbn").value;
		var bncheckMsg = document.getElementById("bnCheckMsg");
		var param = 'userbn='+bnvalue;
		if(bnvalue.length<10){
			bnCheckMsg.innerHTML = "사업자번호는 10자입니다."
			bncheckMsg.style.color = "red";
		}else{
			sendRequest('bnCheck',param,bnDoubleResult,'GET');
		}
	}
	function bnDoubleResult(){
		if(XHR.readyState==4){
			if(XHR.status==200){
				var data = XHR.responseText;
				var bncheckMsg = document.getElementById("bnCheckMsg");
				bncheckMsg.innerHTML = data;
				let color = data=="이미 존재하는 번호 입니다."?'red':'green';
				bncheckMsg.style.color=color;
			}
		}	
	}
	//지역 셀렉트 박스 생성
	window.onload=function(){
		if(${userType}==1){
			return false;
		}else{
			sendRequest('getArea', null, showResult, 'GET');
		}
	}
	function showResult(){
		if(XHR.readyState==4){
			if(XHR.status==200){
				var data=XHR.responseXML;
				var divTag = document.getElementById('sidoList');
				var str='';
				str='<select class="border" id="userarea" name="userarea"><option value = "0" selected disabled>사업지역을 선택하세요</option>';
				var areaList=data.getElementsByTagName('item');
				for(var i=0;i<areaList.length;i++){
					var area=areaList[i]; //studentList.item(i)
					var code=area.getElementsByTagName('code').item(0).firstChild.nodeValue;
					var name=area.getElementsByTagName('name').item(0).firstChild.nodeValue;
	
					str+='<option value="'+code+'">'+name+'</option>';
				}
				str+='</select>'
				divTag.innerHTML=str;
			}
		}
	}
    //비밀번호 유효성 검사 
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
		}else if(userType != 1 && document.getElementById('bnCheckMsg').style.color != 'green'){
			window.alert('이미 가입된 사업자 번호입니다.');
			return false;
		}else if(document.getElementById('passwordCheckMsg').style.color !='green'){
			window.alert('유효한 비밀번호가 아닙니다.');
			return false;
		}else if(document.getElementById('passwordDoubleMsg').style.color !='green'){
			window.alert('비밀번호를 올바르게 입력해주세요.');
			return false;
		}else if(document.getElementById('anumCheck').style.color !='green'){
			window.alert('핸드폰 번호로 본인인증을 완료해주세요.');
			return false;
		}else if(document.getElementById('addr1').innerHTML == null){
			window.alert('우편번호를 입력해 주세요');
			return false;
		}else if(document.getElementById('addr2').innerHTML == null){
			window.alert('주소를 입력해 주세요');
			return false;
		}else if(document.getElementById('addr3').innerHTML == null){
			window.alert('상세주소를 입력해 주세요');
			return false;
		}else if(document.getElementsByName("userarea").value==0){
			window.alert('사업지역을 선택해주세요');
			return false;
		}else{
			document.memberJoin.submit();
		}
	}
</script>
</head>
<body>
<form name="memberJoin" action="memberJoin" method="post">
<input type = "hidden" name = "usertype" value="${userType}">
<div class="login-wrap">
  <div class="login-html">
  <a href="/"><img src="img/logo.png" class="mainimg"></a>
  <div class="group">
  	<input type="text" id="name" class="input" name = "username" placeholder="이름">
  </div>
   <div class = "whiteSpace"></div>
   <c:choose>
    <c:when test="${userType == 1}">
		<input type = "hidden" name = "userbn" value ="1">
		<input type = "hidden" name = "userarea" value ="99">
   	</c:when>
   	<c:when test="${userType == 2}">
   		<div class="group">
	   	<input type="text" required id="userbn" class="input" name = "userbn" placeholder="사업자번호(-없이 숫자만 입력)" oninput="onlynum(this)" maxlength ="10">&nbsp;<input type="button" class="btn2" value="중복확인" onclick="bnDouble()">
	   	</div>
	   	<div class = "whiteSpace" id = "bnCheckMsg"></div> 
	   	<div class="group" id="sidoList"></div>
	   	<div class = "whiteSpace"></div> 
   	</c:when>
   </c:choose>
  <div class="group">
  <input type="text" required id = "userid" class="input" name = "userid" placeholder="아이디" oninput = "idCheck(this)" maxlength ="10">&nbsp;<input type="button" class="btn2" value="중복확인" onclick="idDouble()">
  </div>
  <div class = "whiteSpace" id = "idCheckMsg"></div>
  <div class="group">
  	<input type="password" required id = "pwd" class="input" data-type="password" name = "userpwd" placeholder="비밀번호" oninput = "passwordCheck(this)" maxlength ="20">
  </div>
  <div class = "whiteSpace" id = "passwordCheckMsg"></div>
  <div class="group">
  	<input type="password" required id = "pwd2" class="input" data-type="password" placeholder="비밀번호 확인" oninput = "passwordDouble(this)" maxlength ="20">
  </div>
  <div class = "whiteSpace" id = "passwordDoubleMsg"></div>
  <div class="group">
  	<input type="text" required id="tel" class="input" name = "usertel" placeholder="휴대폰번호(-없이 숫자만 입력)" oninput="onlynum(this)" maxlength ="11">&nbsp;<input type="button" class="btn2" value="인증번호 받기" onclick = "sendMsg()">
  </div>
  <div class = "whiteSpace" id="telCheck"></div>
  <div class="group">
  	<input type="text" required id="anum" class="input" placeholder="인증번호" oninput = "onlynum(this)" maxlength = "6">&nbsp;<input type="hidden" id= "checkBtn" class="btn2" value="인증번호 확인" onclick = "numCheck(sendMsg2())">
  </div>
  <div class = "whiteSpace" id="anumCheck"></div>
  <div class="group">
  	<input type="text" required id="addr1" class="input2" name = "useraddr1" placeholder="우편번호" readonly >&nbsp;<input type="button" class="btn2" value="주소검색" onclick="findAddr()">
  </div>
  <div class="group">
  	<input type="text" required id="addr2" class="input" name = "useraddr2" placeholder="주소" readonly>
  </div>
  <div class="group">
  	<input type="text" required id="addr3" class="input" name = "useraddr3" placeholder="상세주소">
  </div>
  <div class = "whiteSpace"></div>
  <div class="group">
    <input type="button" class="btn1" value="회원가입" onclick = "formCheck(${userType})">
  </div>
  </div>
 </div>
 </form>
</body>
</html>