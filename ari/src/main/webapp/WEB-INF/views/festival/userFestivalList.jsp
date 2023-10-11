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
<link rel="stylesheet" type="text/css" href="/css/festivalListLayout.css">
<script type="text/javascript" src="../../../js/httpRequest.js"></script>
<script>
function show1(){
	var cate=document.all.sbox.value;
	if(cate==1){
		sendRequest('getArea', null, showResult, 'GET');
	}
}
function show(){
	var cate=document.all.sbox.value;
	if(cate==2){
		location.href='userfest?area=0';
	}else{
		location.href='userfest?area=1';
		//sendRequest('getArea', null, showResult, 'GET');
	}	
}

function showResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			
			var data=XHR.responseXML;
			
			var spanTag=document.all.sboxspan;
			var sbox=document.all.sbox.value;
			var uarea=<c:out value="${area}" />;
			var str='';
			str='<select class="border2 border3" aria-label="Default select example" onchange="show2()" id="sbox2">';
			var areaList=data.getElementsByTagName('item');
			for(var i=0;i<areaList.length;i++){
				var area=areaList[i]; //studentList.item(i)
				var code=area.getElementsByTagName('code').item(0).firstChild.nodeValue;
				var name=area.getElementsByTagName('name').item(0).firstChild.nodeValue;
				
				if(sbox==1 && code==uarea){
					str+='<option value="'+code+'" selected>'+name+'</option>';
				}else{
					str+='<option value="'+code+'">'+name+'</option>';
				}

				
			}
			str+='</select>'
			spanTag.innerHTML=str;

		}
	}
}
function show2(){
	var area=document.all.sbox2.value;
	location.href='userfest?area='+area;
}
function showcont(idx){
	location.href='userfestCont?festidx='+idx;
}
</script>
<style>
.content{
  display: block;
  width: 900px; /* 원하는 너비로 조정 */
  margin-top: 160px; /* 가로 가운데 정렬 */
  margin-left:auto;
  margin-right:auto;
}
.a{
	margin-top: 200px;
	margin-left: -26px;
}
.title:visited{
	color: #455671;
}
.title:link{
	color: #455671;
}
.poster{
	width: 250px;
	height:350px;
	border-radius: 25px;
	
}
.ul{
	white-space: nowrap;
	list-style-type:none;
}
.li{
	margin-left: 0px;
	margin-top: 5px;
	width: 350px;
	font-size: 17px;
	overflow: hidden;
	display: inline-block;
	text-overflow: ellipsis;
}
.table{
	width: 1100px;
	margin-left: -100px;
}
.table td{
	border-top:none !important;
	border-bottom:none !important;
}
.td1{
	border-top:none !important;
}
.border2{
	margin-left:-50px;
	font-size: 17px;
	margin-bottom:15px;
}
.title{
	color: #455671;
	text-overflow: ellipsis;
	overflow:hidden;
	width:245px !important;
	margin-left: 5px;
	font-weight: bold;
	
}
.underline {
  text-decoration:none;
  line-height: 1.2;
  font-size: 15px;
  font-weight: 700;
  background-image: linear-gradient(transparent calc(100% - 3px), #8B95A6 3px);
  background-repeat: no-repeat;
  background-size: 0% 100%;
  transition: background-size 0.8s;
  color: #455671;
  cursor: pointer;
}
@media (min-width: 1000px) {
  .underline {
    font-size: 15px;;
  }
}
.underline.yellow {
  background-image: linear-gradient(transparent 60%, #8B95A6 40%);
}
.underline:hover {
  text-decoration:none;
  color:#8B95A6;
  background-size: 100% 100%;
}
.width1{
	padding-right: 100px !important;
}
</style>
</head>
<body onload="show1()">
<%@include file="/WEB-INF/views/header.jsp" %>

<div class="content">
<div class="content2">
		<select class="border2" aria-label="Default select example" onchange="show()" id="sbox">
		  <option value="2" ${area==0?"selected":"" }>전체</option>
		  <option value="1" ${area!=0?"selected":"" }>지역별</option>
		</select>
		<span id="sboxspan"></span>	
<table class="table">
	 <c:if test="${empty lists}">
            <tr>
                <td>
                    축제 정보 준비 중
                </td>
            </tr>
        </c:if>
        <c:forEach var="dto" items="${lists}" varStatus="loop">
            <c:if test="${loop.index % 3 == 0}">
                <tr>
            </c:if>
            <td class="width1">
                <ul class="ul">
 
                	<a href="javascript:void(0);" onclick="showcont(${dto.festidx})" class="title">
    					<li>
    						<c:if test="${dto.festapi==0 }"><img class="poster" alt="" src="/imgs/${dto.festimg }"></c:if>
    						<c:if test="${dto.festapi==1 }"><img class="poster" alt="" src="${dto.festimg }"></c:if>
    					</li>
    					<li class="li title">${dto.festtitle}</li>
					</a>
				   
                </ul>
            </td>
            <c:if test="${loop.index % 3 == 2 or loop.last}">
                </tr>
            </c:if>
        </c:forEach>
</table>
		
		 
		<div style="text-align: center; margin-left:100px;">
			<c:if test="${empty lists }">

			</c:if>
			<c:if test="${!empty lists }">
				${pageStr }
			</c:if>
		</div>	
</div>
</div>

<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>