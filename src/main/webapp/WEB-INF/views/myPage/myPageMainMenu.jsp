<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>page18</title>
    
    <!-- CSS -->
   	<link rel="preconnect" href="https://fonts.gstatic.com" />
	<link rel="preconnect" href="https://fonts.googleapis.com" />
    
   	<link rel="stylesheet"  href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@400&family=Gowun+Dodum&family=Sunflower:wght@300;500&display=swap"/>
    
    <link rel="stylesheet" href="https://fonts.sandbox.google.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,700,1,200" />
    
    <link rel="stylesheet" href="/resources/css/myPage/myPageMain.css">
    <link rel="stylesheet" href="/resources/css/myPage/common.css">

</head>
<body>
 	<%@ include file="/WEB-INF/views/common/header.jsp" %>	
    <main>
        <div class="admin-menu">
            <div class="title" style="font-family: 'Sunflower', sans-serif;  font-weight: 500;">MY PAGE</div>
            <div class="menu container">
                <div class="menu-group1">
                	<div class="home-btn">
                        <a href="/">
                        	<div class="menu_align">
	                            <span class="material-symbols-outlined" id="icon">home</span>        
	                            <span class="btn-box-content">HOME</span>
                            </div>
                        </a>
                    </div>
                    <div class="users-btn">
                        <a href="/adminPage/memberList">
                   	        <div class="menu_align">
								<span class="material-symbols-outlined" id="icon">list_alt</span>
	                            <span class="btn-box-content">주문내역</span>
							</div>
                        </a>
                    </div>
                    <div class="announce-btn">
                        <a href="/member/modify">
							<div class="menu_align">
								<span class="material-symbols-outlined" id="icon">update</span>
	                            <span class="btn-box-content">회원정보수정</span>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="menu-group2">
					<div class="qna-btn">			
                        <a href="/myPage/cart">
                        	<div class="menu_align">
								<span class="material-symbols-outlined" id="icon" style="margin-bottom: 0.4rem;">shopping_basket</span>
	                            <span class="btn-box-content">장바구니</span>
                            </div>
                        </a>
                    </div>
                    <div class="sns-btn">
                        <a href="/myPage/couponPoint">
							<div class="menu_align">
								<span class="material-symbols-outlined" id="icon" style="margin-bottom: 0.4rem;">savings</span>
	                            <span class="btn-box-content">보유 쿠폰</span>
	                         </div>
                        </a>
                    </div>
                    <div class="policy-btn">
                        <a href="/member/delete">
                  	        <div class="menu_align">
								<span class="material-symbols-outlined" id="icon" style="margin-bottom: 0.4rem;">delete</span>
	                            <span class="btn-box-content">회원 탈퇴</span>
							</div>
                        </a>
                    </div>
                </div>
            </div>    
        </div>
    </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>