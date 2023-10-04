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
			str='<select class="border2 border3" aria-label="Default select example" onchange="show2()" id="sbox1">';
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
		+ '&areaCode='+code+'&numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=AppTest';
	sendRequest(url, null, showResult2, 'GET');
}
function showResult2(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data=XHR.responseXML;
			var spanTag=document.all.sboxspan2;
			var str='';
			str='<select class="border2 border3" aria-label="Default select example" id="sbox2">';
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
	margin-top:50px;

}
.content5{
	border: 2px solid #4068A7;
	border-radius: 10px;
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
	
}
.border2{
	border: 1px solid #4068A7;
	border-radius: 15px;
	margin-top: 10px;
}
.border3{
	width:150px;
	padding-top: 5px;
	padding-bottom: 5px;
}
.label1{
	margin-top: 5px;
	width:400px;
	max-width: none;
	flex:none;
}
.width1{
	width:500px;
}
svg{
	width:20px;
	height:25px;
}
.content3{
	width:600px; 
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
<%@ include file="../admin/adminHeader.jsp" %>
  <!-- /사이드바 -->

  <!-- 본문 -->
  <div id="page-content-wrapper">
    <div class="container-fluid content1" >
      <h3>축제 등록</h3>
		<form name="noticeAdd" action="noticeAdd" method="post">
		<div class="content2">	
		<div class="content5">	
		<div class="content4">	
		  <div class="mb-3 row">
		    <label for="staticEmail" class="col-sm-2 col-form-label label1">축제명</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control border1 width1" name="festtitle" placeholder="축제 이름">
		    </div>
		    <label for="staticEmail" class="col-sm-2 col-form-label label1">주최자 정보</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control border1 width1" style="width:250px;" name="festtelname">
		    </div>
		    <label for="staticEmail" class="col-sm-2 col-form-label label1">주최자 전화번호</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control border1 width1" style="width:250px;" name="festtel">
		    </div>
		    <label for="staticEmail" class="col-sm-2 col-form-label label1">홈페이지 주소</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control border1 width1" name="festhome">
		    </div>
		    
		    <label for="staticEmail" class="col-sm-2 col-form-label label1">지역</label>
		    <div class="col-sm-10">
			  <span id="sboxspan1"></span>
			  <span id="sboxspan2"></span>
		    </div>
		     <label for="staticEmail" class="col-sm-2 col-form-label label1">주소</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control border1 width1" name="festaddr">
		    </div>
			<label for="staticEmail" class="col-sm-2 col-form-label label1">공연시간</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control border1 width1" style="width:250px;" name="festtelname">
		    </div>
		    <label for="staticEmail" class="col-sm-2 col-form-label label1">이용요금</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control border1 width1" style="width:250px;" name="festtelname">
		    </div>
		    <label for="formFile" class="form-label">Default file input example</label>
		    <div class="col-sm-10">
 		 		<input class="form-control" type="file" id="formFile">
 		 	</div>
			  <label for="staticEmail" class="col-sm-2 col-form-label label1">개요</label>
			  <div class="col-sm-10">
			  	<textarea class="form-control border2 content3" maxlength="1000" name="noticecontent"  ></textarea>
			  </div>
			   <label for="staticEmail" class="col-sm-2 col-form-label label1">내용</label>
			  <div class="col-sm-10">
			  	<textarea class="form-control border2 content3" maxlength="1000" name="noticecontent"></textarea>
			  </div>
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
    <%@include file="../admin/adminFooter.jsp" %>
  </div>
  <!-- /본문 -->
</div>

</body>
</html>html>