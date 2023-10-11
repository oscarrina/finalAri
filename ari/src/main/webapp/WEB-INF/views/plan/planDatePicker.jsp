<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
body{
	margin: 0px auto;
}
main{
	margin-top: 150px;
	
}
</style>
<script>
function getFormatDate(date){
    var year = date.getFullYear();              //yyyy
    var month = (1 + date.getMonth());          //M
    month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
    var day = date.getDate();                   //d
    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
    return  year + '-' + month + '-' + day;       //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
}
window.onload = function(){
	var date = new Date();
	document.getElementById("start").value = getFormatDate(date);
	document.getElementById("start").setAttribute("min",getFormatDate(date));
	document.getElementById("end").setAttribute("min",getFormatDate(date));
}
function dateCal(date){
	var ndate = new Date(date);
 	var result = ndate / (1000 * 60 * 60 * 24);
    return result;
}

function dateminu(date1, date2){
	var startDate1 = new Date(date1);
	var endDate2 = new Date(date2);
	
	var dateP = endDate2 - startDate1;
    var result = dateP / (1000 * 60 * 60 * 24);

    return result;
}

function end(start){
	var startValue = start.value;
	var endValue = document.getElementById("end").value;
	if (dateCal(endValue) < dateCal(startValue)){
		endValue = startValue
	}
	document.getElementById("end").setAttribute("min",startValue);
}


</script>
<body>
<%@include file="/WEB-INF/views/header.jsp"%>
<main>
	<div class ="head">
		<div>출발일</div>
		<div>도착일</div>
	</div>
	<div class = "body">
		<div class = "date"><input type = "date" id = "start" onchange = "end(this)"></div>
		<div class = "date"><input type = "date" id = "end"></div>
	</div>
	<div class = "foot">
	
	</div>
</main>
<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>