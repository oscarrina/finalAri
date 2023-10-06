<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
function show(){
	var cate=document.all.sbox.value;
	if(cate==2){
		location.href='fest?area=0';
	}else{
		sendRequest('getArea', null, showResult, 'GET');
	}	
}

function showResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			
			var data=XHR.responseXML;
			
			var spanTag=document.all.sboxspan;
			var sbox=document.all.sbox.value;
			let uarea=<c:out value="${area}" />;
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
	location.href='fest?area='+area;
}
</script>

</head>
<body>
<div id="page-wrapper">

<%@ include file="../admin/adminHeader.jsp" %>

  <!-- /사이드바 -->

  <!-- 본문 -->
  <div id="page-content-wrapper">
    <div class="container-fluid content1" >
      <h3>축제 목록</h3>
		<div class="content2">
		<select class="border2" aria-label="Default select example" onchange="show()" id="sbox">
		  <option value="2" ${area==0?"selected":"" }>전체</option>
		  <option value="1" ${area!=0?"selected":"" }>지역별</option>
		</select>
		<span id="sboxspan"></span>	

		<div class="content5">	
		<div class="content4">	
		  <c:forEach var="dto" items="${lists }">
		  <c:url var="conturl" value="festCont">
		    	<c:param name="festidx">${dto.festidx }</c:param>
		    	<c:param name="type">3</c:param>
		    </c:url>
		  <table class="table">
			<tr>
				<td style="width:120px;" rowspan="3"><img class="poster" alt="" src="/imgs/${dto.festimg }"></td>
				<td>${dto.festtitle }</td>
				<td rowspan="3"><a href="${conturl }">상세</a></td>
			</tr>
			<tr>
				<td>${dto.festtelname }(tel.${dto.festtel })</td>
			</tr>
			<tr>
				<td>${dto.festaddr }</td>
			</tr>
			</table>
		</c:forEach>
		<div align="center">${pageStr }</div>
		</div>
		</div>
					
		</div>
    </div>
	  
	<%@ include file="../admin/adminFooter.jsp" %>

  </div>
  <!-- /본문 -->
</div>

</body>
</html>