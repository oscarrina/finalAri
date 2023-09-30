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
function show(){
	var cate=document.all.sbox.value;
	var param='cate='+cate;
	sendRequest('cateList', param, showResult,'GET');
	
}
function showResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			window.alert('test');
			var data=XHR.responseXML;
			
			var noticeList=data.getElementsByTagName('notice');
			var str='총 공지수:'+noticeList.length+'개\n';
			for(var i=0;i<noticeList.length;i++){
				var notice=noticeList[i]; //studentList.item(i)
				var title=notice.getElementsByTagName('title').item(0).firstChild.nodeValue;
				var content=((notice.getElementsByTagName('content'))[0]).lastChild.nodeValue;
				var cate=((notice.getElementsByTagName('cate'))[0]).lastChild.nodeValue;
				
				str+='제목:'+title+'/내용:'+content+'/cate:'+cate;
			}
			window.alert(str);
		}
	}
}

</script>
</head>
<body>
<div id="page-wrapper">
<%@ include file="../admin/adminHeader.jsp" %>
  <!-- /사이드바 -->

  <!-- 본문 -->
  <div id="page-content-wrapper">
    <div class="container-fluid content1">
      <h3>공지사항</h3>
		<select class="form-select" aria-label="Default select example" onchange="show()" id="sbox">
		  <option value="3" selected>전체</option>
		  <option value="1">사용자</option>
		  <option value="2">사업자</option>
		</select>
		<div class="d-grid gap-2 d-md-flex justify-content-md-end ">
			<button type="button" class="btn btn-primary" align="right"
			style="background-color:#3239AF; width:70px; height:40px; font-size:11px;" 
			onclick="javascript:location.href='noticeAdd'">등록</button>
		</div>


		<table class="table">
		  <thead>
		    <tr>
		      <th scope="col">#</th>
		      <th scope="col">First</th>
		      <th scope="col">Last</th>
		      <th scope="col">Handle</th>
		    </tr>
		  </thead>
		  <tfoot>
		  </tfoot>
		  <tbody>
		    <tr>
		      <th scope="row">1</th>
		      <td>글번호</td>
		      <td>제목</td>
		      <td>작성날짜</td>
		    </tr>
		    
		  </tbody>
		</table>
    </div>
    <%@include file="../admin/adminFooter.jsp" %>
  </div>
  <!-- /본문 -->
</div>

</body>
</html>