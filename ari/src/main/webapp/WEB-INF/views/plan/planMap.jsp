<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src ="/js/httpRequest.js"></script>
<style>
html{
	user-select: none;
}
.border3{
	border: 1px solid #4068A7;
	border-radius:15px;
	width:130px !important;
	padding-top: 3px !important;
	padding-bottom: 3px !important;	
	padding-right: 3px !important;	
	text-align: center;
}
.main{
 display:flex;
 margin-top: 150px;
}
.section{
	width:50%;
	height:500px;	
	display:flex;
	flex-direction: column;
}
#sectionBody{
	height: 80%;
	display:flex;
}
#sectionHead, #sectionFoot{
	margin: 10px auto;
	height: 10%;
}
.section .container1{
	width:25%;
	flex-direction: column;
	display:flex;
}
.container1 .containerHead{
	margin: 10px auto;
	height: 10%
}	
.container1 .containerBody{
	align-items: 5px;
	height:85%;
	flex-direction: column;
	margin: 0px auto;
	overflow: scroll;
}
.container1 .containerBody img{
	margin-top: 10px;
}
.container1 .containerBody .img{
	width: 80px;
	height: 80px;
	border-radius: 10px;
}
.container2{
	width:75%;
}
.container2 .containerHead{
	display: flex;
	height:10%;
	margin-bottom: 10px;
}
.container2 .containerHead div{
	margin-top:5px;
	width:33.333%;
	text-align:center;
	font-size: 20px;
	cursor: pointer;
}
.container2 .containerHead div:active{
	background-color: #38B6FF
}
.arrow{
	width: 80px;
	height: 30px;
	border-radius: 10p x;
	background-color:transparent;
}

.container2 .containerHead div:hover{
	background: #CCCCFF;
}

.container2 .containerHead #att{
	border-top-left-radius: 10px;
}

.container2 .containerHead #berth{
	border-top-right-radius: 10px;
}
.container2 .containerBody{
	height : 85%;
	overflow: scroll;
	border-bottom-right-radius: 10px;
	border-bottom-left-radius: 10px;
}
.placeButton{
	cursor: pointer;
	padding-bottom: 10px;
	
}
.placeButton:hover{
	background-color: #f1f3f5;
}
.container2 .containerBody .img{
	margin-top: 10px;
	margin-left: 10px;
	width: 100px;
	height: 100px;
	border-radius: 10px;
}
.aside{
	width:48%;
	height:500px;
	margin-left: 2%
}
#map{
	height:500px;
	border-radius:20px; 	
}
.btn1{
  border:none;
  padding:15px 20px;
  border-radius:25px;
  background:#253BFF;
  width: 350px;
  color: #fff;
  cursor: pointer;
}
.btn1:hover{
 	background-color: #38B6FF;
}

</style>
<script>
var sigungu = '';
var addr = '강원도 원주시';
var planDay = '1';
var category=0;
window.onload = function() {
	var code = ${area};
	document.getElementById(planDay).style.display="block";
	var url='https://apis.data.go.kr/B551011/KorService1/areaCode1?'
		+ 'serviceKey=9IwUjd%2FogvdB0LCIq4Khs%2FcCfCV%2BIg9rqUf8U5PcrM4lW0lXdpv%2BpQHMKcg7y7klSZJ7SpQcrgs3lAW%2BQA3waQ%3D%3D'
		+ '&areaCode='+code+'&numOfRows=20&pageNo=1&MobileOS=ETC&MobileApp=AppTest';
	sendRequest(url, null, showResult, 'GET');
}
function showResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data=XHR.responseXML;
			var spanTag=document.getElementById('sigunguSelect');
			var str='';
			str='<select class="border3" aria-label="Default select example" id="sbox2" name="sigungu" onchange = "listSet()">';
			var areaList=data.getElementsByTagName('item');
			for(var i=0;i<areaList.length;i++){
				var area=areaList[i]; //studentList.item(i)
				var code=area.getElementsByTagName('code').item(0).firstChild.nodeValue;
				var name=area.getElementsByTagName('name').item(0).firstChild.nodeValue;

				str+='<option value="'+code+'">'+name+'</option>';
			}
			str+='</select>';
			spanTag.innerHTML=str;
		}
	}
}
function categoryButton(category) {
    var categoryDivs = document.querySelectorAll('.container2 .containerHead div');
    for (var i = 0; i < categoryDivs.length; i++) {
        categoryDivs[i].style.backgroundColor  = '';
    }
    var clickedButton = document.getElementById(category);
    clickedButton.style.backgroundColor = "#38B6FF";
    listSet();
}
/**장소 리스트 출력해주는 함수*/
function  listSet(){
	var dateRange = ${dateRange};
	var area = ${area};
	var sigungu = document.getElementById('sbox2').value;
	var categoryButtons = document.getElementsByClassName("categoryButton");
	console.log(categoryButtons[0].id);
	console.log(categoryButtons[0].style.backgroundColor);
	for(var i = 0 ; i < 3; i++){
		if(categoryButtons[i].style.backgroundColor == 'rgb(56, 182, 255)'){
			category = categoryButtons[i].id;
			console.log(category);
		}
	}
	console.log(category);
	var url = 'listSet?dateRange='+${dateRange}+'&area='+${area}+'&sigungu='+sigungu+'&type='+category;
	sendRequest(url, null, categoryOk, 'GET');
}
function categoryOk(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data = XHR.response;
			var container = document.getElementById("containerBody2");
			if(XHR.status == null){
				container.innerHTML = '검색결과가 없습니다.';
			}else{
				container.innerHTML = data;
			}
		}
	}
}
function replace(select){
	var daySelcetValue = select.value;
	planDay = daySelcetValue;
	
	var daySelectDivsList = document.getElementsByClassName("dayPlanDivs")
	for(var i = 0 ; i< daySelectDivsList.length; i++ ){
		daySelectDivsList[i].style.display="none";
	}
	document.getElementById(planDay).style.display="block";
}
function insertPlanner(div){
	var imgContent = div.firstChild.src;
	var addr = div.lastChild.id;
	var infoNameInput = div.lastChild.innerHTML;
	var contentList = document.getElementById(planDay);
	var contentListHTML = document.getElementById(planDay).innerHTML;
	console.log(div.lastChild.id);
	console.log(imgContent);
	var str = '<div><img class="img" src='+imgContent+' alt="Image"></div>';
	var planDayInput = '<input type= "hidden" value = "'+planDay+'" name = "planDayInput" >';
	var infoName = '<input type= "hidden" value = "'+infoNameInput+'" name = "infoNameInput" >';
	var arrow = '<div><img class="arrow" src="/img/planArrow.png"</div>';
	var img = '<input type= "hidden" value = "'+imgContent+'" name = "infoImg" >';
		if(category == 'att'){
			var type = '<input type= "hidden" value = "1" name = "type" >';
		}else if(category == 'food'){
			var type = '<input type= "hidden" value = "2" name = "type" >';
		}else if(category == 'berth'){
			var type = '<input type= "hidden" value = "3" name = "type" >';
		}
	if(contentListHTML == ''){
		contentList.innerHTML = contentListHTML+planDayInput+str+type+img+infoName;
	}else{
		contentList.innerHTML = contentListHTML+planDayInput+arrow+str+type+img+infoName;
	}
	var url = 'replaceMap?addr='+addr;
	sendRequest(url, null, replaceMap, 'GET');
}
function replaceMap(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data = XHR.responseText;
			addr = data;
			var script = document.createElement('script');
            script.type = 'text/javascript';
            script.src = '/js/mapModule.js';
            document.getElementById('mapScript').innerHTML = ''; 
            document.getElementById('mapScript').appendChild(script);
		}
	}
}
</script>
</head>
<body>
<%@include file="/WEB-INF/views/header.jsp" %>
<form action="createPlan" method="post">
<input type ="hidden" value = "${area}" name = "area">
<input type ="hidden" value = "${dateRange}" name = "dateRange">
<input type ="hidden" value = "${start}" name = "start">
<input type ="hidden" value = "${end}" name = "end">
<main class = "main">
	<section class= "section">	
		<div id = "sectionHead">
			<label>동네 고르기</label><span id = "sigunguSelect"></span>
		</div>
		<div id="sectionBody">
			<div class = "container1">
				<div class= "containerHead">
				<select id = "daySelect" onchange = "replace(this)" class = "border3">
					<c:forEach begin="1" end="${dateRange}" step="1" var="i" >
						<option value = "${i}">${i}일차</option>
					</c:forEach>
				</select>
				</div>
				<div class="containerBody" id = "containerBody">
				<c:forEach begin="1" end="${dateRange}" step="1" var="i">
					<div class = "dayPlanDivs" id = "${i}" style = "display:none;"></div>
				</c:forEach>
				</div>
			</div>
			<div class= "container2">
				<div class="containerHead">
					<div class = "categoryButton" id = "att" onclick="categoryButton('att')">관광지</div>
					<div class = "categoryButton" id = "food" onclick="categoryButton('food')">음식점</div>
					<div class = "categoryButton" id = "berth" onclick="categoryButton('berth')">숙박</div>
				</div>
				<div class="containerBody" id = "containerBody2">
				</div>
			</div>
		</div>
		<div id ="sectionFoot">
			<input type="submit" class="btn1" value="일정생성">
		</div>
	</section>
	<aside class="aside">
	<div id="map"></div>	
	</aside>
</main>
</form>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b0c2f3bf1af4d2d44e3625839faf78f3&libraries=services"></script>
<div id= "mapScript"><script type="text/javascript" src="/js/mapModule.js"></script></div>
</body>
<%@include file="/WEB-INF/views/footer.jsp" %>
</html>