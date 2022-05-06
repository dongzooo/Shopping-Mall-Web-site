<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!-- CSS -->
<link rel="stylesheet" href="/resources/css/common/header.css">

<!-- Iconscout CDN -->
<link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">

<header>
     <nav class="top-nav">
      	<div class="logo-box" onclick="location.href='/'">
			<div class="logo-img">
			    <img src="/resources/images/atomic.png" alt="">
			</div>
			<div class="logo-title">
			    <h1>PRECYCLING</h1>
			</div>
         </div>

         <div class="btn-group">            
             <sec:authorize access="hasRole('ROLE_ADMIN')"> 
	             <a href="/adminPage/adminMainMenu">
	                 <i class="uil uil-setting"></i>
	             </a>
			 </sec:authorize>
			 
             <sec:authorize access="hasRole('ROLE_SALESCLERK')"> 
	             <a href="/sellerPage/sellerPageMainMenu">
	                 <i class="uil uil-setting"></i>
	             </a>
			 </sec:authorize>
			 
             <sec:authorize access="hasAnyRole('ROLE_MEMBER', 'ROLE_SALESCLERK')"> 
                 <a href="/myPage/myPageMainMenu">
	                 <i class="uil uil-user-circle"></i>
	             </a>
			 </sec:authorize>
			 
             <sec:authorize access="isAnonymous()"> 
	             <a href="/member/login">
	                  <i class="uil uil-sign-in-alt"></i>
	             </a>
             </sec:authorize>
             
             <sec:authorize access="isAuthenticated()">              
				<a href="/myPage/cart">
				    <i class="uil uil-shopping-cart-alt"></i>
				</a>
				
             	<form action="/logout" method="post" id="logoutFrm">
					<%-- sec#12. 스프링시큐리티 적용시, post 요청에는 CRSF 토큰 값 보내줘야함. --%>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					
					<a href="#" onclick="loginOutSubmit()">
						<i class="uil uil-sign-out-alt"></i>
					</a>
				</form>
             </sec:authorize>
         </div> 
     </nav>
 </header>
 
<script>
	function loginOutSubmit() {
		document.getElementById('logoutFrm').submit();
	}
</script>

