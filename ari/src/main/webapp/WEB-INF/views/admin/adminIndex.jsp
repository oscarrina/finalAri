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
  /* 사이드바 래퍼 스타일 */
  
  #page-wrapper {
    padding-left: 250px;
  }
  
  #sidebar-wrapper {
    position: fixed;
    width: 250px;
    height: 100%;
    margin-left: -250px;
    background: #213555;
    overflow-x: hidden;
    overflow-y: auto;
    border-radius: 0px 30px 30px 0px;
    
  }
  
  #page-content-wrapper {
    width: 100%;
    padding: 20px;
  }
  /* 사이드바 스타일 */
  
  .sidebar-nav {
    width: 250px;
    margin:0;
    padding: 0;
    list-style: none;
  }
  
  .sidebar-nav li {
     padding:10px;
    text-indent: 1.5em;
    line-height: 2.8em;
    font-size: 17px;
  }
  
  .sidebar-nav li a {
    display: block;
    text-decoration: none;
    color: #FFFFFF;
  }
  
  .sidebar-nav li a:hover {
    color: #fff;
    background: rgba(255, 255, 255, 0.2);
  }
  
  .sidebar-nav > .sidebar-brand {
    font-size: 1.3em;
    line-height: 3em;
  }
#img1:hover {
    background: none;

  }
#logoimg{
   margin-top:30px;
   margin-bottom:15px;
   width:130px;
   height:50px;
}
</style>
</head>
<body>
<div id="page-wrapper">
  <!-- 사이드바 -->
  <div id="sidebar-wrapper">
    <ul class="sidebar-nav">
      <li class="sidebar-brand">
        <a href="#" id="img1"><img id="logoimg" alt="로고이미지" src="/img/logoX.png"></a>
      </li>
      <li><a href="#">유저 관리</a></li>
      <li><a href="#">지역별 여행 통계</a></li>
      <li><a href="#">일정 게시판</a></li>
      <li><a href="#">코스 목록 보기</a></li>
      <li><a href="#">배너 이미지 관리</a></li>
      <li><a href="#">축제 등록 및 삭제</a></li>
      <li><a href="#">전체 문의 내용 보기</a></li>
      <li><a href="#">공지사항</a></li>

    </ul>
  </div>
  <!-- /사이드바 -->

  <!-- 본문 -->
  <div id="page-content-wrapper">
    <div class="container-fluid">
      <h1>간단한 사이드바</h1>
      <p>메뉴가 많아서 한 페이지를 넘으면 세로 스크롤바 생김</p>
      <h1>Content</h1>
    </div>
    <div class="d-flex flex-column flex-sm-row justify-content-between py-4 my-4 border-top">
      <p>© 2023 Company, Inc. All rights reserved.</p>
      <ul class="list-unstyled d-flex">
        <li class="ms-3"><a class="link-dark" href="#"><svg class="bi" width="24" height="24"><use xlink:href="#twitter"></use></svg></a></li>
        <li class="ms-3"><a class="link-dark" href="#"><svg class="bi" width="24" height="24"><use xlink:href="#instagram"></use></svg></a></li>
        <li class="ms-3"><a class="link-dark" href="#"><svg class="bi" width="24" height="24"><use xlink:href="#facebook"></use></svg></a></li>
      </ul>
    </div>
  </div>
  <!-- /본문 -->
</div>

</body>
</html>