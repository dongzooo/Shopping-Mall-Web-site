<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<%-- 상품 등록 성공 --%>
	<c:if test="${result == 1 && imgResult == 1}">
		<script type="text/javascript">
			alert("상품이 등록되었습니다.")
			window.location.href="/";
		</script>
	</c:if>
	<%-- 상품 등록 실패 --%>
	<c:if test="${result != 1 || imgResult != 1}">
		<script type="text/javascript">
			alert("상품 등록에 실패했습니다. 다시 등록해주세요.")
			window.location.href="/product/prodRegi";
		</script>
	</c:if>
</body>
</html>