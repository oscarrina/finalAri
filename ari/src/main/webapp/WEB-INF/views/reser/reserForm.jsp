<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아리아리 예약</title>
<script src="https://js.tosspayments.com/v1/payment-widget"></script>
<style>
 .bd-placeholder-img {
   font-size: 1.125rem;
   text-anchor: middle;
   -webkit-user-select: none;
   -moz-user-select: none;
   user-select: none;
 }

 @media (min-width: 768px) {
   .bd-placeholder-img-lg {
     font-size: 3.5rem;
   }
 }

 .b-example-divider {
   height: 3rem;
   background-color: rgba(0, 0, 0, .1);
   border: solid rgba(0, 0, 0, .15);
   border-width: 1px 0;
   box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
 }

 .b-example-vr {
   flex-shrink: 0;
   width: 1.5rem;
   height: 100vh;
 }

 .bi {
   vertical-align: -.125em;
   fill: currentColor;
 }

 .nav-scroller {
   position: relative;
   z-index: 2;
   height: 2.75rem;
   overflow-y: hidden;
 }

 .nav-scroller .nav {
   display: flex;
   flex-wrap: nowrap;
   padding-bottom: 1rem;
   margin-top: -1px;
   overflow-x: auto;
   text-align: center;
   white-space: nowrap;
   -webkit-overflow-scrolling: touch;
 }
 .payment{
 	margin-top: 150px;
 }
 .berthH4{
 	color: gray;
 }
 .paymentPrice{
 	font-size: 30px;
 	color: red;
 	font-weight: bold;
 }
 .paymentBtn{
 	border: none;
 	background-color: #253BFF;
 	color: white;
 	width: 350px;
 	height: 60px;
 	font-size: 20px;
 }
</style>
</head>
<body>
<%@include file="/WEB-INF/views/header.jsp" %>
<body class="bg-light">
<div class="container payment">
  <main>
    <div class="row g-5">
      <div class="col-md-5 col-lg-4 order-md-last">
        <h4 class="d-flex justify-content-between align-items-center mb-3">
          <span class="text-primary">숙소 정보</span>
        </h4>
        <ul class="list-group mb-3">
          <li class="list-group-item d-flex justify-content-between lh-sm">
            <div>
              <h4 class="berthH4">숙소 이름</h4>
              <h4>${dto.berthInfoName }</h4>
            </div>
          </li>
          <li class="list-group-item d-flex justify-content-between lh-sm">
            <div>
              <h4 class="berthH4">객실 유형</h4>
              <h4>${dto.berthName }</h4>
            </div>
          </li>
          <li class="list-group-item d-flex justify-content-between lh-sm">
            <div>
              <h4 class="berthH4">입실 시간</h4>
              <h4>${dto.reserVisitStart } ${dto.berthInfoStart}</h4>
            </div>
          </li>
          <li class="list-group-item d-flex justify-content-between bg-light">
            <div>
              <h4 class="berthH4">퇴실 시간</h4>
              <h4>${dto.reserVisitEnd } ${dto.berthInfoEnd}</h4>
            </div>
          </li>
        </ul>
        <hr class="my-4">
          <div class="input-group">
            <h4 style="font-weight: bold;">총 결제 금액</h4>
          </div>
          <div>
          	<span class="paymentPrice">${dto.reserPrice}원</span>
          </div>
          <ul>
          	<li>결제완료 후 <span style="color: red;">예약자</span> 이름으로 바로 <span style="color: red;">입실</span> 하시면 됩니다</li>
          </ul>
          <div>
          	<button id="payment-button" class="paymentBtn">결제하기</button>
          </div>
      </div>
      <div class="col-md-7 col-lg-8">
        <h4 class="mb-3">예약자 정보</h4>
          <div class="row g-3">
            <div class="col-sm-6">
              <label for="firstName" class="form-label">예약자 이름</label>
              <input type="text" class="form-control" id="firstName" placeholder="" value="" required>
              <div class="invalid-feedback">
                이름을 입력해주세요.
              </div>
            </div>
            <div class="col-12">
              <label for="username" class="form-label">전화번호</label>
              <div class="input-group has-validation">
                <input type="text" class="form-control" id="username" placeholder="숫자만 입력하세요" required maxlength="11">
              <div class="invalid-feedback">
                  전화번호를 입력해주세요.
                </div>
              </div>
            </div>
          </div>
      </div>
    </div>
  </main>
</div>
<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
<script>
const clientKey = "test_ck_Ba5PzR0ArnJpEn1xog1rvmYnNeDM";
const customerKey = "${userid}"; // 내 상점에서 고객을 구분하기 위해 발급한 고객의 고유 ID
const button = document.getElementById("payment-button");

const paymentWidget = PaymentWidget(clientKey, customerKey); // 회원 결제

	paymentWidget.renderPaymentMethods("#payment-method", { value: 50000});

button.addEventListener("click", function () {
	//let uuid = self.crypto.randomUUID();
  paymentWidget.requestPayment({
    orderId: "1232131",            // 주문 ID(직접 만들어주세요)
    orderName: "${dto.berthInfoName}",                 // 주문명
    successUrl: "http://192.168.0.31:9000/pay/success",  // 결제에 성공하면 이동하는 페이지(직접 만들어주세요)
    failUrl: "http://192.168.0.31:9000/pay/fail",       // 결제에 실패하면 이동하는 페이지(직접 만들어주세요)
  });
});
</script>
</html>