<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/mypage.css">
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
<%@include file="/WEB-INF/views/header.jsp" %>
<%@include file="/WEB-INF/views/mypage/mypageSide.jsp" %>
<div class="maindiv">
<div class="qDiv">
		
		<table width="800" align="center">
     	<tr><td><h4>문의</h4></td></tr>
    <tr>
        <td colspan="2">
            <input type="text" name="qnaTitle" id="qnaTitle" value="${qna.qnaTitle}" readonly>
        </td>
    </tr>
    <tr>
        <td>
            <input type="text" id="qnaCategory" value="${cate[qna.qnaCategory]}" readonly>
        </td>
        <td>
            <input type="text" id="qnaDate" value="${qna.qnaDate}" readonly>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <textarea class="form-control" id="exampleTextarea" rows="8" readonly>${qna.qnaContent}</textarea>
        </td>
    </tr>
     	</table>
     </div>
     <hr>
     <div class="reply">
     	<table width="800" align="center">
     	<c:if test="${!empty reply }"><tr><td><h4>답변</h4></td></tr>
     		<tr>
     			<td colspan="2">
     			<input type="text" name="qnaTitle" id="qnaTitle" value="${reply.replyTitle }" readonly>
     			</td>
     		</tr>
     		<tr>
     			<td>
     			<input type="text" id="qnaDate" value="${reply.replyDate}" readonly>
     			</td>
     		</tr>
     		<tr>
     			<td colspan="2">
     			<textarea class="form-control" id="exampleTextarea" rows="8" 
				readonly>${reply.replyContent }</textarea>
     			</td>
     		</tr>
     	</table><br>
     	</c:if>
     	<input type="button" class="btn2" value="돌아가기" onclick="location.href='myQna'">
     </div>
</div>
<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>