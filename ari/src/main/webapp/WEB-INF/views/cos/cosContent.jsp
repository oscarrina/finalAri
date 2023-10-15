<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src = "js/httpRequest.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    const idx = ${param.idx};
    var shareLike='${likeYN}';
    const userId = '${userId}';

    var key = "9IwUjd%2FogvdB0LCIq4Khs%2FcCfCV%2BIg9rqUf8U5PcrM4lW0lXdpv%2BpQHMKcg7y7klSZJ7SpQcrgs3lAW%2BQA3waQ%3D%3D";
    var apiUrl = "http://apis.data.go.kr/B551011/KorService1/detailInfo1";
    var url = apiUrl + "?ServiceKey=" + key + "&contentTypeId=25&contentId=" + idx + "&MobileOS=ETC&MobileApp=AppTest";

    $.ajax({
        url: url,
        type: "GET",
        dataType: "xml", 
        success: function (data) {

            var $xml = $(data);

            var items = $xml.find("item").toArray();

            items.sort(function (a, b) {
                var subnumA = parseInt($(a).find("subnum").text(), 10);
                var subnumB = parseInt($(b).find("subnum").text(), 10);
                return subnumA - subnumB;
            });

            var $apiData = $("#apiData");

            for (var i = 0; i < items.length; i++) {
                var item = items[i];
                var title = $(item).find("subname").text();
                var content = $(item).find("subdetailoverview").text();
                var image = $(item).find("subdetailimg").text();

                var $courseDiv = $("<div class='cos'></div>");

                var $imageDiv = $("<div class='image-container'></div>");
                $imageDiv.append("<img src='" + image + "' alt='이미지' class='img'>");

                var $textDiv = $("<div class='text-container'></div>");
                $textDiv.append("<p class='title'> " + (i + 1) + "코스 : " + title + "</p>");
                $textDiv.append("<p class='con'>" + content + "</p>");

                $courseDiv.append($imageDiv);
                $courseDiv.append($textDiv);

                $apiData.append($courseDiv);
            }
        },
        error: function (error) {
            console.error('API 호출 중 오류 발생:', error);
        }
    });
    
    function like(likeYN){
    		if(userId == null || userId == ""){
    		swal('아리아리','로그인 후 이용해주세요.');
    		return false;
    	}
    	
    	let likeBtn = document.getElementById("likeBtn");
    	if(likeYN == 'N'){ //좋아요 안 누른 상태
    		//클릭 시 좋아요 버튼 상태 바뀜
    		likeBtn.setAttribute('class','bi bi-heart-fill like');
    		likeYN = 'Y';
    	}else{ //좋아요 누른 상태
    		//클릭 시 좋아요 버튼 상태 바뀜
    		likeBtn.setAttribute('class','bi bi-heart like');
    		likeYN = 'N';
    	}
    	let param = 'idx='+idx+'&likeType='+${likeType}+'&likeImg=${dto.cosImg }'+'&likeYN='+likeYN;
    	sendRequest('likeOK',param,likeYN == "Y" ? likeOK:likeCancel,'GET');
    }
    function likeOK(){
    	if(XHR.readyState == 4){
    		if(XHR.status == 200){
    			let data = XHR.responseText;
    			swal('아리아리',data);
    			shareLike='Y';
    		}
    	}
    }
    function likeCancel(){
    	if(XHR.readyState == 4){
    		if(XHR.status == 200){
    			let data = XHR.responseText;
    			swal('아리아리',data);
    			shareLike='N';
    		}
    	}
    }
</script>
<style>
.a {
    margin-top: 150px;
}
.cos {
	border: 2px solid;
	border-radius: 25px;
	border-color: #253BFF;
    display: flex;
    margin-bottom: 20px;
}
.title {
    font-weight: bold;
    margin-left: 20px;
    margin-top: 10px;
}
.con {
    margin-left: 20px;
}
.img {
    width: 500px;
    height: auto;
    border-radius: 25px;
}
.p{
	font-size: 20px;
	font-weight: bold;
}
.like{
	font-size: 25px;
}
.likeBtn{
	border: none;
	background: none;
}
</style>

</head>
<body>
<%@include file="/WEB-INF/views/header.jsp" %>
<div class="a">
	<div class="c">
		<p class="p">${dto.cosTitle }</p>
		<button type="button" onclick="like(shareLike)" class="likeBtn" id="likeBtn123">
		<c:if test="${likeYN eq 'N' }">
		<i class="bi bi-heart like" id="likeBtn"></i>
		</c:if>
		<c:if test="${likeYN eq 'Y' }">
		<i class="bi bi-heart-fill like" id="likeBtn"></i>
		</c:if>
		</button>
		<hr>
	</div>
	<div id="apiData"></div>
</div>
<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>