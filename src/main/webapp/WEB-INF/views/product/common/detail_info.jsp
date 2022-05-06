<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="goodsInfo" >
	<p class= "goodsName"> ${prod.prod_name} </p> <br> <br>
	<form action="/pay/kg">
		<input type="hidden" name="prod_num" value="${prod.prod_num}" />
		<input type="hidden" name="prod_price" value="${prod.prod_price}" />
		<input type="hidden" name="price" id="priceforPay" />
		<dl>
		    <dt> 브랜드 </dt>
		    <dd style="margin-left: 2rem; text-align: right;"> ${prod.prod_seller} </dd>
		</dl>
		<br>
		<dl>
		    <dt>배송</dt>
		    <dd>
				<select name="deliveryOption">
				    <option value="1" selected>당일 배송</option>
				    <option value="2">일반 배송</option>
				</select>
		    </dd>
		</dl>
		<br>
		<dl>
		    <dt>판매가</dt>
		    <dd><div class="salePrice">${prod.prod_price}</div></dd>
		</dl>
		<br>
		<dl>
		    <dt>수량</dt>
		    <dd><input class="orderQnt" type="text" name="orderQnt" value="1" style="text-align: right; width: 60px;"></dd>
		</dl>
		<br>
		<dl>
		    <dt>총액</dt>
		    <dd><div class="price"></div></dd>
	</dl>
	
	<br>
	<br>
	
	<button class = "buyBtn">구입하기</button>
	<%-- <button class = "cartBtn" type = "button">장바구니</button>--%>
	</form>
	
	<!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			let p = $('.salePrice').text();
			let c = $('.orderQnt').val();
			
			let res = p * c;
			$('.price').text(res);
			$(document).on('change','.orderQnt', function(){
				let c = $('.orderQnt').val();
				let res = p * c;
				$('.price').text(res);
			});
		});
	</script>
</div>