<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<style>
body{
	width: 1200px;
	margin: 0px auto;
}
.header{
	width:1200px;
	height: 150px;
	position: fixed;
	top: 0;
	z-index: 100;
}
.searchDiv{
	border-radius: 30px;
	border:solid 1px #253BFF;
	position: relative;
	margin: 0px auto;
	width: 700px;
}
.searchBox{
	width: 400px;
	height:50px;
	border: none;
	margin-left: 190px;
}
.searchBox:focus{
	outline: none;
	box-shadow: none;
}
.searchForm{
	margin-right: 500px;
}
.searchBtn{
	position : absolute;
	right: 5px;
	top:7px;
	width:50px;
	height:50px;
	margin: 0;
	border: none;
	color: #253BFF;
}
.searchBtn:hover {
	background : none;
}
.searchBtn:active{
	background:none;
}
.logoImg{
	width: 150px;
	height: 70px;
}
.categorySelect,.regionSelect{
	width:90px;
	height:40px;
	margin: 0;
	border: none;
}
.category{
	border: none;
	position: absolute;
	left: 15px;
	top: 10%;
	border-right: solid 1px #253BFF;
}
.region{
	border: none;
	position: absolute;
	left: 110px;
	top: 10%;
	border-right: solid 1px #253BFF;
}
.regionSelect:focus,.categorySelect:focus{
	outline: none;
}
.profileImg{
	width: 50px;
	height:50px;
}
.sideBtn,.sideBtn:hover{
	display:inline-block;
	border: none;
	background : none;
}
.sideBtn:active,.sideBtn:focus{
	background : none !important;
}
.justify{
	color: #253BFF;
	width: 100%;
	height: 100%;
}
.sideUl{
	list-style-type: none;
}
.sideLi{
	padding: 15px;
	font-size: 22px;
	color: white;
}
.sidehr{
	background-color: white;
	border: 0;
	height: 3px;
}
.dropdownBtn,.dropdownBtn:hover,.dropdownBtn:active{
	width:70px;
	border: none;
	background: none !important;
}
.sideA{
	text-decoration-line:none;
	color:white;
}

</style>
</head>
<div class="navbar navbar-expand-sm bg-light header bg-white">
<a href="cos">코스 테스트</a>
<a href="planShare">일정 테스트</a>
  <div class="container-fluid">
    <a class="navbar-brand" href="/">
      	<img class="logoImg" alt="아리아리로고이미지" src="/img/logo.png"></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <div class="searchDiv">
      <form class="d-flex searchForm" role="search" action="searchResult">
      <div class="category">
      	<select name="category" class="categorySelect">
      	<option selected="selected" value="1">관광명소</option>
      	<option value="2">음식점</option>
      	<option value="3">숙박</option>
      	<option value="4">축제</option>
      	</select>
      </div>
      <div class="region">
      	<select name="region" class="regionSelect">
      	<option selected="selected" value="0">전체</option>
      	<option value="1">서울</option>
      	<option value="17">제주도</option>
      	<option value="6">부산</option>
      	<option value="8">세종</option>
      	<option value="3">대전</option>
      	<option value="2">인천</option>
      	<option value="4">대구</option>
      	<option value="5">광주</option>
      	<option value="7">울산</option>
      	<option value="9">경기도</option>
      	<option value="10">강원도</option>
      	<option value="11">충청북도</option>
      	<option value="12">충청남도</option>
      	<option value="13">경상북도</option>
      	<option value="14">경상남도</option>
      	<option value="15">전라북도</option>
      	<option value="16">전라남도</option>
      	</select>
      	</div>
      	<div class="searchBoxDiv">
        <input class="form-control me-2 searchBox" type="text" placeholder="검색어를 입력해주세요" aria-label="Search">
        </div>
        <div class="searchBtnDiv">
        <button style="background: none;" class="btn btn-outline-success searchBtn" type="submit"><i class="bi bi-search searchBtn"></i></button>
        </div>
      </form>
      </div>
      <div class="dropdown">
  <button class="btn btn-secondary dropdown-toggle dropdownBtn" type="button" data-bs-toggle="dropdown" aria-expanded="false">
    <img alt="프로필사진" src="/img/profile.png" class="profileImg">
  </button>
  <ul class="dropdown-menu">
    <li><a class="dropdown-item" href="myPage">마이페이지</a></li>
    <li>
    <c:if test="${empty sid }"><a class="dropdown-item" href="/memberLogin">로그인</a></c:if>
    <c:if test="${!empty sid }"><a class="dropdown-item" href="/memberLogout">로그아웃</a></c:if>
    </li>
    <li><a class="dropdown-item" href="#">고객센터</a></li>
  </ul>
</div>
      <button class="btn btn-primary sideBtn" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight"><i style="font-size: 40px;" class="bi bi-justify justify"></i></button>
    </div>
  </div>
</div>
<div class="offcanvas offcanvas-end sidebar bg-info" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
  <div class="offcanvas-header">
    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>
  <div class="offcanvas-body">
    <ul class="sideUl">
    	<li class="sideLi"><a class="sideA">사이트 소개</a></li>
    	<hr class="sidehr">
    	<li class="sideLi"><a class="sideA" href="not?type=1">공지사항</a></li>
    	<hr class="sidehr">
    	<li class="sideLi"><a class="sideA" href="writeQForm">문의하기</a></li>
    	<hr class="sidehr">
    	<li class="sideLi"><a class="sideA">지역축제정보</a></li>
    	<hr class="sidehr">
    	<li class="sideLi"><a class="sideA">지역추천코스</a></li>
    	<hr class="sidehr">
    	<li class="sideLi"><a class="sideA">일정공유게시판</a></li>
    	<hr class="sidehr">
    </ul>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</html>