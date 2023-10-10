<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/adminMainLayout.css">
<link rel="stylesheet" type="text/css" href="/css/adminNotice.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src = "js/httpRequest.js"></script>
<script>
function cancel(idx){
	swal({
		  title: "아리아리",
		  text: "예약을 취소하시겠습니까?",
		  icon: "warning",
		  buttons: true,
		  dangerMode: true,
		})
		.then((willDelete) => {
			if (willDelete) {
	            swal("예약이 취소되었습니다.", {
	              icon: "success",
	            }).then((aaa) => {
	              let userType = document.getElementById("userType").value;
	                let param = "param="+idx+"&userType="+userType;
	            	sendRequest('reserCancel',param,showResult,'GET');
				});
	          }
		});
}
function showResult(){
	if(XHR.readyState == 4){
		if(XHR.status == 200){
			let data = XHR.responseText;
			if(data == '성공'){
				location.href = 'reserManager';
			}else{
				swal('아리아리','다시 시도해주세요');
			}
		}else{
			swal('아리아리','관리자에게 문의바랍니다.');
		}
	}
}
</script>
</head>
<body>
<div id="page-wrapper">
<%@ include file="ceoHeader.jsp" %>
  <!-- /사이드바 -->

  <!-- 본문 -->
  <div id="page-content-wrapper">
    <div class="container-fluid content1">
      <h3>예약 관리</h3>
      <div class="mypagePlan">
      <c:if test="${empty list }">
      <h1>예약이 없습니다. 분발하세요</h1>
      </c:if>
      <c:if test="${not empty list }">
      <c:forEach var="dto" items="${list }">
<table class="reserTable">
<tr>
<td class="reserClass"><img alt="숙박업체이미지" src="/img/${dto.berthInfoImg }" class="mypageImg"></td>
<td class="reserInfo">
<ul class="planInfo">
	<li class="planSi">${dto.berthInfoName }</li>
	<li class="planSubject">${dto.berthName }</li>
	<li class="planSubject">${dto.reserPer }명</li>
	<li class="planDay">${dto.reserVisitStart } ~ ${dto.reserVisitEnd }</li>
</ul>
</td>
<td class="planPrice"><label>가격 : ${dto.reserPrice }</label>
<button class="btn btn-secondary myPlanCategory" type="button" data-bs-toggle="dropdown" aria-expanded="false">
   <i class="bi bi-caret-down-fill categoryI"><span class="userInfo">사용자정보</span></i>
  </button>
  <ul class="dropdown-menu">
    <li><a class="dropdown-item">예약자 : ${dto.reserName }</a></li>
    <li><a class="dropdown-item">연락처 : ${dto.reserTel }</a></li>
  </ul>
  </td>
  <td>
  <c:if test="${dto.reserVisitStart > now }">
  <c:if test="${dto.reserState == 1 }">
  <button type="button" class="btn btn-primary reserCancelBtn" onclick="cancel(${dto.reserIdx })">
  예약취소
  </button>
  </c:if>
  <c:if test="${dto.reserState == 0 }">
  <span class="planDay">취소완료</span>
  </c:if>
  </c:if>
  </td>
  </tr>
  </table>
  <input type="hidden" id="userType" value="ceo">
  </c:forEach>
  </c:if>
</div>
    </div>
    <%@include file="ceoFooter.jsp" %>
  </div>
  <!-- /본문 -->
</div>
</body>
</html>