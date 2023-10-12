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
<script type="text/javascript">
function showDel(idx,type){
	
	var param='festidx='+idx+'&type='+type;
	if (confirm("공지사항을 삭제하시겠습니까?")) {
        $.ajax({
            type: "POST",
            url: "/festDel",
            data: param
        });
        if(type==2){
        	location.href='festival';
        }else{
        	location.href='fest';
        }
    }else{
    	location.reload();
    }
}
function showUpd(idx){
	location.href='festUpd?festidx='+idx;
}
</script>
<style>
.table1{
	border-collapse:separate;
	border-spacing: 0 10px;
	width:100%;
	padding-top:100px important;
	margin-bottom:20px;
	align:left;
	text-align: left;
}


.thtd1{
	padding-top: 10px;
	padding-bottom: 10px;
}


.content2{
	align:left;
	width:800px;
	margin-right: 200px;
}
.border1{
	border: 1px solid #4068A7;
	border-radius: 10px;
}

.content3{
	width:500px;
	margin-top:100px;
	height:auto;

}
.btn2{
	border-top: none !important;
	border-bottom: none !important;
	border-left: none !important;
	border-right: none !important;
}
.btn2:hover{
 	background-color: #686DB9 !important;
}
.p1{
	width:600px !important;
	padding-left:20px;
	padding-top:20px;
	padding-bottom:20px;
	padding-right:20px;
	background-color: #ECF2FC;
	border-radius: 10px;
	font-weight: bold;
	font-size: 13px;
	color: #455671;
}
.img1{
	width:270px !important;
	height:350px !important;
	padding-right: 30px;
	margin-right: auto;
	margin-left: auto;
	overflow: hidden;
	object-fit:cover;
}
.traligncnt{
	text-align: center !important;
}
.tr1{

}
.td1{
	margin-top: 10px !important;
	padding-bottom: 10px !important;
	font-weight: bold;
	font-size: 17px;
	color: #455671;
}
.title1{
	font-size: 25px !important;
}
.trp{

	padding-top: 30px;
	padding-bottom: 30px;
}
.underline {
  text-decoration:none;
  line-height: 1.2;
  font-size: 15px;
  font-weight: 700;
  background-image: linear-gradient(transparent calc(100% - 3px), #8B95A6 3px);
  background-repeat: no-repeat;
  background-size: 0% 100%;
  transition: background-size 0.8s;
  color: #455671;
  cursor: pointer;
}
@media (min-width: 1000px) {
  .underline {
    font-size: 15px;;
  }
}
.underline.yellow {
  background-image: linear-gradient(transparent 60%, #8B95A6 40%);
}
.underline:hover {
  text-decoration:none;
  color:#8B95A6;
  background-size: 100% 100%;
}
.btn3{
	border-top: none !important;
	border-bottom: none !important;
	border-left: none !important;
	border-right: none !important;
}
.btn3:hover{
 	background-color: #9F9F9F !important;
}
</style>
</head>
<body>
<div id="page-wrapper">
<c:if test="${type==2 }">
<%@ include file="../ceo/ceoHeader.jsp" %>
</c:if>

<c:if test="${type==3 }">
<%@ include file="../admin/adminHeader.jsp" %>
</c:if>

  <!-- /사이드바 -->

  <!-- 본문 -->
  <div id="page-content-wrapper">
    <div class="container-fluid content1" >
      <div class=" content2">
      	
		<table class="table1">
			<tr class="tr1">
				<td class="td1 title1" colspan="2">${dto.festtitle }</td>
			</tr>
			<tr class="tr1">
				<c:if test="${dto.festapi==0 }"><td class="traligncnt" rowspan="8"><img class="img1" alt="" src="/imgs/${dto.festimg }"></td></c:if>
				<c:if test="${dto.festapi==1 }"><td class="traligncnt" rowspan="8"><img class="img1" alt="" src="${dto.festimg }"></td></c:if>
				<td class="td1">${dto.festtelname }</td>
			</tr>
			<tr class="">
				<td class="td1">${dto.festtel }</td>
			</tr>
			<tr class="">
				<td class="td1"><a class="underline" href="${dto.festhome }">${dto.festhome }</a></td>
			</tr>
			<tr class="">
				<td class="td1">${dto.festaddr }</td>
			</tr>

			<tr class="">
				<td class="td1">${dto.feststart } ~ ${dto.festend }</td>
			</tr>
			<tr class="">
				<td class="td1">${dto.festdate }</td>
			</tr>
			<tr class="">
				<td class="td1">${dto.festprice }</td>
			</tr>
			<tr class="">
				<td class="td1"><i class="bi bi-eye-fill"></i>&nbsp;&nbsp;${dto.festread}</td>
			</tr>
			
			<tr class="trp">
				<td colspan="2" class="p1">${dto.festcont }</td>
			</tr>
			<tr class="trp">
				<td colspan="2" class="p1">${dto.festcontent }</td>
			</tr>
		</table>
			<div class="d-grid gap-2 d-md-flex justify-content-center contentwidth">
			
			<c:if test="${type==2 }">
		    	<button type="button" class="btn btn-primary btn3" 
					style="background-color:#D9D9D9; width:70px; height:40px; font-size:11px; color:black; " onclick="javascript:location.href='festival'">목록</button>&nbsp;&nbsp;
				<button type="button" class="btn btn-primary btn2" 
					style="background-color:#666CDE; width:70px; height:40px; font-size:11px; " onclick="showDel(${dto.festidx},${type })">삭제</button>&nbsp;&nbsp;
				<button type="button" class="btn btn-primary btn2" 
					style="background-color:#3239AF; width:70px; height:40px; font-size:11px;" onclick="showUpd(${dto.festidx})">수정</button>
		    </c:if>
		    <c:if test="${type==3 }">
		    	<button type="button" class="btn btn-primary btn3" 
					style="background-color:#D9D9D9; width:70px; height:40px; font-size:11px; color:black; " onclick="javascript:location.href='fest'">목록</button>&nbsp;&nbsp;
				<button type="button" class="btn btn-primary btn2" 
					style="background-color:#666CDE; width:70px; height:40px; font-size:11px; " onclick="showDel(${dto.festidx},${type })">삭제</button>&nbsp;&nbsp;
		    </c:if>
			</div>
			</div>
    </div>
    <c:if test="${type==2 }">
    	<%@include file="../ceo/ceoFooter.jsp" %>
    </c:if>
    <c:if test="${type==3 }">
    	<%@include file="../admin/adminFooter.jsp" %>
    </c:if>
    
  </div>
  <!-- /본문 -->
</div>

</body>
</html>