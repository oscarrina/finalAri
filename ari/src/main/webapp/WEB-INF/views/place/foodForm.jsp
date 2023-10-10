<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<div style = "margin-top: 20px;"><label>영업시간</label></div><div><input type = "text" placeholder = "영업시간" name="foodOpen" required="required"></div>
<div><label>취급메뉴</label></div><div><input type = "text" placeholder = "취급메뉴" name="foodMenu"></div>
<div><label>휴무일</label></div><div><input type = "text" placeholder = "휴무일" name="foodClose"></div>
<button type="button" id= "foodSub" onclick= "formSubmit()" class="btn btn-primary" style="background-color:#666CDE; width:70px; height:40px; font-size:13px;">등록</button>
</html>