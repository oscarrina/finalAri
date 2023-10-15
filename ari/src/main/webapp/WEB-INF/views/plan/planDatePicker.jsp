<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>\
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src ="/js/httpRequest.js"></script>
</head>
<style>
html{
	user-select: none;
}
.main{
	margin-top: 150px;
}
.divHead, .divBody{
	display:flex;
}
.divHead #area{
	width: 150px;
	margin-left: -75px;
	margin-right: -75px;
	font-weight: bold; 
}
.divHead div, .divBody div{
	margin:0px auto;
	width:30%;
	padding:30px;
	text-align : center;
	border-style: groove;
}
.divBody{
	height: 150px;
}
#start, #end{
	width :200px;
	height:50px;
	border-radius: 15px;
	text-align:center;
	padding-right: 10px;
}
#start:hover, #end:hover{
 	background-color: #CCCCFF;
}
.submitButton{  
	border:none;
 	padding:15px 20px;
 	border-radius:25px;
 	background:#253BFF;
 	width: 350px;
	color: #fff;
 	cursor: pointer;
}
.divFoot{
	margin: 0px auto;
	margin-top:10px;
	width: 60%;
	text-align:center;	
}

</style>
<script>
function getFormatDate(date){
    var year = date.getFullYear();          
    var month = (1 + date.getMonth());        
    month = month >= 10 ? month : '0' + month; 
    var day = date.getDate();                  
    day = day >= 10 ? day : '0' + day;         
    return  year + '-' + month + '-' + day;     
}

window.onload = function(){
	var date = new Date();
	document.getElementById("start").setAttribute("min",getFormatDate(date));
	document.getElementById("end").setAttribute("min",getFormatDate(date));
	
	sendRequest("getArea",null,showArea,"GET");
}
function showArea(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data=XHR.responseXML;
			var uarea=<c:out value="${area}" />;
			var areaList=data.getElementsByTagName('item');
			for(var i=0;i<areaList.length;i++){
				var area=areaList[i]; //studentList.item(i)
				var code=area.getElementsByTagName('code').item(0).firstChild.nodeValue;
				var name=area.getElementsByTagName('name').item(0).firstChild.nodeValue;
				if(code==uarea){
					document.getElementById("area").innerHTML = name;
				}
			}
		}
	}
}

function endDateCal(start){
	var startValue = start.value;
	var date = new Date(startValue);
	var endValue = document.getElementById("end").value;
	var calStartDate = dateCal(startValue);
	console.log(dateCal(endValue));
	console.log(dateCal(startValue));
	
	if (dateCal(endValue) < calStartDate){
		document.getElementById("end").value = startValue;
	}
	document.getElementById("end").setAttribute("min",startValue);
	document.getElementById("end").setAttribute("max",dateOneWeek(calStartDate));	
}
function dateOneWeek(timeStamp){
	var oneWeek = timeStamp +(1000*60*60*24*7);
	var getTime = new Date(oneWeek);
	var date = getFormatDate(getTime);
	return date;
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

function goPlanMap(){
	var startDate = document.getElementById("start").value;
	var endDate = document.getElementById("end").value;
	var result = dateminu(startDate, endDate)+1;
	location.href = "planMap?dateRange="+result+"&area="+${area}+"&start="+startDate+"&end="+endDate;
}
</script>
<body>
<%@include file="/WEB-INF/views/header.jsp"%>
<form name = fm action = "planMap">
<main class = "main">
	<div class ="divHead">
		<div>출발하는 날</div>
		<div id = "area"></div>
		<div>돌아오는 날</div>
	</div>
	<div class = "divBody">
		<div class = "date"><input type = "date" id = "start" oninput= "endDateCal(this)" name = "startDate"></div>
		<div class = "date"><input type = "date" id = "end" name = "endDate"></div>
	</div>
	<div class = "divFoot">
	<input type = "button" class = "submitButton" value = "일정 선택 완료" onclick = "goPlanMap()">
	</div>
</main>
<%@include file="/WEB-INF/views/footer.jsp" %>
</form>
</body>
</html>