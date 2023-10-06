<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = "js/httpRequest.js"></script>
<script>
	var arrArea = [1,2,3,4,5,6,7,8,31,32,33,34,35,36,37,38,39];
	var arrSigungu = [];
	var arrContentId = [];
	var arrInfoName = [];
	var arrImg = [];
	var arrTel = [];
	
	var jsFoodObject = new Object();
function areaimport(){
	for(let i = 0 ; i < arrArea.length ; i++){	
		console.log(arrArea[i]);
		var foodSigunguUrl='https://apis.data.go.kr/B551011/KorService1/areaCode1?'
			+ 'serviceKey=9IwUjd%2FogvdB0LCIq4Khs%2FcCfCV%2BIg9rqUf8U5PcrM4lW0lXdpv%2BpQHMKcg7y7klSZJ7SpQcrgs3lAW%2BQA3waQ%3D%3D'
			+ '&areaCode='+arrArea[i]+'&numOfRows=20&pageNo=1&MobileOS=ETC&MobileApp=AppTest';
		sendRequest(foodSigunguUrl, null, sigunguImport, 'GET');
		
		for(let j = 0; j<arrSigungu.length; j++){
			var foodContentUrl = 'https://apis.data.go.kr/B551011/KorService1/areaBasedList1?'
					+'serviceKey=9IwUjd%2FogvdB0LCIq4Khs%2FcCfCV%2BIg9rqUf8U5PcrM4lW0lXdpv%2BpQHMKcg7y7klSZJ7SpQcrgs3lAW%2BQA3waQ%3D%3D&'
					+'numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=AppTest&_type=xml&listYN=Y&arrange=Q&contentTypeId=39'
					+'&areaCode='+arrArea[i]+'&sigunguCode='+arrSigungu[j];
			sendRequest(foodContentUrl, null, contentImport, 'GET');	
			for(let k = 0 ; k < 10; k++){
				jsFoodObject.area = arrArea[i];
				jsFoodObject.foodSigungu = arrSigungu[j];
				jsFoodObject.foodInfoName = arrInfoName[i];
				jsFoodObject.foodImg = arrImg[i];
				jsFoodObject.foodTel = arrTel[i];
				
				var foodDetailUrl = 'https://apis.data.go.kr/B551011/KorService1/detailIntro1?'
						+'serviceKey=9IwUjd%2FogvdB0LCIq4Khs%2FcCfCV%2BIg9rqUf8U5PcrM4lW0lXdpv%2BpQHMKcg7y7klSZJ7SpQcrgs3lAW%2BQA3waQ%3D%3D&MobileOS=ETC&MobileApp=AppTest&_type=xml&'
						+'contentId='+arrContentId[k]+'&contentTypeId=39&numOfRows=10&pageNo=1'
				sendRequest(foodDetailUrl, null, detailImport, 'GET');
				
				var foodInfoUrl = 'https://apis.data.go.kr/B551011/KorService1/detailCommon1?'
						+'serviceKey=9IwUjd%2FogvdB0LCIq4Khs%2FcCfCV%2BIg9rqUf8U5PcrM4lW0lXdpv%'
						+'2BpQHMKcg7y7klSZJ7SpQcrgs3lAW%2BQA3waQ%3D%3D&MobileOS=ETC&MobileApp=AppTest&_type=xml&'
						+'contentId='+arrContentId[k]+'&contentTypeId=39&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&numOfRows=10&pageNo=1' 
				sendRequest(foodInfoUrl, null, InfoImport, 'GET');
			}
		}
	}
	console.log(jsFoodObject);
}
function sigunguImport(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data=XHR.responseXML;
			var arr = data.getElementsByTagName('item');
			for(var i=0;i<arr.length;i++){
				var area=arr[i];
				arrSigungu[i] = area.getElementsByTagName('name').item(0).firstChild.nodeValue;
			}
		}
	}
}
function contentImport(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data = XHR.reponseXML;
			var arrContentId = data.getElementsByTagName('contentid');
			var arrInfoName = data.getElementsByTagName('title');
			var arrImg = data.getElementsByTagName('item');
			var arrTel = data.getElementsByTagName('firstimage');
		}
	}
}
function detailImport(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data = XHR.reponseXML;
			jsFoodObject.foodMenu = data.getElementsByTagName('treatmenu');
			jsFoodObject.foodOpen = data.getElementsByTagName('opentimefood');
			jsFoodObject.foodClose = data.getElementsByTagName('restdatefood');
			jsFoodObject.foodparking = data.getElementsByTagName('parkingfood');
		}
	}
}
function InfoImport(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			jsFoodObject.foodInfo = data.getElementsByTagName('overview');
		}
	}
}
</script>
</head>
<body>
	<input type = "button" value = "데이터넣기" onclick="areaimport()">
</body>
</html>