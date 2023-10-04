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
      <li><a href="#">사업체 등록</a></li>
      <li><a href="#">사업체 수정/삭제</a>
      <li><a href="#">일정 게시판</a></li>
      <li><a href="/fest?type=2">축제 관리</a></li>
      <li><a href="ceoQnaList">나의 문의</a></li>
      <li><a href="ceoWriteQForm">관리자에게 문의하기</a></li>
      <li><a href="not?type=2">공지사항</a></li>
	  <li class="admin_login">
	  	<img id="alogin" alt="프로필이미지" src="/img/alogin.png">
	  	<a href="/ceoLogout" >사업자 로그아웃</a> 
	  </li>
    </ul>
  </div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</header>