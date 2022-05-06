<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<div class="goodsImgs"   >
	  <c:forEach items="${result}" var="item" varStatus="status">
	 		<c:if test="${item.img_is_thumbnail eq 'y'}">
					<img class="goodsImg" id="goodsImg" src="/resources/save/${item.img_file_name}" /> 
	 		</c:if>
	  </c:forEach>
	  <ul class="goodsImgSide">
		  <c:forEach items="${result}" var="item" varStatus="status">
				<c:if test="${item.img_is_thumbnail eq 'n'}">
				 	<li> <img class="sideImg" src="/resources/save/${item.img_file_name}"/></li>
	 			</c:if>
		  </c:forEach>
	</ul>
	<input type="hidden" id="prod_num" />

    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		const img = $('.goodsImg').attr('src');
		$('.sideImg').hover(function(){
			let temp = $(this).attr('src');
			$('.goodsImg').attr('src', temp);
		}, function(){
			console.log(img);
			$('.goodsImg').attr('src', img);
		});
	</script>
</div>
