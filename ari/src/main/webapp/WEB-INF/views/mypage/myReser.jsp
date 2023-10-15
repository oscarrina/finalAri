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
function cancel(idx,berthIdx,reserPrice,reserPaymentKey){
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
	                let param = "idx="+idx+"&berthIdx="+berthIdx+"&userType="+userType+
	                "&reserPrice="+reserPrice+"&reserPaymentKey="+reserPaymentKey;
	            	sendRequest('reserCancel',param,showResult,'POST');
				});
	          }
		});
}
function showResult(){
	if(XHR.readyState == 4){
		if(XHR.status == 200){
			let data = XHR.responseText;
			if(data == '성공'){
				location.href = 'myReser';
			}else{
				swal('아리아리','다시 시도해주세요');
			}
		}else{
			swal('아리아리','관리자에게 문의바랍니다.');
		}
	}
}
</script>
<style>
#myReser{
	color: #253BFF;
}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/header.jsp" %>
<%@include file="/WEB-INF/views/mypage/mypageSide.jsp" %>
<div class="mypageReserDiv">
<h3>예약 내역</h3>
<div class="mypagePlan">
      <c:if test="${empty list }">
      <h1>예약이 없습니다.</h1>
      </c:if>
      <c:if test="${not empty list }">
<table class="reserTable">
<tfoot>
  	<tr>
			<td colspan="6" align="center">
			${pageStr }
			</td>
	</tr>
  </tfoot>
      <c:forEach var="dto" items="${list }">
<tr>
<td class="reserClass"><img alt="숙박업체이미지" src="/img/${dto.berthInfoImg }" class="mypageImg"></td>
<td class="reserInfo">
<ul class="planInfo">
	<li class="planSi">${dto.berthInfoName }</li>
	<li class="planSubject">${dto.berthName }</li>
	<li class="planDay">${dto.reserVisitStart } ~ ${dto.reserVisitEnd }</li>
</ul>
</td>
<td class="planPrice"><label>가격 : ${dto.reserPrice }</label></td>
  <td>
  <c:if test="${dto.reserVisitStart < now }">
  
  </c:if>
  <c:if test="${dto.reserPayState == 1 }">
  <c:if test="${dto.reserState == 1 }">
  <button type="button" class="btn btn-primary reserCancelBtn" onclick="cancel(${dto.reserIdx },${dto.berthIdx },${dto.reserPrice },'${dto.reserPaymentKey }')">
  예약취소
  </button>
  </c:if>
  <c:if test="${dto.reserState == 0 }">
  <span class="planDay">취소완료</span>
  </c:if>
  </c:if>
  <c:if test="${dto.reserPayState == 0 }">
  <span class="planDay">환불완료</span>
  </c:if>
  </td>
  </tr>
  <input type="hidden" id="userType" value="user">
  </c:forEach>
  </table>
  </c:if>
</div>
</div>
<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>