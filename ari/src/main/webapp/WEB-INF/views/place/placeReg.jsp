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
<script src ="/js/httpRequest.js"></script>
<style>
html{
	user-select: none;
}
</style>
<script>
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

var categoryForm = document.getElementById('typeForm');
function clickCategory(div) {
    var categoryDiv = document.querySelectorAll('.containerHead div');
    var divId = 'divId='+div.id;
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
			var spanTag=document.all.sboxspan1;
			var uarea='<c:out value="${area}" />';
			var str='';
			str='<select class="border3" aria-label="Default select example" id="sbox1" name="area">';
			var areaList=data.getElementsByTagName('item');
			for(var i=0;i<areaList.length;i++){
				var area=areaList[i]; //studentList.item(i)
				var code=area.getElementsByTagName('code').item(0).firstChild.nodeValue;
				var name=area.getElementsByTagName('name').item(0).firstChild.nodeValue;
				if(code==uarea){
					str+='<option value="'+code+'" selected>'+name+'</option>';
				}
			}
			str+='</select>'
			spanTag.innerHTML=str;
			show2();
		}
	}
}
function show2(){
	var code=document.all.sbox1.value;
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
			str='<select class="border3" aria-label="Default select example" id="sbox2" name="festsigungu">';
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
	<form>
	<div class = "containerBody" >
		<div class="regcom">
			<div class = "label" style = "margin-top: 20px;"><label>업장명</label></div><div><input type = "text" placeholder = "업장명"></div>
			<div class = "label" ><label>사업자 등록번호</label></div><div><input type = "text" placeholder = "업장명"></div>
			<div class = "label" ><label>전화</label></div><div><input type = "text" placeholder = "업장명"></div>
			<div class = "label" ><label>사업지역</label></div><div><span id="sboxspan1"></span><span id="sboxspan2"></span></div>			
			<div class = "label" ><label>주소</label></div>
			<div><input type="button" id= "findAddr" value="주소검색" onclick="findAddr()"><input type = "text" id= "arr1" placeholder = "주소" readonly></div>
			<div class = "label" ><label>상세주소</label></div><div><input type = "text" placeholder = "업장명"></div>
			<div class = "label" ><label>주차시설</label><input id = "parkCheck" type = "checkbox" placeholder = "업장명"></div>
			<div class = "label" ><label>업장소개</label></div><div><textarea></textarea></div>
			<div class = "label" ><label>업장이미지</label></div><div><input class="form-control" type="file" name="placeImg" id="placeImg" required="required"></div>
		</div>
		<div class = "regType">
			<div class = "typeForm" id = "typeForm" style = "margin-top: 20px;margin-left: 20px;">
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