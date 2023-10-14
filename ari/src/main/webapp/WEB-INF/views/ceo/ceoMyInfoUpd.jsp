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
	
	//지역 셀렉트 박스 생성
	window.onload=function(){
		sendRequest('getArea', null, showResult, 'GET');
	}
	function showResult(){
		if(XHR.readyState==4){
			if(XHR.status==200){
				var data=XHR.responseXML;
				var divTag = document.getElementById('sidoList');
				var uarea=<c:out value="${dto.userarea}" />;
				var str='';
				str='<select class="border" id="userarea" name="userarea">';
				var areaList=data.getElementsByTagName('item');
				for(var i=0;i<areaList.length;i++){
					var area=areaList[i]; //studentList.item(i)
					var code=area.getElementsByTagName('code').item(0).firstChild.nodeValue;
					var name=area.getElementsByTagName('name').item(0).firstChild.nodeValue;
					
					if(code==uarea){
						str+='<option value="'+code+'" selected>'+name+'</option>';
					}else{
						str+='<option value="'+code+'">'+name+'</option>';
					}
				}
				str+='</select>'
				divTag.innerHTML=str;
			}
		}
	}
  
	function formCheck(userType){
		if(document.getElementById('addr1').innerHTML == null){
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
			document.ceoUpd.submit();
		}
	}
</script>
</head>
<body>
<form name="ceoUpd" action="ceoUpd" method="post">

<div class="login-wrap">
  <div class="login-html">
  <a href="/"><img src="img/logo.png" class="mainimg"></a>
   	<div class="group">
	   <input type="text" value="${dto.userbn }" readonly="readonly" id="userbn" class="input" name = "userbn" placeholder="사업자번호(-없이 숫자만 입력)" oninput="onlynum(this)" maxlength ="10">
	 </div>
  <div class="group">
  <input type="text" value="${dto.userid }" readonly="readonly" id = "userid" class="input" name = "userid" placeholder="아이디" oninput = "idCheck(this)" maxlength ="10">
  </div>
  <div class = "whiteSpace" id = "idCheckMsg"></div>
  <div class="group">
  	<input type="text" value="${dto.usertel }" readonly="readonly" id="tel" class="input" name = "usertel" placeholder="휴대폰번호(-없이 숫자만 입력)" oninput="onlynum(this)" maxlength ="11">
  </div>
  <div class = "whiteSpace" id="telCheck"></div>
   <div class="group">
  	<input type="text" value="${dto.username }" required id="name" class="input" name = "username" placeholder="이름">
  </div>
   <div class = "whiteSpace"></div>
   <div class="group" id="sidoList"></div>
	<div class = "whiteSpace"></div> 
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
  	 <input type="button" class="btn3" value="취소" onclick = "location.href='ceoUpdForm'">
    <input type="button" class="btn1" value="정보수정" onclick = "formCheck()">
  </div>
  </div>
 </div>
 </form>
</body>
</html>