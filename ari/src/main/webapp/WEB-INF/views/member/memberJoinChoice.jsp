<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<style>
  .top-container{
	  width:100%;
	  margin:auto;
	  max-width:525px;
	  min-height:470px;
	  position:relative;
  }
  .btn1{
	  border:none;
	  padding:15px 20px;
	  border-radius:25px;
	  background:#253BFF;
	  margin-top: 40px;
	  width: 250px;
	  color: #fff;
	  cursor: pointer;
  }
  .btn1:hover{
  	  background-color: #38B6FF;
  }
  .signChoicecontainer{
 	  display:flex;
  }
</style>
</head>
<body>
<div class="top-container">
	<div><img src = "/img/logo.png"></div>
	<div class= "signChoiceContainer">
		<div>
			<ul>
				<li>사용자 회원가입</li>
				<li><input type = "button" class = "btn1" value="가입하기" onclick = "script: location.href = 'memberJoin?userType=1'"></li>
			</ul>
		</div>
		<div>
			<ul>
				<li>사업자 회원가입</li>
				<li><input type = "button" class = "btn1" value = "가입하기" onclick = "script: location.href = 'memberJoin?userType=2'"></li>
			</ul>
		</div>
	</div>	
</div>
</body>
<%@include file = "/WEB-INF/views/footer.jsp"%>
</html>