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
function show(type){
	var cate=document.all.sbox.value;
	if(cate==2){
		location.href='fest?type='+type+'&area=0';
	}else{
		sendRequest('getArea', null, showResult, 'GET');
	}	
}

function showResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			
			var data=XHR.responseXML;
			
			var spanTag=document.all.sboxspan;
			var str='';
			str='<select class="border2 border3" aria-label="Default select example" onchange="show2(${type})" id="sbox2">';
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
function show2(type){
	var area=document.all.sbox2.value;
	location.href='fest?type='+type+'&area='+area;
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
	
	margin-bottom: 20px;
}
.content4{
	margin-top:20px;
	margin-bottom:20px;
	margin-left:20px;
	
}
.border1{
	border: 1px solid #4068A7;
	border-radius: 10px;
}
.border2{
	border: 1px solid #4068A7;
	border-radius: 15px;
	width:80px;
	padding-top: 5px;
	padding-bottom: 5px;
}
.border3{
	
	width:150px;
	padding-top: 5px;
	padding-bottom: 5px;
}
svg{
	width:20px;
	height:25px;
}
.content3{
	width:600px; 
	height:300px !important;
    resize:none;
}

</style>
</head>
<body>
<div id="page-wrapper">
<c:if test="${type==2 }">
<%@ include file="../ceo/ceoHeader.jsp" %>
</c:if>
<c:if test="${type==3 }">
<%@ include file="../admin/adminHeader.jsp" %>
</c:if>
  <!-- /사이드바 -->

  <!-- 본문 -->
  <div id="page-content-wrapper">
    <div class="container-fluid content1" >
      <h3>축제 목록</h3>
		<div class="content2">
		<select class="border2" aria-label="Default select example" onchange="show(${type})" id="sbox">
		  <option value="2" selected>전체</option>
		  <option value="1">지역별</option>
		</select>
		<span id="sboxspan"></span>	
		<c:if test="${type==2 }">
			<div class="d-grid gap-2 d-md-flex justify-content-md-end ">
				<button type="button" class="btn btn-primary" align="right"
				style="background-color:#3239AF; width:70px; height:40px; font-size:11px; margin-top:-40px; margin-bottom:10px;" 
				onclick="javascript:location.href='festAdd'">등록</button>
			</div>
		</c:if>
		
		<div class="content5">	
		<div class="content4">	
		
		<table class="table">
		  <tfoot>
		  	<tr>
				<td colspan="3" align="center">
					${pageStr }
				</td>
			</tr>
		  </tfoot>
		  <tbody>
		    <c:if test="${empty lists }">
		    	<tr>
				<td colspan="6" align="center">
				등록된 공지사항이 없습니다.
				</td>
			</tr>
		    </c:if>
		    <c:forEach var="dto" items="${lists }">
			<tr>
				<!--반복적으로 보여줄 데이터-->
			</tr>
		</c:forEach>
		    
		  </tbody>
		</table>
		
			<img alt="이미지" src="/imgs/cute2.png">

		</div>
		</div>
					
		</div>
    </div>
	   <c:if test="${type==2 }">
	<%@ include file="../ceo/ceoFooter.jsp" %>
	</c:if>
	<c:if test="${type==3 }">
	<%@ include file="../admin/adminFooter.jsp" %>
	</c:if>
  </div>
  <!-- /본문 -->
</div>

</body>
</html>