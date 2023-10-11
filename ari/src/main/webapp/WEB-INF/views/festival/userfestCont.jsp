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
<style>
.content{
  display: block;
  width: 1000px; /* 원하는 너비로 조정 */
  margin-top: 160px; /* 가로 가운데 정렬 */
  margin-left:auto;
  margin-right:auto;
}
.table1{
	border-collapse:separate;
	border-spacing: 0 13px;
	width:900px;
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
	width:250px !important;
	height:320px !important;
	padding-right: 30px;
	margin-right: auto;
	margin-left: auto;
	overflow: hidden;
	object-fit:cover;
}
.traligncnt{
	text-align: center !important;
	width:300px;
}
.tr1{
	
}
.td1{
	margin-top: 10px !important;
	padding-bottom: 10px !important;
	font-weight: bold;
	font-size: 15px;
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
.btn2:hover{
 	background-color: #686DB9 !important;
}
.btn2{
	margin-top:6px;
	border:none;
	border-radius:25px;
  	background:#686DB9;
  	width: 70px;
  	height:35px;
  	color: #fff;
  	cursor: pointer;
  	margin-left: 30px;
  	font-size: 13px;
  	
}
.tdbtn2{
	text-align:right;
	vertical-align: top;
}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/header.jsp" %>

<div class="content">

<table class="table1">	
			<tr class="tr1">
				<td class="td1 title1" colspan="2">${dto.festtitle }</td>
				<td rowspan="8" class="tdbtn2"><input type="button" class="btn2" value="돌아가기" onclick="javascript:history.go(-1);"></td>
			</tr>
			<tr class="tr1">
				<c:if test="${dto.festapi==0 }"><td class="traligncnt" rowspan="7"><img class="img1" alt="축제 포스터" src="/imgs/${dto.festimg }"></td></c:if>
				<c:if test="${dto.festapi==1 }"><td class="traligncnt" rowspan="7"><img class="img1" alt="축제 포스터" src="${dto.festimg }"></td></c:if>
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
			<tr class="trp">
				<td colspan="3" class="p1">${dto.festcont }</td>

			</tr>
			<tr class="trp">
				<td colspan="3" class="p1">${dto.festcontent }</td>
			</tr>
		</table>
</div>

<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>