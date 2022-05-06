<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 리뷰 등록 성공 --%>
	<c:if test="${result == 1}">
		<script type="text/javascript">
			alert("리뷰가 등록되었습니다.")
			location.href = document.referrer;
		</script>
	</c:if>
	<%-- 리뷰 등록 실패 --%>
	<c:if test="${result != 1}">
		<script type="text/javascript">
			alert("리뷰 등록에 실패했습니다.")
		</script>
	</c:if>
</body>
</html>