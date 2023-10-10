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
	var jsonData = $.ajax({
		url: "getplanjson",
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
		width:600,
		height:440
	})
}
</script>
</head>
<body>
<div id="page-wrapper">
<%@ include file="/WEB-INF/views/admin/adminHeader.jsp" %>
  <!-- /사이드바 -->

  <!-- 본문 -->
  <div id="page-content-wrapper">
    <div class="container-fluid content1">
      <div id="chart_div"></div>
    </div>
    <%@include file="/WEB-INF/views/admin/adminFooter.jsp" %>
  </div>
  <!-- /본문 -->
</div>

</body>
</html>