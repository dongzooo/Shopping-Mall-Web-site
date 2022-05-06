<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
 
    <title>delete</title>

    <!-- CSS -->
   	<link rel="preconnect" href="https://fonts.gstatic.com" />
	<link rel="preconnect" href="https://fonts.googleapis.com" />
	
	<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Sunflower:wght@300;500&display=swap" rel="stylesheet" />
    
    <link rel="stylesheet" href="/resources/css/member/delete.css">
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<main>
        <div class="delete-wrap">
            <form action="/member/delete" method="post" id="deleteForm">
                <h1>회원 탈퇴</h1>
                <br>
                
                <div class="pw-wrap">
                    <input type="password" id="pw-input" name="pw" placeholder="비밀번호를 입력해주세요."/>
                </div>
                <div class="deleteBtn-wrap">
                    <button type="submit" id="deleteBtn">회원 탈퇴</button>
                </div>
                <div class="cancelBtn-wrap">
                    <button type="button" onclick="window.location='/myPage/myPageMainMenu'" id="cancelBtn">취소</button>
                </div>
             	<%-- sec#12. 스프링시큐리티 적용시, post 요청에는 CRSF 토큰 값 보내줘야함. --%>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            </form>
        </div>
    
	
	</main>
</body>
</html>