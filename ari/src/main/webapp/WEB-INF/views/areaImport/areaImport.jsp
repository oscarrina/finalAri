<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = "js/httpRequest.js"></script>
<script>
// 	var arrArea = [1,2,3,4,5,6,7,8,31,32,33,34,35,36,37,38,39];
// 	var arrSigungu = []
// 	var arraySidoNum = -1;  
// 	var arraySigunguNum = -1;
// 	var jsFoodObject = new Array();
// 	var object = new Object();
// function areaImport(){
// 	arraySidoNum++
// 	var foodSigunguUrl='https://apis.data.go.kr/B551011/KorService1/areaCode1?serviceKey=9IwUjd%2FogvdB0LCIq4Khs%2FcCfCV%2BIg9rqUf8U5PcrM4lW0lXdpv%2BpQHMKcg7y7klSZJ7SpQcrgs3lAW%2BQA3waQ%3D%3D&numOfRows=50&pageNo=1&MobileOS=ETC&MobileApp=AppTest&areaCode='+arrArea[arraySidoNum]+'&_type=xml';
// 	sendRequest(foodSigunguUrl, null, sigunguImport, 'GET');
//  }
// /*			var foodContentUrl = 'https://apis.data.go.kr/B551011/KorService1/areaBasedList1?'
// 					+'serviceKey=9IwUjd%2FogvdB0LCIq4Khs%2FcCfCV%2BIg9rqUf8U5PcrM4lW0lXdpv%2BpQHMKcg7y7klSZJ7SpQcrgs3lAW%2BQA3waQ%3D%3D&'
// 					+'numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=AppTest&_type=xml&listYN=Y&arrange=Q&contentTypeId=39'
// 					+'&areaCode='+arrArea[i]+'&sigunguCode='+arrSigungu[j];
// 			setTimeout(sendRequest(foodContentUrl, null, contentImport, 'GET'), 2000);	 */
			
// /* 			for(let k = 0 ; k < 10; k++){	
// 				console.log('test4');
// 				console.log(arrSigungu);
// 				var foodDetailUrl = 'https://apis.data.go.kr/B551011/KorService1/detailIntro1?'
// 						+'serviceKey=9IwUjd%2FogvdB0LCIq4Khs%2FcCfCV%2BIg9rqUf8U5PcrM4lW0lXdpv%2BpQHMKcg7y7klSZJ7SpQcrgs3lAW%2BQA3waQ%3D%3D&MobileOS=ETC&MobileApp=AppTest&_type=xml&'
// 						+'contentId='+arrContentId[k]+'&contentTypeId=39&numOfRows=10&pageNo=1'
// 				setTimeout(sendRequest(foodDetailUrl, null, detailImport, 'GET'), 2000);
				
// 				var foodInfoUrl = 'https://apis.data.go.kr/B551011/KorService1/detailCommon1?'
// 						+'serviceKey=9IwUjd%2FogvdB0LCIq4Khs%2FcCfCV%2BIg9rqUf8U5PcrM4lW0lXdpv%'
// 						+'2BpQHMKcg7y7klSZJ7SpQcrgs3lAW%2BQA3waQ%3D%3D&MobileOS=ETC&MobileApp=AppTest&_type=xml&'
// 						+'contentId='+arrContentId[k]+'&contentTypeId=39&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&numOfRows=10&pageNo=1' 
// 				setTimeout(sendRequest(foodInfoUrl, null, InfoImport, 'GET'), 2000);
// 				items.foodInfoName = arrInfoName[k];
// 				items.foodImg = arrImg[k];
// 				items.foodTel = arrTel[k];
// 				jsFoodObject.push(items);
// 				console.log(jsFoodObject);
// 			}
// 		} */
		
// function sigunguImport(){
// 	if(XHR.readyState==4){
// 		if(XHR.status==200&&arrArea[arraySidoNum]!=null){
// 			arraySigunguNum++;
// 			var data=XHR.responseXML;
// 			console.log('arrayNum='+arraySidoNum);
// 			var areaList=data.getElementsByTagName('item');
			
// 			console.log('arraySigunguNum='+arraySigunguNum);
			
// 			var area=areaList[arraySigunguNum];
// 			arrSigungu[arraySigunguNum]= area.getElementsByTagName('code').item(0).firstChild.nodeValue;
// 			object.area = arrArea[arraySidoNum];
// 			object.foodSigungu = arrSigungu[arraySigunguNum];	
			
// 			console.log(object.area);
// 			console.log('arrArea[arraySidoNum]=' +arrArea[arraySidoNum]);
			
// 			var foodContentUrl = 'https://apis.data.go.kr/B551011/KorService1/areaBasedList1?serviceKey=9IwUjd%2FogvdB0LCIq4Khs%2FcCfCV%2BIg9rqUf8U5PcrM4lW0lXdpv%2BpQHMKcg7y7klSZJ7SpQcrgs3lAW%2BQA3waQ%3D%3D&numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=AppTest&_type=xml&listYN=Y&arrange=Q&contentTypeId=39&areaCode=1&sigunguCode=1';
// 			sendRequest(foodContentUrl, null, contentImport, 'GET');
// 		}
// 	}		
// }
		
// function contentImport(){
// 	console.log('content readyState='+XHR.readyState);
// 	if(XHR.readyState==4){
// 		if(XHR.status==200){
// 			console.log(1);
// 			var data=XHR.responseXML;
// 			var areaList=data.getElementsByTagName('item');
// 				var array=areaList[0];
// 				var arrContentId = array.getElementsByTagName('contentid').item(0).firstChild.nodeValue;
// 				var arrInfoName = array.getElementsByTagName('title').item(0).firstChild.nodeValue;
// 				var arrImg = array.getElementsByTagName('firstimage').item(0).firstChild.nodeValue;
// 				var telElements = array.getElementsByTagName('tel');
// 				console.log(telElements.length);
// 				if (telElements.length > 0) {
// 					var arrTel = telElements[0].textContent;
// 				} else {
// 					var arrTel = '없음';
// 				}
				
							
// 				object.ContentId = arrContentId;
// 				object.InfoName = arrInfoName;	
// 				object.Img = arrImg;	
// 				object.Tel = arrTel;	
				
// 				jsFoodObject.push(object);
// 				console.log(jsFoodObject);
			
// 		}
// 	}
// }
// /* function detailImport(){
// 	if(XHR.readyState==4){
// 		if(XHR.status==200){
// 			var data = XHR.reponseXML;
// 			items.foodMenu = data.getElementsByTagName('treatmenu');
// 			items.foodOpen = data.getElementsByTagName('opentimefood');
// 			items.foodClose = data.getElementsByTagName('restdatefood');
// 			items.foodparking = data.getElementsByTagName('parkingfood');
// 		}
// 	}
// }
// function InfoImport(){
// 	if(XHR.readyState==4){
// 		if(XHR.status==200){
// 			items.foodInfo = data.getElementsByTagName('overview');
// 		}
// 	}
// } */
var arrArea = [1, 2, 3, 4, 5, 6, 7, 8, 31, 32, 33, 34, 35, 36, 37, 38, 39];
var arrSigungu = [];
var arraySidoNum = 0;
var arraySigunguNum = -1;
var jsFoodObject = [];

function areaImport() {
//    arraySidoNum++;
    var foodSigunguUrl = 'https://apis.data.go.kr/B551011/KorService1/areaCode1?serviceKey=9IwUjd%2FogvdB0LCIq4Khs%2FcCfCV%2BIg9rqUf8U5PcrM4lW0lXdpv%2BpQHMKcg7y7klSZJ7SpQcrgs3lAW%2BQA3waQ%3D%3D&numOfRows=50&pageNo=1&MobileOS=ETC&MobileApp=AppTest&areaCode=' + arrArea[arraySidoNum] + '&_type=xml';
    sendRequest(foodSigunguUrl, null, sigunguImport , 'GET');
}

function sigunguImport() {
    if (XHR.readyState == 4) {
        if (XHR.status == 200 && arrArea[arraySidoNum] != null) {
            arraySigunguNum++;
            let data = XHR.responseXML;
            console.log('arrayNum=' + arraySidoNum);
            var areaList = data.getElementsByTagName('item');
            console.log(data);

            var area = areaList[arraySigunguNum];
            arrSigungu[arraySigunguNum] = area.getElementsByTagName('code').item(0).firstChild.nodeValue;

            var foodContentUrl = 'https://apis.data.go.kr/B551011/KorService1/areaBasedList1?serviceKey=9IwUjd%2FogvdB0LCIq4Khs%2FcCfCV%2BIg9rqUf8U5PcrM4lW0lXdpv%2BpQHMKcg7y7klSZJ7SpQcrgs3lAW%2BQA3waQ%3D%3D&numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=AppTest&_type=xml&listYN=Y&arrange=Q&contentTypeId=39&areaCode=' + arrArea[arraySidoNum] + '&sigunguCode=' + arrSigungu[arraySigunguNum];
            setTimeout(function(){sendRequest(foodContentUrl, null, function () {for (var i = 0; i < 10; i++) {contentImport(i);}}, 'GET')},20000);
        }setTimeout(function(){areaImport();},20000);
    }
}

function contentImport(index) {
    console.log('content readyState=' + XHR.readyState);
    if (XHR.readyState == 4) {
        if (XHR.status == 200) {
            console.log(1);
            let data = XHR.responseXML;
            var areaList = data.getElementsByTagName('item');
            var array = areaList[index];
            var arrContentId = array.getElementsByTagName('contentid').item(0).firstChild.nodeValue;
            var arrInfoName = array.getElementsByTagName('title').item(0).firstChild.nodeValue;
            var arrImg = array.getElementsByTagName('firstimage').item(0).firstChild.nodeValue;
            var telElements = array.getElementsByTagName('tel');
            console.log(telElements.length);
            if (telElements.length > 0) {
                var arrTel = telElements[0].textContent;
            } else {
                var arrTel = '없음';
            }

            var object = {
                area: arrArea[arraySidoNum],
                foodSigungu: arrSigungu[arraySigunguNum],
                ContentId: arrContentId,
                InfoName: arrInfoName,
                Img: arrImg,
                Tel: arrTel
            };
            
            var foodDetailUrl = 'https://apis.data.go.kr/B551011/KorService1/detailIntro1?'
					+'serviceKey=9IwUjd%2FogvdB0LCIq4Khs%2FcCfCV%2BIg9rqUf8U5PcrM4lW0lXdpv%2BpQHMKcg7y7klSZJ7SpQcrgs3lAW%2BQA3waQ%3D%3D&MobileOS=ETC&MobileApp=AppTest&_type=xml&'
					+'contentId='+arrContentId[index]+'&contentTypeId=39&numOfRows=10&pageNo=1'

            console.log(jsFoodObject);
            setTimeout(function(){sendRequest(foodDetailUrl, null, detailImport(index, object) , 'GET')},20000);
        }
    }
}

function detailImport(i, object) {
    if (XHR.readyState == 4) {
        if (XHR.status == 200) {
            var data = XHR.responseXML;
            var areaList = data.getElementsByTagName('item');
            var array = areaList[i];
            var menuElements = array[i].getElementsByTagName('treatmenu');
            var openElements = array[i].getElementsByTagName('opentimefood');
            var closeElements = array[i].getElementsByTagName('restdatefood');
            var parkingElements = array[i].getElementsByTagName('parkingfood');
            if (menuElements.length > 0) {
                arrMenu = menuElements[0].textContent;
            }else{
				arrMenu = '없음';
			}
			
            if (openElements.length > 0) {
                foodOpen = openElements[0].textContent;
            }

            if (closeElements.length > 0) {
                foodClose = closeElements[0].textContent;
            }

            if (parkingElements.length > 0) {
                foodparking = parkingElements[0].textContent;
            }

            object.foodMenu = arrMenu;
            object.foodOpen = foodOpen;
            object.foodClose = foodClose;
            object.foodparking = foodparking;

            jsFoodObject.push(object);
            console.log(jsFoodObject);
        }
    }
}
</script>
</head>
<body>
	<input type = "button" value = "데이터넣기" onclick="areaImport()">
</body>
</html>