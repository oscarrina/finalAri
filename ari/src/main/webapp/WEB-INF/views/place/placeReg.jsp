<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css/adminMainLayout.css">
<link rel="stylesheet" type="text/css" href="/css/placeRegMainLayout.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src ="/js/httpRequest.js"></script>
<style>
html{
	user-select: none;
}
</style>
<script>
//주소 api
var ranNum
    function find() {
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
                    document.getElementById("addr1").value = extraAddr;
                } else {
                    document.getElementById("addr1").value = '';
                }
                document.getElementById("addr1").value = addr;
                document.getElementById("addr2").focus();
            }
        }).open();
    }

var categoryForm = document.getElementById('typeForm');
var formType = "";
function clickCategory(div) {
    var categoryDiv = document.querySelectorAll('.containerHead div');
    formType = div.id;
    var divId = 'divId=' + formType;
    var form = document.querySelector('.typeForm')
    for (let i = 0; i < categoryDiv.length; i++) {
        categoryDiv[i].style.fontWeight = '';
    } 
    console.log(divId);
    div.style.fontWeight = "1000";
 
	sendRequest('getCategroyForm', divId , getCategroyForm , 'GET');
   
}
function getCategroyForm(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data = XHR.responseText;
			var categoryForm = document.querySelector('.typeForm');
			categoryForm.innerHTML = data;
			}
		}
}

window.onload=function(){
	sendRequest('getArea', null, showResult, 'GET');

}
function showResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data=XHR.responseXML;
			var spanTag = document.getElementById('sboxspan1');
			var str='';
			str='<select class="border" id="userarea" name="area"><option value = "0" selected disabled>사업지역을 선택하세요</option>';
			var areaList=data.getElementsByTagName('item');
			for(var i=0;i<areaList.length;i++){
				var area=areaList[i]; //studentList.item(i)
				var code=area.getElementsByTagName('code').item(0).firstChild.nodeValue;
				var name=area.getElementsByTagName('name').item(0).firstChild.nodeValue;

				str+='<option value="'+code+'">'+name+'</option>';
			}
			str+='</select>'
			spanTag.innerHTML=str;
		}
	}
}
function show2(){
	var code=document.getElementById('userarea').value;
	var url='https://apis.data.go.kr/B551011/KorService1/areaCode1?'
		+ 'serviceKey=9IwUjd%2FogvdB0LCIq4Khs%2FcCfCV%2BIg9rqUf8U5PcrM4lW0lXdpv%2BpQHMKcg7y7klSZJ7SpQcrgs3lAW%2BQA3waQ%3D%3D'
		+ '&areaCode='+code+'&numOfRows=20&pageNo=1&MobileOS=ETC&MobileApp=AppTest';
	sendRequest(url, null, showResult2, 'GET');
}
function showResult2(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data=XHR.responseXML;
			var spanTag=document.all.sboxspan2;
			var str='';
			str='<select class="border3" aria-label="Default select example" id="sbox2" name="sigungu">';
			var areaList=data.getElementsByTagName('item');
			for(var i=0;i<areaList.length;i++){
				var area=areaList[i]; //studentList.item(i)
				var code=area.getElementsByTagName('code').item(0).firstChild.nodeValue;
				var name=area.getElementsByTagName('name').item(0).firstChild.nodeValue;
				
				str+='<option value="'+code+'">'+name+'</option>';
			}
			str+='</select>'
			spanTag.innerHTML=str;
		}
	}
}
function formSubmit(){
	var addr = document.getElementById('addr1').value+' '+document.getElementById('addr2').value;
	var newHidden = document.createElement('input');
	var form = document.getElementById("placeForm");
	newHidden.setAttribute('type','hidden');
	newHidden.setAttribute('value',addr);
	document.getElementById("addrForm").innerHTML = '';
	
	document.getElementById("addrForm").append(newHidden);
	console.log('formType='+formType);
	
	switch(formType.toString()){
	case '1': form.setAttribute('action','attReg');form.setAttribute('method','post');break;
	case '2': form.setAttribute('action','foodReg');form.setAttribute('method','post');break;
	case '3': form.setAttribute('action','berthReg');form.setAttribute('method','post');;break;
	}
 	form.submit(); 
	
}
</script>
</head>
<body>
<div id="page-wrapper">
<%@ include file="../ceo/ceoHeader.jsp" %>
<div id="page-content-wrapper">
    <div class="container-fluid" id="content1">
     <div class="content">
     <br><br><br><br>
<div class = "container">
	<h1>등록하기</h1>	
	<div class = "containerHead">
		<div id="1" onclick = "clickCategory(this)">관광지</div>
		<div id="2" onclick = "clickCategory(this)">음식점</div>
		<div id="3" onclick = "clickCategory(this)">숙박</div>
	</div>
	<form name = "fm" id = "placeForm">
	<div class = "containerBody" >
		<div class="regcom">
			<div style = "margin-top: 20px;"><label>업장명</label></div><div><input type = "text" placeholder = "업장명" name = "infoName" required="required"></div>
			<div><label>사업자 등록번호</label></div><div><input type = "text" placeholder = "사업자등록번호" name = "userBN" required="required"></div>
			<div><label>전화</label></div><div><input type = "text" placeholder = "전화" name = "tel" required="required"></div>
			<div><label>사업지역</label></div><div><span id="sboxspan1" onchange="show2()"></span><span id="sboxspan2"></span></div>			
			<div><label>주소</label></div><input type = "hidden" id = "addr3">
			<span id = "addrForm"><div><input type="button" id= "findAddr" value="주소검색" onclick="find()"><input type = "text" id= "addr1" placeholder = "주소" required="required"></div>
			<div><label>상세주소</label></div><div><input type = "text" id= "addr2" placeholder = "상세주소" required="required"></div></span>
			<div><label>주차시설</label><input id = "parkCheck" type = "checkbox" name="parking" value = "1" ></div>
			<div><label>업장소개</label></div><div><textarea></textarea></div>
			<div ><label>업장이미지</label></div><div><input class="form-control" type="file" name="placeImg" id="placeImg" required="required"></div>
		</div>
		<div class = "regType">
			<div class = "typeForm" id = "typeForm" style = "margin-top: 20px; margin-left: 20px;">
			카테고리를 선택해주세요!
			</div>	
		</div>
	</div>
	</form>
</div>
    <%@include file="../ceo/ceoFooter.jsp" %>
</div>
</div>
</div>
</div>
</body>
</html>