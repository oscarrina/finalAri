<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://js.tosspayments.com/v1/payment-widget"></script>
<style>
.content{
  display: block;
  width: 900px; /* 원하는 너비로 조정 */
  margin-top: 160px; /* 가로 가운데 정렬 */
  margin-left:auto;
  margin-right:auto;
}
.mainImg{
	width:450px;
	height:300px;
	border-radius:25px;
}
h3{
  text-align: left;
}
.topTh{
  border-top-left-radius: 25px;
  
}
.bottomTh{
  border-bottom-left-radius: 25px;
}
th{
  background-color: #253BFF;
  color:white;
}
h5{
  text-align: center;
}
.mainTableDiv{
  border: solid 3px #253BFF;
  border-radius: 25px;
}
.mainTable{
  border-spacing: 10px;
}
.addTable{
  width:900px;
  border-collapse: separate;
  
}
.berthDiv{
	width:900px;
	border: solid 3px #253BFF;
  border-radius: 25px;
}
.berthImg{
	border-radius: 25px;
	width:350px;
}
.birthTable{
	width:900px;
	
}
.addDiv{
	border: solid 3px #253BFF;
	border-radius: 25px;
}
.reserBtn{
	border: none;
 	background-color: #253BFF;
 	color: white;
 	width: 350px;
 	height: 60px;
 	font-size: 20px;
}
.reserSpan{
	font-size: 20px;
}
.r1{
	margin-top:30px;
	border: 3px solid #253BFF;
	border-radius: 25px;
}
ul{
	vertical-align: top;
	list-style:none;
	display: inline-block;
}
.review{
	margin-top:30px;
}
.img{
	width: 150px;
    height: 150px;
    object-fit: cover;
    cursor: pointer;
}
.star{
	color: transparent;
	text-shadow: 0 0 0 #f0f0f0;
}
.rcontent{
	overflow: visible;
	width: 500px;
	height: 150px;
	padding: 15px;
	overflow-y: auto;
}
.modal {
    display: none;
    position: fixed;
    z-index: 1;
    padding-top: 100px;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgba(0, 0, 0, 0.9);
}
.modal-content {
    margin: auto;
    display: block;
    width: 80%;
    max-width: 700px;
}
.close {
    position: absolute;
    top: 15px;
    right: 35px;
    color: #f1f1f1;
    font-size: 40px;
    font-weight: bold;
    cursor: pointer;
}
li{
	margin-top: 15px;
}
.a{
	background-color: #CDDEFF;
	border-radius: 25px; 
	margin-top: 5px;
	margin-bottom: 5px;
}
</style>
<script>
function getFormatDate(date){
    let year = date.getFullYear();          
    let month = (1 + date.getMonth());        
    month = month >= 10 ? month : '0' + month; 
    let day = date.getDate();                  
    day = day >= 10 ? day : '0' + day;         
    return  year + '-' + month + '-' + day;     
}

window.onload = function(){
	let startDate = getFormatDate(new Date('${startDate}'));
	let endDate = getFormatDate(new Date('${endDate}'));
   document.getElementById("start").value = startDate;
   document.getElementById("end").value = endDate;
   document.getElementById("start").setAttribute("min",getFormatDate(new Date()));
   document.getElementById("end").setAttribute("min",endDate);
}

function endDateCal(start){
   var startValue = start.value;
   let startDate = getFormatEndDate(new Date(startValue));
   var endValue = document.getElementById("end").value;
   if (dateCal(endValue) <= dateCal(startValue)){
      document.getElementById("end").value = startDate
   }
   document.getElementById("end").setAttribute("min",startValue);
}
//입실 날짜가 퇴실 날짜보다 클 경우 입실 날짜 기준 퇴실 날짜 +1
function getFormatEndDate(date){
    let year = date.getFullYear();          
    let month = (1 + date.getMonth());        
    month = month >= 10 ? month : '0' + month; 
    let day = date.getDate()+1;                  
    day = day >= 10 ? day : '0' + day;         
    return  year + '-' + month + '-' + day;     
}

function dateCal(date){
   var ndate = new Date(date);
    var getTime = ndate.getTime();
    var result = parseInt(getTime);
    return result;
}

function dateminu(date1, date2){
   var sDate = new Date(date1);
   var eDate = new Date(date2);
   var getTime1 = sDate.getTime();
   var getTime2 = eDate.getTime();
   
   var startDate = parseInt(getTime1);
   var endDate = parseInt(getTime2);
   var dateP = endDate - startDate;
    var result = dateP / (1000 * 60 * 60 * 24);
    return result;
}
function dateShow(idx){
	let startDate = document.getElementById("start").value;
	let endDate = document.getElementById("end").value;
	location.href = 'berthInfoDetail?berthInfoIdx='+idx+'&startDate='+startDate
	+'&endDate='+endDate;
}
function reser(berthIdx,idx){
	location.href = 'reserForm?berthIdx='+berthIdx+'&idx='+idx+'&startDate=${startDate}'
	+'&endDate=${endDate}';
}
function openModal(imgSrc) {
    var modal = document.getElementById('myModal');
    var modalImg = document.getElementById('modalImg');
    modal.style.display = 'block';
    modalImg.src = imgSrc;
}
function closeModal() {
    var modal = document.getElementById('myModal');
    modal.style.display = 'none';
}
window.onclick = function (event) {
    var modal = document.getElementById('myModal');
    if (event.target == modal) {
        modal.style.display = 'none';
    }
}
</script>
</head>
<body>
<%@include file="/WEB-INF/views/header.jsp" %>
<div class="content">
<c:forEach items="${berthInfo}" var="berthInfo">
<div class="mainTableDiv">
<table class="mainTable">
<tr>
	<td rowspan="4" width="450">
		<img alt="상세 메인이미지" src="/imgs/${berthInfo.infoImg }" class="mainImg">	
	</td>
	<td width="450">
		<h4>&nbsp;&nbsp;${berthInfo.infoName }</h4>
	</td>
</tr>
<tr>
	<td width="450">
		<strong>&nbsp;&nbsp;${berthInfo.addr }</strong><br>별점넣을곳
	</td>
</tr>
<tr>
	<td rowspan="2" height="150" width="450">
		<h6>&nbsp;&nbsp;${berthInfo.info }</h6>
	</td>
</tr>

</table>
</div>
<br><br>
<h6>${berthInfo.infoName }</h6>
<div class="addDiv">
<table class="addTable">
	<tr>
		<th class="topTh"><h5>전화번호</h5></th>
		<td><h5>${berthInfo.tel }</h5></td>
	</tr>
	<tr>
		<th><h5>객실수</h5></th>
		<td><h5>${berthInfo.berthInfoSeat }</h5></td>
	</tr>
	<tr>
		<th><h5>주차시설 유무</h5></th>
		<td><c:choose>
  	 	 <c:when test="${berthInfo.parking == 0}">
    	  <h5>무</h5>
  		 </c:when>
   		 <c:otherwise>
         <h5>유</h5>
   		 </c:otherwise>
		</c:choose></td>
	</tr>
	<tr>
		<th><h5>입실시간</h5></th>
		<td>
		<h5>${berthInfo.berthInfoStart}</h5>
		</td>
	</tr>
	<tr>
		<th class="bottomTh"><h5>퇴실시간</h5></th>
		<td>
		<h5>${berthInfo.berthInfoEnd}</h5>
		</td>
	</tr>
</table>
</div>
</c:forEach><br><br>
<div class="berthDiv">
<input type = "date" id = "start" oninput= "endDateCal(this)" name = "startDate">
<input type = "date" id = "end" name = "endDate">
<button type="button" onclick="dateShow(${berthInfo[0].idx })">선택</button>
<span></span>
<c:forEach items="${berth }" var="berth">
<table class="berthTable">
	<tr>
		<td rowspan="7"  width="380"><img src="/imgs/${berth.berthImg }" alt="room" class="berthImg"></td>
		<td width="300"><h5><Strong>${berth.berthName }</Strong></h5></td>
		<td><h5>${berth.berthPrice }원<h5></td>
	</tr>
	<tr><td>${berth.berthSize }㎡</td></tr>
	<tr><td><i class="bi bi-person-fill"></i>최대 ${berth.berthMax }명</td></tr>
	<tr><td><i class="bi bi-tv"></i> <c:if test="${berth.berthTv==1}">O</c:if><c:if test="${berth.berthTv==0}">X</c:if></td>
	<td><c:if test="${berth.reserState==1}"><span class="reserSpan">판매완료</span></c:if>
	<c:if test="${berth.reserState==0}"><button type="button" onclick="reser(${berth.berthIdx },${berthInfo[0].idx })" class="reserBtn">예약하기</button></c:if>
	</td></tr>
	<tr><td><i class="bi bi-wifi"></i> <c:if test="${berth.berthInternet==1}">O</c:if><c:if test="${berth.berthInternet==0}">X</c:if></td></tr>
	<tr><td><c:if test="${berth.berthDry==1}">헤어드라이기 비치</c:if><c:if test="${berth.berthDry==0}"></c:if></td></tr>
	<tr><td><c:if test="${berth.berthRefri==1}">냉장고 있음</c:if><c:if test="${berth.berthRefri==0 }"></c:if></td></tr>
</table>
</c:forEach>
</div>
<div class="review">
<c:if test="${empty review }">
	<h5>리뷰가 없습니다</h5>
</c:if>
<c:if test="${not empty review }">
	<c:forEach items="${review }" var="review">
	<div class="a">
		<ul>  
			<li><c:out value="${fn:substring(review.userId, 0, 3)}" />****</li>
			
			<li>${review.reviewDate }</li>
			<c:if test="${review.reviewScore == 1 }">
				⭐<span class="star">⭐⭐⭐⭐</span>
			</c:if>
			<c:if test="${review.reviewScore == 2 }">
				⭐⭐<span class="star">⭐⭐⭐</span>
			</c:if>
			<c:if test="${review.reviewScore == 3 }">
				⭐⭐⭐<span class="star">⭐⭐</span>
			</c:if>
			<c:if test="${review.reviewScore == 4 }">
				⭐⭐⭐⭐<span class="star">⭐</span>
			</c:if>
			<c:if test="${review.reviewScore == 5 }">
				<li>⭐⭐⭐⭐⭐</li>
			</c:if>
		</ul>
		<ul>
			<li class="rcontent">${review.reviewContent }</li>
		</ul>
		<ul>
			<c:if test="${not empty review.reviewImg }">
				<li><img src=" /imgs/${review.reviewImg}" class="img" onclick="openModal('/imgs/${review.reviewImg}')"></li>
			</c:if>
		</ul>
	</div>
	</c:forEach>
</c:if>
</div>
<div id="myModal" class="modal">
    <span class="close" onclick="closeModal()">&times;</span>
    <img class="modal-content" id="modalImg">
</div>
</div>
<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>