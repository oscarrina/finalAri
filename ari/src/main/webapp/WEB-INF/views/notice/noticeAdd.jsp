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
<script type="text/javascript" src="../../../js/httpRequest.js"></script>
<script>
var check="";
function checkTop(){
	check=document.noticeAdd.noticetop.checked;
	var cate=document.noticeAdd.noticetype.value;
	var param="cate="+cate;
	if(check==true){
		sendRequest('topCheck', param, showResult,'GET');
	}else{
		var spanTag=document.all.topmsg;
		spanTag.innerHTML='<input type="hidden" name="topcheck" value="pass">'
	}
}
function showResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			
			var data=XHR.responseText;
			var spanTag=document.all.topmsg;
			
			var str='';
			if(data==0){
				str='<input type="hidden" name="topcheck" value="pass">';
			}else{
				str='<div class="alert alert-danger d-flex align-items-cente" role="alert">';
				str+='<svg xmlns="http://www.w3.org/2000/svg" class="bi bi-exclamation-triangle-fill flex-shrink-0 me-2" viewBox="0 0 16 16" role="img" aria-label="Warning:">';
				str+='<path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>';
				str+=' </svg><div>&nbsp;';
				//str='<p style="color:red;">';
				str+=data;
				//str+='</p><input type="hidden" name="topcheck" value="fail">';
				str+=' </div></div>';
			}
			spanTag.innerHTML=str;

		}
	}
}

</script>
<style>
.contentwidth{
	width:70%;
}
.content2{
	margin-top: 30px;
}
.border1{
	border: 1px solid #4068A7;
	border-radius: 10px;
}
svg{
	width:20px;
	height:25px;
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
		<div class="content2">	
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
			  <select class="form-select border1" aria-label="Default select example" name="noticetype" id="sbox" onchange="checkTop()">
				  <option value="3" selected>전체</option>
				  <option value="1">사용자</option>
				  <option value="2">사업자</option>
			  </select>
		    </div>
		    <label for="staticEmail" class="col-sm-2 col-form-label">고정여부</label>
		    <div class="col-sm-10" style="padding-left:35px;">
			  <input class="form-check-input" type="checkbox" name="noticetop" id="flexCheckDefault" onclick="checkTop()">
			  <label class="form-check-label" for="flexCheckDefault">
			   공지사항 고정<span id="topmsg"></span>
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
			<div class="d-grid gap-2 d-md-flex justify-content-md-end contentwidth">
				<button type="button" class="btn btn-primary" 
				style="background-color:#666CDE; width:70px; height:40px; font-size:11px;" onclick="javascript:history.go(-1)">취소</button>&nbsp;&nbsp;
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