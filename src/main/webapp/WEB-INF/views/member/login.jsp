<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
 
    <title>Document</title>

  	 <!-- CSS -->
   	<link rel="preconnect" href="https://fonts.gstatic.com" />
	<link rel="preconnect" href="https://fonts.googleapis.com" />
	
	<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Sunflower:wght@300;500&display=swap" rel="stylesheet" />
     
    <link rel="stylesheet" href="/resources/css/member/login.css">
    
   	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>	    
    <main>
        <div class="login-wrap">
            <form action="/login" method="post" id="loginForm">
                <h1>로그인</h1>
                
                <div class="id-wrap">
                    <input type="text" id="id-input" name="username" placeholder="아이디"/>
                </div>
                <div class="pw-wrap">
                    <input type="password" id="pw-input" name="password" placeholder="비밀번호"/>
                </div>
                <div class="loginBtn-wrap">
                    <button type="submit" id="loginBtn">로그인</button>
                </div>
                <div class="signUp-wrap">
                    <button type="button" onclick="location.href='/member/signup'" id="signUp">회원 가입</button>
                </div>
             	<%-- sec#12. 스프링시큐리티 적용시, post 요청에는 CRSF 토큰 값 보내줘야함. --%>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            </form>
        </div>
    </main>
</body>
</html>