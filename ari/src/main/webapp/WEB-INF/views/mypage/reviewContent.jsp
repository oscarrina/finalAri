<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.review{
	margin-top: 150px;
	margin-left:auto;
  	margin-right:auto;
	width: 900px;
}
#myform fieldset{
    margin-right:630px;	/*별점 위치*/
    direction: rtl;
}
#myform fieldset legend{
    text-align: right;
}
#myform input[type=radio]{
    display: none;
    
}
#myform label{
    font-size: 3em;
    color: transparent;
    text-shadow: 0 0 0 #f0f0f0;
    margin-bottom: 20px;
}
#myform label:hover{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform label:hover ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#reviewContents {
    width: 100%;
    height: 250px;
    padding: 10px;
    box-sizing: border-box;
    border: solid 1.5px #253BFF;
    border-radius: 25px;
    font-size: 16px;
    resize: none;
    box-shadow: none;
    padding-left: 15px;
    padding-right: 15px;
}
#refile {
	display: none;
	margin-left: 10px;
}

#btn2 {
  width: 40px;
  height: 40px;
  margin-left: 15px;
  margin-top: 18px;
  background: #fff;
  border: 1.5px solid #253BFF;
  border-radius: 10px;
  font-size:40px;
  padding-bottom: 10px;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
}
#btn2:hover {
  border: 1.5px solid #38B6FF;
  background: #38B6FF;
  color: #253BFF;
}
.btn1{
  border:none;
  padding:15px 20px;
  border-radius:25px;
  background:#253BFF;
  margin-top: 40px;
  margin-left: 800px;
  width: 100px;
  color: #fff;
  cursor: pointer;
}
.btn1:hover{
  background-color: #38B6FF;
}
.a {
    border:1.5px solid;
	margin-top:20px;
	border-radius:25px;
	border-color:#253BFF;
	width: 900px;
	display: flex;
    align-items: center;
    margin-left: -10px;
    height: 60px;
}
#fileName{
	margin-left: 15px;
	margin-top: 15px;
}
</style>
<script>
function loadFile(input) {
    var file = input.files[0];

    var name = document.getElementById('fileName');
    name.textContent = file.name;
}
</script>
</head>
<body>
<%@include file="/WEB-INF/views/header.jsp" %>
<div class="review">
	<h3>리뷰 등록</h3>
	<form class="mb-3" action="reviewContent" name="myform" id="myform" method="post" enctype="multipart/form-data">
	<input type="hidden" value="${berthidx }" name="berthidx">
	<input type="hidden" value="${reseridx }" name="reseridx">
	<fieldset>
		<input type="radio" name="reviewScore" value="5" id="rate1"><label
			for="rate1">★</label>
		<input type="radio" name="reviewScore" value="4" id="rate2"><label
			for="rate2">★</label>
		<input type="radio" name="reviewScore" value="3" id="rate3"><label
			for="rate3">★</label>
		<input type="radio" name="reviewScore" value="2" id="rate4"><label
			for="rate4">★</label>
		<input type="radio" name="reviewScore" value="1" id="rate5"><label
			for="rate5">★</label>
	</fieldset>
	<div>
		<textarea class="col-auto form-control" type="text" id="reviewContents"
				name="reviewContent"  placeholder="내용을 입력하세요."></textarea>
	</div>
	<div class="container">
	<div class="a">
    	<label for="refile" id="btn2">+</label>
		<input type="file" name="review" id="refile" onchange="loadFile(this)">
		<span class="fileInput"><p id="fileName"></p></span>
    </div>
    </div>
    <div>
    	<input type="submit" class="btn1" value="등록">
    </div>
</form>		
</div>
<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>