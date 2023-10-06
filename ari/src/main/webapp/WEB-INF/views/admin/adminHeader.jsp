<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
   
<header>
  <!-- 사이드바 -->
  <div id="sidebar-wrapper">
    <ul class="sidebar-nav">
      <li class="sidebar-brand">
      <a href="#" id="img1"><img id="logoimg" alt="로고이미지" src="/img/logoX.png"></a>
      </li>      
      <li><a href="adminUser?type=3">유저 관리</a></li>
      <li><a href="#">지역별 여행 통계</a></li>
      <li><a href="#">일정 게시판</a></li>
      <li><a href="#">코스 목록 보기</a></li>
      <li><a href="#">배너 이미지 관리</a></li>
      <li><a href="#">축제 등록 및 삭제</a></li>
      <li><a href="#">전체 문의 내용 보기</a></li>
      <li><a href="notice?type=3">공지사항</a></li>
	  <li class="admin_login">
	  	<img id="alogin" alt="프로필이미지" src="/img/alogin.png">
	  	<a href="/adminLogout" >관리자 로그아웃</a> 
	  </li>
    </ul>
  </div>
</header>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
