<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
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
function showDel(idx, type){
	location.href='noticeDel?noticeidx='+idx+'&noticetype='+type;
}
function showUpd(idx){
	location.href='noticeUpd?noticeidx='+idx;
}
</script>
<style>
.table1{
	border: 2px solid #4068A7;
	border-collapse:separate;
	border-radius: 10px;
	width:90%;
	margin-top:50px;
	margin-bottom:20px;
	align:left;
	text-align: left;
}

.th1{
	width:15%;
	padding-left: 10px;
	text-align:center;
	border-bottom:2px solid #B7B9DD;
}
.td1{
	width:30%;
	border-bottom:1px solid #B7B9DD;
}
.td2{
	border-bottom:1px solid #B7B9DD;
}
.thtd1{
	padding-top: 10px;
	padding-bottom: 10px;
	
	
}
.thtd2{
	
	
}
.thtd3{
	border-bottom:2px solid #B7B9DD;
	
}
.contentwidth{
	width:80%;
	align:left;
}
.content2{
	margin-right: 200px;
}
.border1{
	border: 1px solid #4068A7;
	border-radius: 10px;
}
svg{
	width:20px;
	height:25px;
}

.btn1{
	align:left;
}
.content3{
	width:500px;
	height:300px;
}
.btn2{
	border-top: none;
	border-bottom: none;
	border-left: none;
	border-right: none;
}
.p1{
	padding-left:10px;
	padding-top:10px;
	background-color: #D9D9D9;
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
    <div class="container-fluid content1 content2" >
      <h3>공지사항 상세</h3>
		<table class="table1">
			<tr>
				<th class="th1 thtd1 thtd2 thtd3">제목</th>
				<td class="td2 thtd1 thtd2" colspan="3">${dto.noticetitle }</td>
			</tr>
			<tr>
				<th class="th1 thtd1 thtd2">글번호</th>
				<td class="td1 thtd1 thtd2 td2">${dto.noticeidx }</td>	
				<th class="th1 thtd1 thtd2">작성날짜</th>
				<td class="thtd1 thtd2 td2">${dto.noticedate }</td>
			</tr>
			<tr>
				<th class="th1 thtd1 thtd2">카테고리</th>
				<c:choose>
						<c:when test="${dto.noticetype==1 }">
							<td class="td1 thtd1 thtd2 td2">사용자</td>
						</c:when>
						<c:when test="${dto.noticetype==2 }">
							<td class="td1 thtd1 thtd2 td2">사업자</td>
						</c:when>
						<c:when test="${dto.noticetype==3 }">
							<td class="td1 thtd1 thtd2 td2">전체</td>
						</c:when>
				</c:choose>
				<th class="th1 thtd1 thtd2">작성자</th>
				<td class="thtd1 thtd2 td2">${dto.adminid }</td>
			</tr>
			<tr>
				<th class="th1 thtd1 thtd2">고정여부</th>
				<c:choose>
					<c:when test="${dto.noticetop==1 }">
						<td colspan="3" class="td1 thtd1 thtd2 td2"><span style="color:#3239AF">고정된 공지</span></td>
					</c:when>
					<c:when test="${dto.noticetop==0 }">
						<td colspan="3" class="td1 thtd1 thtd2 td2">일반 공지</td>
					</c:when>
				</c:choose>	
			</tr>
			
			<tr>
				<th class="th1 thtd1" valign="top" align="center" style="border-bottom:none;">내용</th>
				<td colspan="3" align="left" class=" thtd1">
					<p class="content3 p1">${dto.noticecontent}</p>
				</td>
			</tr>
		</table>
			<div class="d-grid gap-2 d-md-flex justify-content-center contentwidth">
			<button type="button" class="btn btn-primary btn1 btn2" 
				style="background-color:#D9D9D9; width:70px; height:40px; font-size:11px; color:black; " onclick="javascript:history.go(-1)">뒤로가기</button>&nbsp;&nbsp;
				<button type="button" class="btn btn-primary btn2" 
				style="background-color:#666CDE; width:70px; height:40px; font-size:11px; " onclick="showDel(${dto.noticeidx},${dto.noticetype})">삭제</button>&nbsp;&nbsp;
				<button type="button" class="btn btn-primary btn2" 
				style="background-color:#3239AF; width:70px; height:40px; font-size:11px;" onclick="showUpd(${dto.noticeidx})">수정</button>
			</div>
    </div>
    <%@include file="../admin/adminFooter.jsp" %>
  </div>
  <!-- /본문 -->
</div>

</body>
</html>