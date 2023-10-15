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
<link rel="stylesheet" type="text/css" href="/css/adminNotice.css">
<script type="text/javascript" src="../../../js/httpRequest.js"></script>
<style>
#myQna{color: #253BFF;}
.maindiv{
	margin-top:150px;
	display: inline-block;
	width: 75%;
	height: 100vh;
	float: right;
}
#qnaTitle{
	width:400px;
	height:40px;
	border-color:blue;
	border-radius:30px;
	margin-top:15px;
	text-align: center;
}
#qnaCategory{
	width:200px;
	height:40px;
	border-color:blue;
	border-radius:30px;
	margin-top:15px;
	text-align:center;
}
#qnaDate{
	width:200px;
	height:40px;
	border-color:blue;
	border-radius:30px;
	margin-top:15px;
	text-align:center;
}
#exampleTextarea{
	margin-top:15px;
	border-radius:25px;
	border-color:blue;
	border-width: 2px;
}
h4{
	color:#253BFF;
}
.qDiv{
	border:
}
.btn2{
   margin-top:6px;
   border:none;
   border-radius:25px;
     background:#686DB9;
     width: 80px;
     height:45px;
     color: #fff;
     cursor: pointer;
     margin-left: 30px;
     font-size: 16px;
     margin-left:50px;
     
}
</style>
</head>
<body>
<div id="page-wrapper">
<%@ include file="../admin/adminHeader.jsp" %>
  <!-- /사이드바 -->
  <!-- 본문 -->
  <div id="page-content-wrapper">
    <div class="container-fluid">
      	<div class="content2">
      	<div class="qDiv">
     	<table width="800" align="center">
     	<tr><td><h4>문의</h4></td></tr>
     		<tr>
     			<td colspan="2">
     			<input type="text" name="qnaTitle" id="qnaTitle" value="${qna.qnaTitle }" readonly>
     			</td>
     		</tr>
     		<tr>
     			<td>
     			<input type="text" id="qnaCategory" value="${cate[qna.qnaCategory] }" readonly>
     			</td>
     			<td>
     			<input type="text" id="qnaDate" value="${qna.qnaDate}" readonly>
     			</td>
     		</tr>
     		<tr>
     			<td colspan="2">
     			<textarea class="form-control" id="exampleTextarea" rows="8" 
				readonly>${qna.qnaContent }</textarea>
     			</td>
     		</tr>
     	</table>
     
     </div>
     <hr>
     <div>
     <form action="adminReply">
     	<table width="800" align="center">
     	<c:if test="${!empty reply }">
     	<tr><td><h4>답변</h4></td></tr>
     	
     		<tr>
     			<td colspan="2">
     			<input type="hidden" name="qnaIdx" value="${qna.qnaIdx }">
     			<input type="text" name="replyTitle" id="qnaTitle" value="${reply.replyTitle }">
     			</td>
     		</tr>
     		<tr>
     			<td>
     			<input type="text" id="qnaDate" value="${reply.replyDate}" placeholder="답변 날짜" readonly>
     			</td>
     		</tr>
     		<tr>
     			<td colspan="2">
     			<textarea class="form-control" name="replyContent" id="exampleTextarea" rows="8" 
				>${reply.replyContent }</textarea>
     			</td>
     		</tr>
     	</table><br>
     	</c:if>
     	<input type="button" class="btn2" value="돌아가기" style="margin-right:580px; margin-left:75px;"onclick="location.href='adminQnaList'">
     	<input type="submit" value="답변 작성" class="btn2">
     	</form>
     </div>
      	</div>	
       </div>
    <%@include file="../admin/adminFooter.jsp" %>
  </div>
  <!-- /본문 -->
  
</div>


</body>
</html>