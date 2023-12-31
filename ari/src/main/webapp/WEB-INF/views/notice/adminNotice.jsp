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
<link rel="stylesheet" type="text/css" href="/css/adminNotice.css">
<script type="text/javascript" src="../../../js/httpRequest.js"></script>
<script>
function show(){
	var cate=document.all.sbox.value;
	var param='type='+cate;
	location.href='notice?'+param;
}
</script>
</head>
<body>
<div id="page-wrapper">
<%@ include file="../admin/adminHeader.jsp" %>
  <!-- /사이드바 -->
  
  <!-- 본문 -->
  <div id="page-content-wrapper">
    <div class="container-fluid">
      	<div class="content2">
      	<h3>공지사항</h3>
      	<select class="form-select border1" aria-label="Default select example" onchange="show()" id="sbox">
		  <option value="3" ${type==3?"selected":"" }>전체</option>
		  <option value="1" ${type==1?"selected":"" }>사용자</option>
		  <option value="2" ${type==2?"selected":"" }>사업자</option>
		</select>
      	</div>
		<div class="d-grid gap-2 d-md-flex justify-content-md-end ">
			<button type="button" class="btn btn-primary" align="right"
			style="background-color:#3239AF; width:70px; height:40px; font-size:11px; margin-top:-40px; margin-bottom:10px;" 
			onclick="javascript:location.href='noticeAdd'">등록</button>
		</div>
		<table class="table">
		  <thead>
		    <tr>
		      <th scope="col">번호</th>
		      <th scope="col">카테고리</th>
		      <th scope="col">제목</th>
		      <th scope="col">작성자</th>
		      <th scope="col">작성날짜</th>
		    </tr>
		  </thead>
		  <tfoot>
		  	<tr>
				<td colspan="5" align="center">
					<c:if test="${empty lists }">
				
					</c:if>
					<c:if test="${!empty lists }">
						${pageStr }
					</c:if>
				</td>
			</tr>
		  </tfoot>
		  <tbody>
		    <c:if test="${empty lists }">
		    	<tr>
				<td colspan="5" align="center">
				등록된 공지사항이 없습니다.
				</td>
			</tr>
		    </c:if>
		    <c:forEach var="dto" items="${lists }">
			<tr>
				<c:choose>
					<c:when test="${dto.noticetop==1 }">
						<td><span style="color:#3239AF"><strong>공지</strong></span></td>
					</c:when>
					<c:when test="${dto.noticetop==0 }">
						<td>${dto.noticeidx }</td>
					</c:when>
				</c:choose>
					<c:choose>
						<c:when test="${dto.noticetype==1 }">
							<td>사용자</td>
						</c:when>
						<c:when test="${dto.noticetype==2 }">
							<td>사업자</td>
						</c:when>
						<c:when test="${dto.noticetype==3 }">
							<td>전체</td>
						</c:when>
					</c:choose>
				<c:url var="contentUrl" value="noticeCont">
					<c:param name="noticeidx">${dto.noticeidx }</c:param>
				</c:url>
				<td><a href="${contentUrl }" class="underline">${dto.noticetitle }</a></td>
				<td>${dto.adminid }</td>
				<td>${dto.noticedate }</td>
			</tr>
		</c:forEach>
		    
		  </tbody>
		</table>
    </div>
    <%@include file="../admin/adminFooter.jsp" %>
  </div>
  <!-- /본문 -->
  
</div>

</body>
</html>