<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>검색결과</title>
	<link rel="stylesheet" href="/resources/css/product/product.css">
	<link rel="stylesheet" href="/resources/css/product/variables.css">
    <link rel="stylesheet" href="/resources/css/product/common.css">
    <link rel="stylesheet" href="/resources/css/common/header.css">
</head>
<body>
	<%@include  file="/WEB-INF/views/common/header.jsp" %>
	<%@include  file="/WEB-INF/views/product/common/search_upper.jsp" %>

	<!-- 
		<div class="text"> 
			<p class= "menuName" >   검색 결과 </p>
			<p class= "menuNameDes">검색 결과가 마음에 안드시나요? </p>
			<p class= "menuNameDes">아래 카테고리에서 찾고자하는 옷의 종류를 선택해보세요!!</p>
		</div>
	 -->

	<br>
	
	<div>
		  <img class="failMsg" src="/resources/images/product/searchFail.PNG" /> 
	</div>
</br>
	
	<!-- 	<img class="arrowImg" src="/resources/imgs/arrow.png" />  -->
</body>
</html>