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
<link rel="stylesheet" type="text/css" href="/css/adminMainLayout.css">
<script>
</script>
<style>
.b{
	margin-left: 150px;
	margin-top: 100px;
}
.c{
	width:400px;
	height:45px;
	border:1px solid;
	border-color:#253BFF;
	border-radius:30px;
	margin-top:20px;
}
.bannerName{
	margin-left: 5px;
	margin-top: 2px;
	border-width: 0px 0px 0px 1px;
	border-color: #253BFF;
	height: 40px;
	outline: none;
}
.a{
	border:1px solid;
	margin-top:20px;
	border-radius:25px;
	border-color:#253BFF;
	width: 400px;
	
}
.btn2 {
  width: 40px;
  height: 40px;
  margin-left: 30px;
  margin-top: 7px;
  background: #fff;
  border: 1px solid rgb(77,77,77);
  border-radius: 10px;
  font-size:40px;
  padding-bottom: 10px;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
}
.btn2:hover {
  background: #4d4d4d;
  color: #fff;
}
#bannerImg {
	display: none;
	margin-left: 10px;
}

.d{
	margin-top: 10px;
	margin-bottom: 10px;
	margin-left: 15px;
	margin-right: 5px;
}
.btn1{
  border:none;
  padding:15px 20px;
  border-radius:25px;
  background:#253BFF;
  margin-top: 40px;
  margin-left: 300px;
  width: 100px;
  color: #fff;
  cursor: pointer;
}
.btn1:hover{
  background-color: #38B6FF;
}
</style>
</head>
<body>
<div id="page-wrapper">
<%@ include file="/WEB-INF/views/admin/adminHeader.jsp" %>
  <div id="page-content-wrapper">
    <div class="container-fluid" id="content1">
    <h1>배너 등록</h1>
    <form name="bannerUpload" action="bannerUpload" method="post" enctype="multipart/form-data" class="b">
    <div class="c">
    	<span class="d">배너 이름</span> <input type="text" name="bannerName" class="bannerName" placeholder="  제목을 입력하세요.">
    </div>
    
    <div class="a">
    	<label for="bannerImg" class="btn2">+</label>
		<input type="file" name="bannerImg" id="bannerImg">
    </div>
    <div>
    	<input type="submit" class="btn1" value="등록">
    </div>
    </form>
    </div>
    <%@include file="/WEB-INF/views/admin/adminFooter.jsp" %>
  </div>
  <!-- /본문 -->
</div>
</body>
</html>