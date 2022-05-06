<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<input type="button" id="naverPayBtn" value="네이버페이 결제 버튼">



<script src="https://nsp.pay.naver.com/sdk/js/naverpay.min.js"></script>
<script>
    var oPay = Naver.Pay.create({
          "mode" : "production", // development or production
          "clientId": "u86j4ripEt8LRfPGzQ8" // clientId
    });

    //https://developer.pay.naver.com/docs/v2/api#payments-payments_window
    //직접 만드신 네이버페이 결제버튼에 click Event를 할당하세요
    var elNaverPayBtn = document.getElementById("naverPayBtn");

    elNaverPayBtn.addEventListener("click", function() {
        oPay.open({
          "merchantUserKey": "imp70055776", //가맹점 사용자 식별키
          "merchantPayKey": "가맹점 주문 번호", //가맹점 주문 번호
          "productName": "상품명을 입력하세요", //상품명을 입력하세요
          "totalPayAmount": "1000", 
          "taxScopeAmount": "1000",
          "taxExScopeAmount": "0",
          "returnUrl":  "ss"; //redirect:/adminPage/pay/payComplete"
        });
    });

</script>

</body>
</html>