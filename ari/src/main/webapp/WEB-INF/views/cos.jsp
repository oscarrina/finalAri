<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://js.tosspayments.com/v1/payment-widget"></script>
<style>
.test{
	margin-top: 300px;
}
.like{
	font-size: 30px;
}
.likeBtn{
	border: none;
	background: none;
}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/header.jsp" %>
<c:url var="contentUrl" value="cosTest">
<c:param name="idx">1</c:param>
<c:param name="likeType" value="1"></c:param>
</c:url>
<h1 class="test">코스 좋아요 테스트 페이지</h1>
<span>총 주문금액</span>
    <span>100 원</span>
    <button id="payment-button">100원 결제하기</button>
<h1 id="idx"><a href="${contentUrl}">1</a></h1>
<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
<script>
const clientKey = "test_ck_Ba5PzR0ArnJpEn1xog1rvmYnNeDM";
const customerKey = "312sadwae"; // 내 상점에서 고객을 구분하기 위해 발급한 고객의 고유 ID
const button = document.getElementById("payment-button");

const paymentWidget = PaymentWidget(clientKey, customerKey); // 회원 결제

paymentWidget.renderPaymentMethods("#payment-method", { value: 2350 });

button.addEventListener("click", function () {
	let uuid = self.crypto.randomUUID();
  paymentWidget.requestPayment({
    orderId: uuid,            // 주문 ID(직접 만들어주세요)
    orderName: "123",                 // 주문명
    successUrl: "http://localhost:9091/pay/success",  // 결제에 성공하면 이동하는 페이지(직접 만들어주세요)
    failUrl: "http://localhost:9091/pay/fail",        // 결제에 실패하면 이동하는 페이지(직접 만들어주세요)
  });
});
</script>
</html>