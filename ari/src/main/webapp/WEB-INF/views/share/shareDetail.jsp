<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src = "js/httpRequest.js"></script>
<style>
.content{
	display: block;
  width: 900px; /* 원하는 너비로 조정 */
  margin-top: 160px; /* 가로 가운데 정렬 */
  margin-left:auto;
  margin-right:auto;
 }
 img{
 	width:300px;
 	border-radius: 25px;
 }
 table{
 	width:900px;
 	margin:7px;
 }
 .btn2{
   margin-top:30px;
   border:none;
   border-radius:25px;
     background:#686DB9;
     width: 80px;
     height:45px;
     color: #fff;
     cursor: pointer;
     margin-left: 30px;
     font-size: 16px;
     
}
.like{
	font-size: 25px;
}
.likeBtn{
	border: none;
	background: none;
}
</style>
<script>
var shareLike='${likeYN}';
const userId = '${userId}';
const idx = ${share.idx};

function like(likeYN){
		if(userId == null || userId == ""){
		swal('아리아리','좋아요는 로그인이 필요합니다.');
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
	let param = 'idx='+idx+'&likeType='+${likeType}+'&likeImg=${plan.planBigImg }'+'&likeYN='+likeYN;
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
</head>
<body>
<%@include file="/WEB-INF/views/header.jsp" %>
<div class="content">
<strong style="color:#253BFF; font-size: 22px;">${plan.userID }님은 ${area[plan.planPoint]}로 ${plan.planStart }~${plan.planEnd } 간 여행할 계획을 세웠어요!</strong>
<br><br><br>
<div style="border: solid 3px #253BFF; border-radius: 25px;">
<table>
	<tr>
		<td rowspan="3" width="320px"><img src="/img/${plan.planBigImg }"></td>
		<td><h4 align="left" style="color:#213555;">${share.shareTitle }</h4>
		<button type="button" onclick="like(shareLike)" class="likeBtn" id="likeBtn123">
		<c:if test="${likeYN == 'N' }">
		<i class="bi bi-heart like" id="likeBtn"></i>
		</c:if>
		<c:if test="${likeYN == 'Y' }">
		<i class="bi bi-heart-fill like" id="likeBtn"></i>
		</c:if>
		</button>
		</td>
		<td></td>
	</tr>
	<tr>
		<td>조회수:${share.shareRead }</td>
	</tr>
	<tr>
		<td colspan="2">작성일:${share.shareDate }</td>
	</tr>
</table>
</div><br><br>
<div style="border: solid 3px #253BFF; border-radius: 25px; padding:10px;"><h5>${share.shareContent }</h5></div>
<div style="margin-left:785px;">
<input type="button" class="btn2" value="돌아가기" onclick="location.href='shareList'" >
</div>
</div>
<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>