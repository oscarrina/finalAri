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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
  width: 170px;
  color: #fff;
  cursor: pointer;
  margin-bottom: 30px;
}
.btn1:hover{
  background-color: #38B6FF;
}
.btn3{
  border:none;
  padding:15px 20px;
  border-radius:25px;
  background:#38B6FF;
  margin-top: 20px;
  width: 170px;
  color: #fff;
  cursor: pointer;
}
.btn3:hover{
  background-color: #9ADAFF;
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
   
	
	function formCheck(){
		if(document.getElementById('addr1').innerHTML == null){
			window.alert('우편번호를 입력해 주세요');
			return false;
		}else if(document.getElementById('addr2').innerHTML == null){
			window.alert('주소를 입력해 주세요');
			return false;
		}else if(document.getElementById('addr3').innerHTML == null){
			window.alert('상세주소를 입력해 주세요');
			return false;
		}else {
			document.userUpd.submit();
		}
	}
</script>
</head>
<body>
<form name="userUpd" action="userUpd" method="post">
<div class="login-wrap">
  <div class="login-html">
  <a href="/"><img src="img/logo.png" class="mainimg"></a>
  
  <div class="group">
  <input type="text" value="${dto.userid }" readonly="readonly" id = "userid" class="input" name = "userid" placeholder="아이디" maxlength ="10">
  </div>
   <div class="group">
  	<input type="text" value="${dto.usertel}" readonly="readonly" id="tel" class="input" name = "usertel" placeholder="휴대폰번호(-없이 숫자만 입력)" oninput="onlynum(this)" maxlength ="11">
  </div>
  <div class="group">
  	<input type="text" value="${dto.username}" required id="name" class="input" name = "username" placeholder="이름">
  </div>
  <div class="group">
  	<input type="password" style="width:100px;" readonly="readonly" id = "pwd" class="input" data-type="password" placeholder="비밀번호" maxlength ="20">
  	<input type="button" style="width:200px;" class="btn2" value="비밀번호 재설정 이동" onclick="location.href='pwdFind2'">
  </div>
 
  <div class="group">
  	<input type="text" value="${dto.useraddr1 }" required id="addr1" class="input2" name = "useraddr1" placeholder="우편번호" readonly >&nbsp;<input type="button" class="btn2" value="주소검색" onclick="findAddr()">
  </div>
  <div class="group">
  	<input type="text" value="${dto.useraddr2 }" required id="addr2" class="input" name = "useraddr2" placeholder="주소" readonly>
  </div>
  <div class="group">
  	<input type="text" value="${dto.useraddr3 }" required id="addr3" class="input" name = "useraddr3" placeholder="상세주소">
  </div>
  <div class = "whiteSpace"></div>
  <div class="group">
  	 <input type="button" class="btn3" value="취소" onclick = "location.href='myInfo'">
    <input type="button" class="btn1" value="정보수정" onclick = "formCheck()">
  </div>
  </div>
 </div>
 </form>
</body>
</html>