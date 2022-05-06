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
	<c:if test="${result == 1}">
		<script type="text/javascript">
			alert("저장되었습니다.")
			window.location.href="/adminPage/memberList";
		</script>
	</c:if>
	<%-- 상품 등록 실패 --%>
	<c:if test="${result != 1}">
		<script type="text/javascript">
			alert("저장에 실패했습니다.")
		</script>
	</c:if>
</body>
</html>