<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.box-img{
	margin-left : 65px;
	width: 250px;
	height: 250px;
	border-radius: 10px;
}
h4{
	text-align: center;
	text-decoration: none;
	color: black;
}
h4:visited{
	color: black;
}
.container{
	margin-top: 40px;
}
.mb-5{
	margin-top: 150px;
}
.container a{
	text-decoration: none;
	color: black;
}
.carousel-item{
	border: none;
}
.w-100{
	width: 1200px;
	height: 500px;
	border-radius: 10px;
}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/header.jsp" %>
 <div class="container-fluid px-0 mb-5">
        <div id="header-carousel" class="carousel slide carousel-fade" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="w-100" src="/img/img.jpg" alt="Image">
                </div>
                <div class="carousel-item">
                    <img class="w-100" src="/img/banner1.png" alt="Image">
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#header-carousel"
                data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#header-carousel"
                data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </div>
   
    <div class="container">
      <div class="row">
        <div class="col-sm-6 col-md-4 mx-auto">
          <div class="box">
            <div class="img-box">
              <a href="#"><img src="/img/img.jpg" class="box-img" alt=""></a>
            </div>
            <div class="detail-box">
              <h4><a href="#">서울</a></h4>
            </div>
          </div>
        </div>
        <div class="col-sm-6 col-md-4 mx-auto">
          <div class="box">
            <div class="img-box">
              <a href="#"><img src="/img/img.jpg" class="box-img" alt=""></a>
            </div>
            <div class="detail-box">
              <h4><a href="#"> 제주도</a></h4>
            </div>
          </div>
        </div>
        <div class="col-sm-6 col-md-4 mx-auto">
          <div class="box">
            <div class="img-box">
              <a href="#"><img src="/img/img.jpg" class="box-img" alt=""></a>
            </div>
            <div class="detail-box">
              <h4><a href="#">부산</a></h4>
            </div>
          </div>
        </div>
      </div>
    </div>
    
<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>