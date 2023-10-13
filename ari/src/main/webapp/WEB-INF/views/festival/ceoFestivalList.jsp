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
<link rel="stylesheet" type="text/css" href="/css/festivalListLayout.css">
<script type="text/javascript" src="../../../js/httpRequest.js"></script>
<script>
function showType(){
	var type=document.all.sbox2.value;
	location.href='festival?type='+type;
	
}
</script>

</head>
<body>
<div id="page-wrapper">
<%@ include file="../ceo/ceoHeader.jsp" %>
  <!-- /사이드바 -->

  <!-- 본문 -->
  <div id="page-content-wrapper">
    <div class="container-fluid content1" >
      <h3>축제 목록</h3>
		<div class="content2">
		<select class="border2" style="width:120px;" aria-label="Default select example" name="type" onchange="showType()" id="sbox2">
			<option value="1" ${type==1?"selected":"" }>최근 등록순</option>
			<option value="2" ${type==2?"selected":"" }>제목순</option>
		</select>
			<div class="d-grid gap-2 d-md-flex justify-content-md-end ">
				<button type="button" class="btn btn-primary" align="right"
				style="background-color:#686DB9; width:70px; height:40px; font-size:11px; margin-top:-40px; margin-bottom:10px;" 
				onclick="javascript:location.href='festAdd'">등록</button>
			</div>
		<div class="content5">	
		<div class="content4">	
		<c:forEach var="dto" items="${lists }">
		  <table class="table">
			<tr>
				<c:if test="${dto.festapi==0 }"><td style="width:120px;" rowspan="3"><img class="poster" alt="" src="/imgs/${dto.festimg }"></td></c:if>
				<c:if test="${dto.festapi==1 }"><td style="width:120px;" rowspan="3"><img class="poster" alt="" src="${dto.festimg }"></td></c:if>
				<td class="title1">${dto.festtitle }</td>
				<td class="cont1" rowspan="3"><input type="button" class="btn2" value="상세" onclick="javascript:location.href='festCont?festidx=${dto.festidx}&type=2';"></td>
			</tr>
			<tr>
				<td class="tel1">${dto.festtelname }(tel.${dto.festtel })</td>
			</tr>
			<tr>
				<td class="addr1">${dto.festaddr }</td>
			</tr>
		  </table>
		</c:forEach>
		<div style="text-align: center;">
				<c:if test="${empty lists }">

				</c:if>
				<c:if test="${!empty lists }">
					${pageStr }
				</c:if>
		</div>
		</div>
		</div>
					
		</div>
    </div>
	<%@ include file="../ceo/ceoFooter.jsp" %>
  </div>
  <!-- /본문 -->
</div>

</body>
</html>