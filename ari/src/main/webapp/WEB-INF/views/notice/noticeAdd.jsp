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
.contentwidth{
	width:600px;
}
.content2{
	margin-top: 30px;
}
.border1{
	border: 1px solid #4068A7;
	border-radius: 10px;
}
</style>
</head>
<body>
<div id="page-wrapper">
<%@ include file="../admin/adminHeader.jsp" %>
  <!-- /사이드바 -->

  <!-- 본문 -->
  <div id="page-content-wrapper">
    <div class="container-fluid content1" >
      <h3>공지사항 등록</h3>
		<form name="noticeAdd" action="noticeAdd" method="post">
		<div class="cotent2">	
		  <div class="mb-3 row">
		    <label for="staticEmail" class="col-sm-2 col-form-label">작성자</label>
		    <div class="col-sm-10">
		      <input type="text" readonly class="form-control-plaintext" id="staticEmail" name="adminid" value="${adminid}">
		    </div>
		    <label for="staticEmail" class="col-sm-2 col-form-label">작성날짜</label>
		    <div class="col-sm-10">
		      <input type="text" readonly class="form-control-plaintext" id="staticEmail" name="noticedate" value="${date}">
		    </div>
		    <label for="staticEmail" class="col-sm-2 col-form-label">분류</label>
		    <div class="col-sm-10">
			  <select class="form-select border1" aria-label="Default select example" name="noticetype" id="sbox">
				  <option value="3" selected>전체</option>
				  <option value="1">사용자</option>
				  <option value="2">사업자</option>
			  </select>
		    </div>
		    <label for="staticEmail" class="col-sm-2 col-form-label">고정여부</label>
		    <div class="col-sm-10">
			  <input class="form-check-input" type="checkbox" name="noticetop" id="flexCheckDefault">
			  <label class="form-check-label" for="flexCheckDefault">
			   공지사항 고정
			  </label>
		    </div>
		  </div>
		  
		  <div class="mb-3">
			  <label for="exampleFormControlInput1" class="form-label">제목</label>
			  <input type="text" class="form-control contentwidth border1" name="noticetitle" id="exampleFormControlInput1" placeholder="공지사항 제목">
			</div>
			<div class="mb-3">
			  <label for="exampleFormControlTextarea1" class="form-label">내용</label>
			  <textarea class="form-control contentwidth border1" name="noticecontent" id="exampleFormControlTextarea1" rows="5"></textarea>
			</div>
			<div class="d-grid gap-2 d-md-flex justify-content-md-end ">
				<button type="button" class="btn btn-primary" 
				style="background-color:#666CDE; width:70px; height:40px; font-size:11px;" >취소</button>
				<input type="submit" value="등록" class="btn btn-primary" 
				style="background-color:#3239AF; width:70px; height:40px; font-size:11px;">

			</div>
		  </div>
		</form>
    </div>
    <%@include file="../admin/adminFooter.jsp" %>
  </div>
  <!-- /본문 -->
</div>

</body>
</html>