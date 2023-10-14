<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
#myInfo{
	color: #253BFF;
}
.dddd{
	margin-top:150px;
	display: inline-block;
	width: 75%;
	height: 100vh;
	float: right;
	
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
<%@include file="/WEB-INF/views/header.jsp" %>
<%@include file="/WEB-INF/views/mypage/mypageSide.jsp" %>
<div class="dddd">
<h3>비밀번호 확인 후 수정 가능합니다</h3>
<form name="userUpdForm" action="userUpdForm" method="post">
<div class="group">
  	<input type="password" style="margin-left:25px;" required id = "pwd" class="input" data-type="password" name = "userpwd" placeholder="비밀번호" maxlength ="20">
</div>
<div class="group">
    <input type="submit" class="btn1" value="확인">
  </div>
</form> 
</div>
<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>