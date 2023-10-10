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
<link rel="stylesheet" type="text/css" href="/css/festivalListLayout.css">
<script type="text/javascript" src="../../../js/httpRequest.js"></script>
<script>
function show3(idx) {
	window.location.href = "cosContent?idx=" + idx;
}
function show1(){
	var cate=document.all.sbox.value;
	if(cate==1){
		sendRequest('getArea', null, showResult, 'GET');
	}
}
function show(){
	var cate=document.all.sbox.value;
	if(cate==2){
		location.href='cosList?cosArea=0';
	}else{
		location.href='cosList?cosArea=1';
		//sendRequest('getArea', null, showResult, 'GET');
	}	
}
function showResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			
			var data=XHR.responseXML;
			
			var spanTag=document.all.sboxspan;
			var sbox=document.all.sbox.value;
			var uarea=<c:out value="${cosArea}" />;
			var str='';
			str='<select class="border2 border3" aria-label="Default select example" onchange="show2()" id="sbox2">';
			var areaList=data.getElementsByTagName('item');
			for(var i=0;i<areaList.length;i++){
				var area=areaList[i]; 
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
	location.href='cosList?cosArea='+area;
}
</script>

<style>
.a {
	margin-top: 200px;
}

.title:visited {
	color: black;
}

.title:link {
	color: black;
}

.img {
	width: 350px;
	height: 200px;
	border-radius: 25px;
}

.ul {
	white-space: nowrap;
	list-style-type: none;
}

.li {
	margin-left: 10px;
	margin-top: 5px;
	width: 340px;
	font-size: 17px;
	overflow: hidden;
	display: inline-block;
	text-overflow: ellipsis;
}

.table {
	width: 1100px;
}
.c{
	text-align: center;
}
</style>
</head>
<body onload="show1()">
<%@include file="/WEB-INF/views/header.jsp" %>
<div class="a">
	<h1>추천 코스</h1>
	
        <div>
           <select class="border2" aria-label="Default select example" onchange="show()" id="sbox">
		  <option value="2" ${cosArea==0?"selected":"" }>전체</option>
		  <option value="1" ${cosArea!=0?"selected":"" }>지역별</option>
		</select>
		<span id="sboxspan"></span>
        </div>
        
        <table class="table">
            <c:if test="${empty lists}">
                <tr>
                    <td>
                        등록된 코스가 없습니다.
                    </td>
                </tr>
            </c:if>
            <c:forEach var="dto" items="${lists}" varStatus="loop">
                <c:if test="${loop.index % 3 == 0}">
                    <tr>
                </c:if>
                <td>
                    <ul class="ul">
                        <a href="javascript:void(0);" onclick="show3(${dto.idx})" class="title">
                            <li><img src="${dto.cosImg}" class="img"/></li>
                            <li class="li">${dto.cosTitle}</li>
                        </a>
                    </ul>
                </td>
                <c:if test="${loop.index % 3 == 2 or loop.last}">
                    </tr>
                </c:if>
            </c:forEach>
        </table>
        <div class="c">
			<c:if test="${empty lists }">
			
			</c:if>
			<c:if test="${!empty lists }">
				${pageStr }
			</c:if>
		</div>
</div>

<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>