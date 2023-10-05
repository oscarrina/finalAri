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
<script type="text/javascript">
function bannerDel(bannerIdx) {
    if (confirm("배너를 삭제하시겠습니까?")) {
        $.ajax({
            type: "POST",
            url: "/bannerDel",
            data: { bannerIdx: bannerIdx }
        });
    }
    location.reload();
}
</script>

<style>
table {
  	border: 1px #213555 solid;
  	font-size: .9em;
  	box-shadow: 0 2px 5px rgba(0,0,0,.25);
  	width: 100%;
  	border-collapse: collapse;
  	border-radius: 25px;
	overflow: hidden;
  	margin-left: 100px;
  	margin-top: 100px;
  	text-align: center;
}

th {
  	text-align: left;
}
  
thead {
  	font-weight: bold;
  	color: #fff;
  	background: #213555;
}
  
 td, th {
  	padding: 1em .5em;
  	vertical-align: middle;
}
  
 td {
  	border-bottom: 1px solid rgba(0,0,0,.1);
 	background: #fff;
}
.btn1{
	border:none;
 	padding:15px 20px;
	border-radius:25px;
  	background:#3239AF;
  	margin-top: 10px;
  	margin-left: 1000px;
  	width: 100px;
  	color: #fff;
  	cursor: pointer;
}
.btn1:hover{
 	background-color: #686DB9;
}
.btn2{
	border:none;
 	padding:15px 20px;
	border-radius:25px;
  	background:#3239AF;
  	width: 70px;
  	color: #fff;
  	cursor: pointer;
}
.btn2:hover{
 	background-color: #686DB9;
}
.a{
	margin-left: 30px;
	margin-top:  50px;
}
.img{
	width: 300px;
	height: 100px;
}
</style>
</head>
<body>
<div id="page-wrapper">
<%@ include file="/WEB-INF/views/admin/adminHeader.jsp" %>
  <!-- /사이드바 -->

  <!-- 본문 -->
  <div id="page-content-wrapper">
    <div class="container-fluid" id="content1">
      <h1 class="a">배너 이미지 관리</h1>
      <table class="b" cellspacing="0">
      	<thead>
	      	<tr class="c">
	      		<th>배너 번호</th>
	      		<th>배너 이름</th>
	      		<th>배너 이미지</th>
	      		<th></th>
	      	</tr>
	     </thead>
	     <tbody>
		<c:if test="${empty files }">
			<tr>
				<td colspan="4" align="center">
				등록된 배너가 없습니다.
				</td>
			</tr>
		</c:if>
		<c:forEach var="dto" items="${lists }">
			<tr>
				<td>${dto.bannerIdx }</td>
				<td>${dto.bannerName }</td>
				<td><img src=" /imgs/${dto.bannerImg}" class="img"></td>
				<td><input type="button" value="삭제" class="btn2" onclick="bannerDel(${dto.bannerIdx})"></td>
			</tr>
		</c:forEach>
		</tbody>
      </table>
      <div><input type="button" value="등록" class="btn1" onclick="javascript:location.href='bannerUpload'"></div>
    </div>
    <%@include file="/WEB-INF/views/admin/adminFooter.jsp" %>
  </div>
  <!-- /본문 -->
</div>
</body>
</html>