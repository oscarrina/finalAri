<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
</script>
</head>
<body>
<form name="kakaoJoin" action="kakaoJoin" method="post">
<div class="login-wrap">
  <div class="login-html">
  <img src="/img/logo.png" class="mainimg">
  <div class="group">
  	<input type="text" name="username" class="input" placeholder="이름">
  </div>
   <div class = "whiteSpace"></div>
  <div class="group">
  	<input type="text" name="usertel" class="input" placeholder="휴대폰번호(숫자만 입력)">&nbsp;<input type="button" class="btn2" value="인증번호 받기">
  </div>
  <div class="group">
  	<input type="text" name="anum" class="input" placeholder="인증번호">
  </div>
  <div class = "whiteSpace"></div>
  <div class="group">
  	<input type="text" id="addr1" name="addr1" class="input2" placeholder="우편번호" readonly >&nbsp;<input type="button" class="btn2" value="주소검색" onclick="findAddr()">
  </div>
  <div class="group">
  	<input type="text" id="addr2" name="addr2" class="input" placeholder="주소" readonly>
  </div>
  <div class="group">
  	<input type="text" id="addr3" name="addr3" class="input" placeholder="상세주소">
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