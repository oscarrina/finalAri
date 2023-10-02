<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
}	
.container1 .containerBody{
	align-items: 5px;
	height:85%;
	flex-direction: column;
	justify-content: space-around; 
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
.arrow{
	width: 80px;
	height: 30px;
	border-radius: 10px;
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
	height:90%;
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
	function categoryButton(category){
		var categoryId = document.getElementById('category');
		categoryId.backgroundColor = "#db0d36";
	}
</script>
</head>
<body>
<%@include file="/WEB-INF/views/header.jsp" %>
<main class = "main">
	<section class= "section">
		<div id = "sectionHead">
			<label>동네 고르기</label>
			<select>
				<option>1일차</option>
				<option>2일차</option>
			</select>
		</div>
		<div id="sectionBody">
			<div class = "container1">
				<div class= "containerHead">
					<select>
						<option>1일차</option>
						<option>2일차</option>
					</select>
					</div>
					<div class="containerBody">
						<img class="img" src="/img/img.jpg" alt="Image">
						<img class="arrow" src="/img/planArrow.png">
						<img class="img" src="/img/img.jpg" alt="Image">
						<img class="arrow" src="/img/planArrow.png">
						<img class="img" src="/img/img.jpg" alt="Image">
						<img class="arrow" src="/img/planArrow.png">
						<img class="img" src="/img/img.jpg" alt="Image">
						<img class="arrow" src="/img/planArrow.png">
						<img class="img" src="/img/img.jpg" alt="Image">
						<img class="arrow" src="/img/planArrow.png">
						<img class="img" src="/img/img.jpg" alt="Image">
					</div>
			</div>
			<div class= "container2">
				<div class="containerHead">
					<div id = "categoryButton1" onclick="categoryButton('categoryButton1')">관광지</div>
					<div id = "categoryButton2">음식점</div>
					<div id = "categoryButton3">숙박</div>
				</div>
				<div class="containerBody">
					<div><img class="img" src="/img/img.jpg" alt="Image"></div>
					<div><img class="img" src="/img/img.jpg" alt="Image"></div>
					<div><img class="img" src="/img/img.jpg" alt="Image"></div>
					<div><img class="img" src="/img/img.jpg" alt="Image"></div>
					<div><img class="img" src="/img/img.jpg" alt="Image"></div>
					<div><img class="img" src="/img/img.jpg" alt="Image"></div>
					<div><img class="img" src="/img/img.jpg" alt="Image"></div>
					<div><img class="img" src="/img/img.jpg" alt="Image"></div>
					<div><img class="img" src="/img/img.jpg" alt="Image"></div>
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
geocoder.addressSearch('제주특별자치도 제주시 첨단로 242', function(result, status) {

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