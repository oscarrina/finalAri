<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/adminMainLayout.css">
<link rel="stylesheet" type="text/css" href="/css/adminNotice.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src = "js/httpRequest.js"></script>
<style>
#myPlan{
	color: #253BFF;
}
.mypagePlan{
	text-align: center;
}
</style>
<script>
function planDel(planGroup){
	swal({
		  title: "아리아리",
		  text: "일정을 삭제하시겠습니까?",
		  icon: "warning",
		  buttons: true,
		  dangerMode: true,
		})
		.then((willDelete) => {
			if (willDelete) {
	            swal("일정이 삭제되었습니다.", {
	              icon: "success",
	            }).then((aaa) => {
	                let param = "planGroup="+planGroup;
	            	sendRequest('planDel',param,showResult,'POST');
				});
	          }
		});
}
function showResult(){
	if(XHR.readyState == 4){
		if(XHR.status == 200){
			let data = XHR.responseText;
			if(data == '성공'){
				location.href = 'myPage';
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
<%@include file="/WEB-INF/views/header.jsp" %>
<%@include file="/WEB-INF/views/mypage/mypageSide.jsp" %>
<div class="mypageReserDiv">
<h3>내 일정</h3>
<div class="mypagePlan">
      <c:if test="${empty list }">
      <h1>일정이 없습니다.</h1>
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
      <c:set var="planPoint" value="${dto.planPoint}"/>
<tr>
<td class="reserClass"><img alt="숙박업체이미지" src="/img/${dto.planBigImg}" class="mypageImg"></td>
<td class="reserInfo">
<ul class="planInfo">
	<li class="planSi">${areamap[planPoint]}</li>
	<li class="planDay">${dto.planStart} ~ ${dto.planEnd}</li>
</ul>
</td>
  <td class="mypagePlan">
  <button class="btn btn-secondary myPlanCategory" type="button" data-bs-toggle="dropdown" aria-expanded="false">
   <i class="bi bi-three-dots-vertical categoryI"></i>
  </button>
  <ul class="dropdown-menu">
    <li><a class="dropdown-item" href="#">일정 보기</a></li>
    <li><a class="dropdown-item" href="planToShare">일정 공유</a></li>
    <li><a class="dropdown-item" onclick="planDel(${dto.planGroup})">일정 삭제</a></li>
  </ul>
  </td>
  </tr>
  </c:forEach>
  </table>
  </c:if>
</div>
</div>
<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>