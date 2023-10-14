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
.input{
  border-color:#253BFF;
  padding:15px 20px;
  border-radius:25px;
  background:rgba(255,255,255,.1);
  margin-top: 20px;
  width: 300px;
}
.btn1{
  border:none;
  padding:15px 20px;
  border-radius:25px;
  background:#253BFF;
  margin-top: 40px;
  width: 350px;
  color: #fff;
  cursor: pointer;
  margin-bottom: 30px;
}
.btn1:hover{
  background-color: #38B6FF;
}
</style>
</head>
<body>
<div id="page-wrapper">
<%@ include file="/WEB-INF/views/ceo/ceoHeader.jsp" %>
  <!-- /사이드바 -->

  <!-- 본문 -->
  <div id="page-content-wrapper">
    <div class="container-fluid content1">
    	<div class="content2">
    		<h3>비밀번호 확인 후 수정 가능합니다</h3>
			<form name="ceoUpdForm" action="ceoUpdForm" method="post">
			<div class="group">
			  	<input type="password" style="margin-left:25px;" required id = "pwd" class="input" data-type="password" name = "userpwd" placeholder="비밀번호" maxlength ="20">
			</div>
			<div class="group">
			    <input type="submit" class="btn1" value="확인">
			  </div>
			</form> 
    	</div>
    </div>
    <%@include file="/WEB-INF/views/ceo/ceoFooter.jsp" %>
  </div>
  <!-- /본문 -->
</div>

</body>
</html>