<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript" src="../../../../js/httpRequest.js"></script>
<link rel="stylesheet" type="text/css" href="/css/adminMainLayout.css">
<script type="text/javascript">

//구글 차트 라이브러리 로딩
google.load("visualization", "1",{
	"packages":["corechart"]
});

google.setOnLoadCallback(drawChart);
function drawChart(){
	var start=document.all.start.value;
	var end=document.all.end.value;
	var param="?start="+start+"&end="+end;
	var jsonData = $.ajax({
		url: "getplanjson"+param,
		dataType:"json",
		async:false
	}).responseText;
	
	
	console.log("objdata : " + jsonData);
	
	//1) 데이터 테이블 생성
	var data = new google.visualization.DataTable(jsonData);
	
	//2) 차트 출력할 영역 지정
	var chart = new google.visualization.ColumnChart(document.getElementById("chart_div"));
	//1) + 2) => 차트 출력! 차트객체.draw(데이터테이블, 옵션)
	//curveType : "function" => 곡선
	chart.draw(data,{
		title:"차트 예제",
		curveType:"function",
		width:1100,
		height:440
	})
}
</script>
<style>
.border1{
	border-top:none;
	border-left:none;
	border-right:none;
	border-bottom: 2px solid #4068A7;
	border-radius: 0;
	margin-top: 5px;
	margin-bottom:5px;
	
}
.content2{
	width:1100px !important;
}
.btn1{
	margin-top:6px !important;
}
.mg1{
	margin-top:90px;
	margin-right:60px;
	margin-bottom:50px;
}
</style>
</head>
<body>
<div id="page-wrapper">
<%@ include file="/WEB-INF/views/admin/adminHeader.jsp" %>
  <!-- /사이드바 -->

  <!-- 본문 -->
  <div id="page-content-wrapper">
    <div class="container-fluid content1">
    	<div class="content2">
    		<form name="chart" action="chart" method="post">
    		<div class="d-grid gap-2 d-md-flex justify-content-end mg1">
	    		<input type="date" class="form-control border1 width1" id="start" style="width:180px" name="start" value="${start }" required="required" >
	    		<input type="date" class="form-control border1 width1" id="end" style="width:180px" name="end" value="${end }" required="required" >
				<input type="submit" class="btn btn-primary btn1" align="right"
				style="background-color:#686DB9; width:70px; height:35px; font-size:11px; margin-top:-40px; 
				margin-bottom:10px;" value="확인">
			</div>
    	</form>
      <div id="chart_div"></div>
    	</div>
    </div>
    <%@include file="/WEB-INF/views/admin/adminFooter.jsp" %>
  </div>
  <!-- /본문 -->
</div>

</body>
</html>