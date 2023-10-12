<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.content{
  display: block;
  width: 900px; /* 원하는 너비로 조정 */
  margin-top: 160px; /* 가로 가운데 정렬 */
  margin-left:auto;
  margin-right:auto;

}
.title{
	border-radius: 25px;
	border-color: #253BFF;
	width:400px;
	height:45px;
	margin-top:20px;
	padding-left: 15px;
	padding-right:15px;
}
.shareContent{
	border-radius: 25px;
	border-color: #253BFF;
	border-width: 2px;
	margin-top: 40px;
	width:900px;
	padding-left: 15px;
	padding-right:15px;
	padding-top:15px;
	padding-bottom: 15px;
}
h4{
	color:#253BFF;
}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/header.jsp" %>
<div class="content">
<form name="shareForm" action="share">
<table class="share">
<tr><td><h4><strong>선택하신 일정에 대한 후기를 작성해주세요!</strong></h4><input type="hidden" value="${planIdx }"></td></tr>
<tr>
<td>
	<input type="text" name="shareTitle" class="title">
	</td>
	</tr><tr><td>
	<textarea rows="8" name="shareContent" class="shareContent"></textarea></td></tr>
	<tr><td align="right"><input type="submit" value="작성" style="background-color:#253BFF; 
	width:70px; height:40px; font-size:13px; color:white; border-radius: 15px; margin-top:15px;" ></td></tr>
</table>
</form>
</div>
<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>