<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>signup pro</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<form action="/logout" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	</form>
	<c:if test="${result == 1}">
		<script>
			$(document).ready(function(){
				let formObj = $("form");
				alert("회원 가입이 완료되었습니다. 로그인을 진행해주세요!"); 
				formObj.submit(); 
			});
		</script>
	</c:if>
	<c:if test="${result != 1}">
		<script>
			alert("회원 가입에 실패하셨습니다.. 다시 시도해주세요!");
			history.go(-1);
		</script>
	</c:if>
</body>
</html>