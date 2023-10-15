<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                <c:forEach var="dto" items="${lists }">
                <div class="carousel-item active">
                    <img class="w-100" src="/imgs/${dto.bannerImg}" alt="Image">
                </div>
                </c:forEach>
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
              <a href="planDatePicker?area=1"><img src="/img/1.jpg" class="box-img" alt=""></a>
            </div>
            <div class="detail-box">
              <h4><a href="planDatePicker?area=1">서울</a></h4>
            </div>
          </div>
        </div>
        <div class="col-sm-6 col-md-4 mx-auto">
          <div class="box">
            <div class="img-box">
              <a href="planDatePicker?area=39"><img src="/img/39.jpg" class="box-img" alt=""></a>
            </div>
            <div class="detail-box">
              <h4><a href="planDatePicker?area=39"> 제주도</a></h4>
            </div>
          </div>
        </div>
        <div class="col-sm-6 col-md-4 mx-auto">
          <div class="box">
            <div class="img-box">
              <a href="planDatePicker?area=6"><img src="/img/6.jpg" class="box-img" alt=""></a>
            </div>
            <div class="detail-box">
              <h4><a href="planDatePicker?area=6">부산</a></h4>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="container">
      <div class="row">
        <div class="col-sm-6 col-md-4 mx-auto">
          <div class="box">
            <div class="img-box">
              <a href="planDatePicker?area=2"><img src="/img/2.jpg" class="box-img" alt=""></a>
            </div>
            <div class="detail-box">
              <h4><a href="planDatePicker?area=2">인천</a></h4>
            </div>
          </div>
        </div>
        <div class="col-sm-6 col-md-4 mx-auto">
          <div class="box">
            <div class="img-box">
              <a href="planDatePicker?area=3"><img src="/img/3.jpg" class="box-img" alt=""></a>
            </div>
            <div class="detail-box">
              <h4><a href="planDatePicker?area=3">대전</a></h4>
            </div>
          </div>
        </div>
        <div class="col-sm-6 col-md-4 mx-auto">
          <div class="box">
            <div class="img-box">
              <a href="planDatePicker?area=4"><img src="/img/4.jpg" class="box-img" alt=""></a>
            </div>
            <div class="detail-box">
              <h4><a href="planDatePicker?area=4">대구</a></h4>
            </div>
          </div>
        </div>
      </div>
    </div>
	    <div class="container">
	      <div class="row">
	        <div class="col-sm-6 col-md-4 mx-auto">
	          <div class="box">
	            <div class="img-box">
	              <a href="planDatePicker?area=5"><img src="/img/5.jpg" class="box-img" alt=""></a>
	            </div>
	            <div class="detail-box">
	              <h4><a href="planDatePicker?area=5">광주</a></h4>
	            </div>
	          </div>
	        </div>
	        <div class="col-sm-6 col-md-4 mx-auto">
	          <div class="box">
	            <div class="img-box">
	              <a href="planDatePicker?area=7"><img src="/img/7.jpg" class="box-img" alt=""></a>
	            </div>
	            <div class="detail-box">
	              <h4><a href="planDatePicker?area=7"> 울산</a></h4>
	            </div>
	          </div>
	        </div>
	        <div class="col-sm-6 col-md-4 mx-auto">
	          <div class="box">
	            <div class="img-box">
	              <a href="planDatePicker?area=8"><img src="/img/8.jpg" class="box-img" alt=""></a>
	            </div>
	            <div class="detail-box">
	              <h4><a href="planDatePicker?area=8">세종특별자치시</a></h4>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	    <div class="container">
	      <div class="row">
	        <div class="col-sm-6 col-md-4 mx-auto">
	          <div class="box">
	            <div class="img-box">
	              <a href="planDatePicker?area=31"><img src="/img/9.jpg" class="box-img" alt=""></a>
	            </div>
	            <div class="detail-box">
	              <h4><a href="planDatePicker?area=31">경기도</a></h4>
	            </div>
	          </div>
	        </div>
	        <div class="col-sm-6 col-md-4 mx-auto">
	          <div class="box">
	            <div class="img-box">
	              <a href="planDatePicker?area=32"><img src="/img/10.jpg" class="box-img" alt=""></a>
	            </div>
	            <div class="detail-box">
	              <h4><a href="planDatePicker?area=32"> 강원특별자치도</a></h4>
	            </div>
	          </div>
	        </div>
	        <div class="col-sm-6 col-md-4 mx-auto">
	          <div class="box">
	            <div class="img-box">
	              <a href="planDatePicker?area=33"><img src="/img/33.jpg" class="box-img" alt=""></a>
	            </div>
	            <div class="detail-box">
	              <h4><a href="planDatePicker?area=33">충청북도</a></h4>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	    <div class="container">
	      <div class="row">
	        <div class="col-sm-6 col-md-4 mx-auto">
	          <div class="box">
	            <div class="img-box">
	              <a href="planDatePicker?area=34"><img src="/img/34.jpg" class="box-img" alt=""></a>
	            </div>
	            <div class="detail-box">
	              <h4><a href="planDatePicker?area=34">충청남도</a></h4>
	            </div>
	          </div>
	        </div>
	        <div class="col-sm-6 col-md-4 mx-auto">
	          <div class="box">
	            <div class="img-box">
	              <a href="planDatePicker?area=35"><img src="/img/35.jpg" class="box-img" alt=""></a>
	            </div>
	            <div class="detail-box">
	              <h4><a href="planDatePicker?area=35"> 경상북도</a></h4>
	            </div>
	          </div>
	        </div>
	        <div class="col-sm-6 col-md-4 mx-auto">
	          <div class="box">
	            <div class="img-box">
	              <a href="planDatePicker?area=36"><img src="/img/36.jpg" class="box-img" alt=""></a>
	            </div>
	            <div class="detail-box">
	              <h4><a href="planDatePicker?area=36">경상남도</a></h4>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	    <div class="container">
	      <div class="row">
	        <div class="col-sm-6 col-md-4 mx-auto">
	          <div class="box">
	            <div class="img-box">
	              <a href="planDatePicker?area=37"><img src="/img/37.jpg" class="box-img" alt=""></a>
	            </div>
	            <div class="detail-box">
	              <h4><a href="planDatePicker?area=37">전라북도</a></h4>
	            </div>
	          </div>
	        </div>
	        <div class="col-sm-6 col-md-4 mx-auto">
	          <div class="box">
	            <div class="img-box">
	              <a href="planDatePicker?area=38"><img src="/img/38.jpg" class="box-img" alt=""></a>
	            </div>
	            <div class="detail-box">
	              <h4><a href="planDatePicker?area=38"> 전라남도</a></h4>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>