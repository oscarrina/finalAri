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
<style>
.content{
  display: block;
  width: 900px; /* 원하는 너비로 조정 */
  margin-top: 150px; /* 가로 가운데 정렬 */
  margin-left:auto;
  margin-right:auto;
}
#exampleSelect1{
	width:220px;
	border-color:blue;
	text-align: center;
	border-radius: 30px;
}
#qnaTitle{
	width:400px;
	height:40px;
	border-color:blue;
	border-radius:30px;
	margin-top:20px;
	text-align: center;
}
#exampleTextarea{
	margin-top:20px;
	border-radius:25px;
	border-color:blue;
}
table{
	margin-top: 30px;
	margin-bottom: 60px;
}
</style>
</head>
<body>
<div id="page-wrapper">
<%@ include file="../ceo/ceoHeader.jsp" %>
  <!-- /사이드바 -->

  <!-- 본문 -->
  <div id="page-content-wrapper">
    <div class="container-fluid" id="content1">
     <div class="content">
<h4>관리자에게 문의하기</h4>
<form name="writeqform" action="ceoWriteQ">
<table width="900px">
<tr>
	<td>
		<select class="form-select" id="exampleSelect1" name="qnaCategory">
	   		<option value="1" selected="selected">이용문의</option>
	   		<option value="2">제휴</option>
	   		<option value="3">사업자정보</option>
	  	    <option value="4">기타</option>
		</select>
	</td>
	<td align="right">
		<button type="submit" class="btn btn-primary" style="background-color:#666CDE; width:70px; height:40px; font-size:13px;">등록</button>
	</td>
</tr>
<tr>
	<td>
		<input type="text" name="qnaTitle" id="qnaTitle" placeholder="제목을 입력하세요.">
	</td>
</tr>
<tr>
	<td colspan="2">
	<textarea class="form-control" id="exampleTextarea" rows="8" name="qnaContent" placeholder="내용을 입력하세요."></textarea>
	</td>
</tr>
</table>     
</form>     
</div>
    </div>
    <%@include file="../ceo/ceoFooter.jsp" %>
  </div>
  <!-- /본문 -->
</div>

</body>
</html>