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
<script type="text/javascript" src="../../../js/httpRequest.js"></script>
<script>
window.onload=function(){
	sendRequest('getArea', null, showResult, 'GET');
	
}
function showResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data=XHR.responseXML;
			var spanTag=document.all.sboxspan1;
			var str='';
			str='<select class="border3" aria-label="Default select example" onclick="show2()" id="sbox1" name="area">';
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
<style>
.contentwidth{
	width:600px;
}
.content2{
	width:800px;
	margin-top:40px;
	margin-bottom: 20px;
}

.content4{
	margin-top:10px;
	margin-bottom:20px;
	margin-left:20px;	
}
.border1{
	border-top:none;
	border-left:none;
	border-right:none;
	border-bottom: 2px solid #4068A7;
	border-radius: 0;
	margin-top: 5px;
	margin-bottom:5px;
	
}
input, textarea{
	border: 1px solid #4068A7 !important;
	border-radius: 15px;

}
.border3{
	border: 1px solid #4068A7;
	border-radius:15px;
	width:150px !important;
	padding-top: 5px !important;
	padding-bottom: 5px !important;
}
.label1{
	margin-top: 5px;
	margin-bottom:5px;
	width: 100% !important;
	display: inline-block;

}
.width1{
	width:500px;
}
svg{
	width:20px;
	height:25px;
}
.content3{
	width:800px !important; 
	height:150px !important;
    resize:none;
}
.margint{
	margin-top:5px;
}
.marginl{
	margin-left:15px;
}
.marginl2{
	margin-left:180px;
}
</style>
</head>
<body>
<div id="page-wrapper">
<%@ include file="../ceo/ceoHeader.jsp" %>
  <!-- /사이드바 -->

  <!-- 본문 -->
  <div id="page-content-wrapper">
    <div class="container-fluid content1" >
      <h3>축제 등록</h3>
		<form name="festAdd" action="festAdd" method="post" enctype="multipart/form-data">
		<div class="content2">	
		<div class="content4">	
		  <div class="mb-3 row">
		    <label for="festtitle" class="col-sm-2 col-form-label label1">축제명</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control border1 width1" id="festtitle" name="festtitle" style="width:500px;" placeholder="낙동강 캠핑&뮤직 페스타" required="required">
		    </div>
		    <label for="festtelname" class="col-sm-2 col-form-label label1">주최자 정보</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control border1 width1" style="width:250px;" id="festtelname" name="festtelname" placeholder="대구광역시 달성군" required="required">
		    </div>
		    <label for="festtel" class="col-sm-2 col-form-label label1">주최자 전화번호</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control border1 width1" style="width:250px;" id="festtel" name="festtel" placeholder="053-242-1104" required="required">
		    </div>
		    <label for="festhome" class="col-sm-2 col-form-label label1">홈페이지 주소</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control border1 width1" id="festhome" name="festhome" style="width:500px;" placeholder="http://ncmf.co.kr/main" required="required">
		    </div>
		    
		    <label for="staticEmail" class="col-sm-2 col-form-label label1">지역</label>
		    <div class="col-sm-10">
			  <span id="sboxspan1"></span>
			  <span id="sboxspan2"></span>
		    </div>
		     <label for="festaddr" class="col-sm-2 col-form-label label1">주소</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control border1 width1" id="festaddr" name="festaddr" placeholder="대구광역시 달성군 구지서로 199 낙동강 레포츠밸리 수상레저센터 " required="required">
		    </div>
			<label for="festdate" class="col-sm-2 col-form-label label1">공연시간</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control border1 width1" style="width:250px;" id="festdate" name="festdate" placeholder="9:00 - 21:00" required="required">
		    </div>
		    <label for="festprice" class="col-sm-2 col-form-label label1">이용요금</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control border1 width1" style="width:250px;" id="festprice" name="festprice" placeholder="부분 유료" required="required">
		    </div>
		    <label for="feststart" class="col-sm-2 col-form-label label1">시작날짜</label>
		    <div class="col-sm-10">
		      <input type="date" class="form-control border1 width1" style="width:250px;" id="feststart" name="feststart" required="required" >
		    </div>
		    <label for="festend" class="col-sm-2 col-form-label label1">종료날짜</label>
		    <div class="col-sm-10">
		      <input type="date" class="form-control border1 width1" style="width:250px;" id="festend" name="festend" required="required">
		    </div>
		    <label for="festimg" class="col-sm-2 col-form-label label1">포스터 이미지</label>
		    <div class="col-sm-10">
 		 		<input class="form-control" type="file" name="upload" id="festimg" required="required">
 		 	</div>
			  <label for="festcont" class="col-sm-2 col-form-label label1">개요</label>
			  <div class="col-sm-10">
			  	<textarea class="form-control border2 content3" id="festcont" maxlength="1000" name="festcont"  required="required"
			  			placeholder="2023 낙동강 캠핑&뮤직 페스타는 천혜의 자연을 간직한 대구 달성군에서 개최되는 대구 최초, 최대 캠핑과 음악이 함께하는 행사이다. 음악과 함께 즐기는 캠핑, 캠프닉 그리고 다양한 체험프로그램들을 통해 새로운 캠핑 경험을 선사한다."></textarea>
			  </div>
			   <label for="festcontent" class="col-sm-2 col-form-label label1">내용</label>
			  <div class="col-sm-10">
			  	<textarea class="form-control border2 content3" id="festcontent" maxlength="1000" name="festcontent" required="required"
			  			placeholder="1. 메인프로그램 : 캠핑, 캠프닉, 캠핑용품전시, 공연 등  &#13;&#10;2. 부대프로그램 : 원데이 클래스, 플리마켓 등 &#13;&#10;3. 소비자 참여 프로그램 : 원그리들 캠핑요리컨테스트, 과학토크콘서트, 캠핑브랜드 이벤트 등"></textarea>
			  </div>
		  </div>
			</div>
			<div class="d-grid gap-2 d-md-flex justify-content-end marginl2 contentwidth">
				<button type="button" class="btn btn-primary" 
				style="background-color:#666CDE; width:70px; height:40px; font-size:11px;" onclick="javascript:history.go(-1)">취소</button>&nbsp;&nbsp;
				<input type="submit" value="등록" class="btn btn-primary" 
				style="background-color:#3239AF; width:70px; height:40px; font-size:11px;">


			</div>
			
		  </div>
		</form>
    </div>
    <%@include file="../ceo/ceoFooter.jsp" %>
  </div>
  <!-- /본문 -->
</div>

</body>
</html>html>