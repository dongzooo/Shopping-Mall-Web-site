<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    
    <style>
		.row{
			margin: 20px 0;
			padding: 0 40px;
			display: flex;
			justify-content: center;
			align-items: center;
		}
		
		.container{
			display: flex;
			flex-direction: column;
			justify-content: space-around;
		}
		
		.set{
			margin: auto;
		}
	</style>
	
</head>
<body>
	<h3 align="center"> 쿠폰 지급 </h3>
	<form class="container" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<input type="hidden" name="id" id="id" value='${id}' />
		<div class="row gx-4">
			<div class="col">
				쿠폰 선택
			</div>
			<div class="col">
				<select id="coupon_num" name="coupon_num" required>
					<option value="">쿠폰 선택</option>
					<option value="4">30% 할인 쿠폰</option>
					<option value="3">50% 할인 쿠폰</option>
					<option value="2">70% 할인 쿠폰</option>
				</select>
			</div>
		</div>
		<div class="set">
			<input type="button" class="btn btn-secondary sbb" value="지급"/>
			<input type="button" class="btn btn-danger cnb" value="취소" onclick="self.close();"/>
		</div>	
	</form>
	
	<script type="text/javascript">
		$(document).ajaxSend(function(e, xhr, options) {
	        xhr.setRequestHeader( "${_csrf.headerName}", "${_csrf.token}" );
	     });
		$(document).ready(function(){
			$(document).on('click', '.set .sbb', function(){
				let coupon_num = $("#coupon_num option:selected").val();
				let idd = "${id}";
				console.log(idd);
				$.ajax({
					type : "post",
					url : "/adminPage/directCoupon",
					data : {coupon_num : coupon_num, mem_id : idd},
					async : false,
					success : function(){
						opener.parent.location.reload();
						self.close();
					},
					error : function(){
						console.log("에러 발생");
					}
				});
			});
		});
	</script>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>