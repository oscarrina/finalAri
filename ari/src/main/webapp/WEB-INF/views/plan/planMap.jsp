<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src ="/js/httpRequest.js"></script>
<link rel="stylesheet" type="text/css" href="/css/planMainLayout.css">
<style>
html{
	user-select: none;
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
	margin-top: 10px;
	margin-left: 10px;
	height: 10%
}	
.container1 .containerBody{
	align-items: 5px;
	width:
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
.container1 .hr{
	background-color: blue;
	height: 5px;
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
#categoryButton1{
	border-top-left-radius: 10px;
}
#categoryButton3{
	border-top-right-radius: 10px;
}
.container2 .containerBody{
	height : 85%;
	overflow: scroll;
	border-bottom-right-radius: 10px;
	border-bottom-left-radius: 10px;
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
var addr = '';
window.onload = function() {
	var code = ${area};
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
    var categoryDivs = document.querySelectorAll('.containerHead div');
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
	var category='';
	var categoryButtons = document.getElementsByClassName("categoryButton");
	console.log(categoryButtons[0].id);
	console.log(categoryButtons[0].style.backgroundColor);
	for(var i = 0 ; i < categoryButtons.length; i++){
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
			container.innerHTML = '';
			container.innerHTML = data;
		}
	}
}
function insertPlanner(img){
	var str = '<img class="img" src='+img+' alt="Image">';
	var arrow = '<img class="arrow" src="/img/planArrow.png">';
	if(document.getElementById("containerBody").Child == null){
		document.getElementById("containerBody").appendChild(str);
	}else{
		document.getElementById("containerBody").appendChild(arrow+str);
	}
}
</script>
</head>
<body>
<%@include file="/WEB-INF/views/header.jsp" %>
<main class = "main">
	<section class= "section">
		<div id = "sectionHead">
			<label>동네 고르기</label><span id = "sigunguSelect"></span>
		</div>
		<div id="sectionBody">
			<div class = "container1">
				<div class= "containerHead">
				<select>
					<c:forEach begin="1" end="${dateRange}" step="1" var="i" >
						<option>${i}일차</option>
					</c:forEach>
				</select>
				</div>
				<div class="containerBody" id = "containerBody">
					
				</div>
			</div>
			<div class= "container2">
				<div class="containerHead">
					<div class = "categoryButton" id = "1" onclick="categoryButton(1)">관광지</div>
					<div class = "categoryButton" id = "2" onclick="categoryButton(2)">음식점</div>
					<div class = "categoryButton" id = "3" onclick="categoryButton(3)">숙박</div>
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
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b0c2f3bf1af4d2d44e3625839faf78f3&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 4 // 지도의 확대 레벨
};  

//지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

//주소로 좌표를 검색합니다
geocoder.addressSearch('대한민국', function(result, status) {

// 정상적으로 검색이 완료됐으면 
 if (status === kakao.maps.services.Status.OK) {

    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

    // 결과값으로 받은 위치를 마커로 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: coords
    });

    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    map.setCenter(coords);
} 
});    
</script>
</body>
<%@include file="/WEB-INF/views/footer.jsp" %>
</html>