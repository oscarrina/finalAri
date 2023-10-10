<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div><label>개장시간</label>&nbsp;&nbsp;&nbsp;
<select class = "Time" name="attStart" required="required" >
	<option value = "01:00">01:00</option>
	<option value = "02:00">02:00</option>
	<option value = "03:00">03:00</option>
	<option value = "04:00">04:00</option>
	<option value = "05:00">05:00</option>
	<option value = "06:00">06:00</option>
	<option value = "07:00">07:00</option>
	<option value = "08:00">08:00</option>
	<option value = "09:00">09:00</option>
	<option value = "10:00">10:00</option>
	<option value = "11:00">11:00</option>
	<option value = "12:00">12:00</option>
	<option value = "13:00">13:00</option>
	<option value = "14:00">14:00</option>
	<option value = "15:00">15:00</option>
	<option value = "16:00">16:00</option>
	<option value = "17:00">17:00</option>
	<option value = "18:00">18:00</option>
	<option value = "19:00">19:00</option>
	<option value = "20:00">20:00</option>
	<option value = "21:00">21:00</option>
	<option value = "22:00">22:00</option>
	<option value = "23:00">23:00</option>
	<option value = "24:00">24:00</option>
</select> </div>
<div><label>폐장시간</label>&nbsp;&nbsp;&nbsp;
<select class = "Time" name="attEnd" required="required">
	<option value = "01:00">01:00</option>
	<option value = "02:00">02:00</option>
	<option value = "03:00">03:00</option>
	<option value = "04:00">04:00</option>
	<option value = "05:00">05:00</option>
	<option value = "06:00">06:00</option>
	<option value = "07:00">07:00</option>
	<option value = "08:00">08:00</option>
	<option value = "09:00">09:00</option>
	<option value = "10:00">10:00</option>
	<option value = "11:00">11:00</option>
	<option value = "12:00">12:00</option>
	<option value = "13:00">13:00</option>
	<option value = "14:00">14:00</option>
	<option value = "15:00">15:00</option>
	<option value = "16:00">16:00</option>
	<option value = "17:00">17:00</option>
	<option value = "18:00">18:00</option>
	<option value = "19:00">19:00</option>
	<option value = "20:00">20:00</option>
	<option value = "21:00">21:00</option>
	<option value = "22:00">22:00</option>
	<option value = "23:00">23:00</option>
	<option value = "24:00">24:00</option>
</select> </div>
<div><label>휴장일</label></div><div><input type = "text" placeholder = "휴장일" name="attClose" required="required"></div>
<div class = "age"><label>체험연령 정보</label><input type = "text" placeholder = "체험연령 정보" name = "attAge" ></div>
<div class = "label"><label>반려동물 동반</label><input id = "petCheck" type = "checkbox" name="attPet" value = "1"></div>
<div class = "label"><label>유모차 대여시설</label><input id = "babyCheck" type = "checkbox" name = "attBaby" value = "1"></div>
<button type="button" id= "attSub" onclick= "formSubmit()" class="btn btn-primary" style="background-color:#666CDE; width:70px; height:40px; font-size:13px;">등록</button>
