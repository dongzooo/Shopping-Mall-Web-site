<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- iamport.payment.js -->
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

</head>
<body>
	<input type="hidden" name="mem_id" value="${sessionScope.memId}" />
	<h3> 결제 </h3>
	<div>상품명<br><br>${prod_name}</div>
	<div>수량<br><br>${orderQnt}</div>
	<div>상품 가격<br><br>${price}</div>
	<div>이메일</div>
	<div>
		<input type="text" id="mail" name="mail" />
	</div>
	<div>고객 이름</div>
	<div>
		<input type="text" id="receiver_name" name="receiver_name" />
	</div>
	<div>휴대전화 번호</div>
	<div>
		<input type="text" id="tel" name="receiver_tel" />
	</div>
	<div>주소</div>
	<div>
		<input type="text" id="receiver_addr" name="receiver_addr" />
	</div>
	
<button onclick="requestPay()">결제하기</button>

</body>
<script type="text/javascript">

	
	function requestPay() {
		  IMP.init('imp70055776'); //곽동주의 것이므로 공유 불가..자신의 "가맹점 식별코드"를 사용 
		  IMP.request_pay({
		    pg: "inicis",
		    pay_method: "card",
		    merchant_uid : 'merchant_'+new Date().getTime(),
		    name : '결제테스트',
		    amount : '${price}',
		    buyer_email : $(document).getElementById('mail').value,
		    buyer_name : $(document).getElementById('receiver_name').value,
		    buyer_tel : $(document).getElementById('tel').value,
		    buyer_addr : $(document).getElementById('receiver_addr').value,
		    buyer_postcode : '123-456'
		  }, function (rsp) {
			    console.log(rsp);
			    if (rsp.success) {
			      var msg = '결제가 완료되었습니다.';
			      alert(msg);
			      location.href = "결제 완료 후 이동할 페이지 url"
			    } else {
			      var msg = '결제에 실패하였습니다.';
			      msg += '에러내용 : ' + rsp.error_msg;
			      alert(msg);
			    }
		  });
		}
</script>
</html>